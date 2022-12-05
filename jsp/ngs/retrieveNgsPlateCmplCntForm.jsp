<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value="/resources/js/chart/colors.js"/>"></script>
<script>
let oldVal = '';

function fnOnload() {
	createIBSheet2($("#divGreed").get(0), "plateSheet", "100%", "550px");
	createIBChart("divChart", "plateChart", {width: "100%",	height: "600px"});

	// 플랫폼 콤보박스
	var objCmmnCmbCodes = new CommonSheetComboCodes()
	.addGroupCode({"groupCode": "SRVC_DOMN_CD", 	"includedNotUse" : false }) /*SRVC_DOMN_CD : 서비스구분코드*/
	.addGroupCode({"groupCode": "PLTFOM_CD", 		"includedNotUse" : false }) /*PLTFOM_CD : 플랫폼*/
	.execute();

 	$("#searchPltfomCd").addCommonSelectOptions({
		"comboData": objCmmnCmbCodes["PLTFOM_CD"],
		"required": true
	});

 	$('#searchDailyDate').IBMaskEdit('yyyy-MM-dd', {
 		defaultValue: moment().subtract("1","days").format('YYYY-MM-DD')
	});


	oldVal = $("#searchDailyDate").val();

	fndataToggle("searchNgsTypeNmUI");

	function fndataToggle(value) {
		$("#"+value+" > li").addClass('option-toggle-list')
		$("#"+value+" > li > input").addClass("option-toggle-radio input-hidden")
		$("#"+value+" > li > label").addClass("option-toggle-btn btn size-sm")
	}

	fnSetEvent();
	fnRetrieve();
}

function fnSetEvent() {
	//change event
	$("input[name=statType]").change(function() {
		fnRetrieve();
	});
 	$("#searchPltfomCd").change(function() {
		if($("select[name=searchPltfomCd] option:selected").text() == "선택해주세요"){
			$("#searchPltfomNm").val("");
			fnRetrieve();
		}
		else{
			$("#searchPltfomNm").val($("select[name=searchPltfomCd] option:selected").text());
			fnRetrieve();
		}
	});

 	// 달력
 	$("#searchDailyDate").click(function() {
		IBCalendar.Show($(this).val(), {
			"CallBack": function(date) {
				if(date != ''){
					let currDate = moment().subtract("1","days").format('YYYYMMDD');
					if(Number(date.replace(/\//g,'')) > currDate ){
						alert("아직 해당 기간의 데이터가 등록되지 않았습니다. 가장 최근 데이터를 조회합니다.");
						$("#searchDailyDate").val(currDate);
						fnRetrieve();
					}else{
						$("#searchDailyDate").val(date);
						fnRetrieve();
					}
				}
				else{
					$("#searchDailyDate").val("");
					return true;
				}
			},
			"Format": "Ymd",
			"Target": $("#searchDailyDate")[0],
			"CalButtons": "InputEmpty"
		});
	});

 	$("#btnMonthlyCal").click(function() {
 		$("#searchDailyDate").trigger("click");
 	});

 	//change event
 	$("#btnMonthlyCal").change(function() {
 		fnRetrieve();
 	});

 	//달력 실시간 체인지 이벤트
 	$("#searchDailyDate").on("change keyup paste", function() {
 	    var currentVal = $(this).val();
 	    let currDate = moment().subtract("1","days").format('YYYYMMDD');
 	    if($("#searchDailyDate").val().indexOf('_') == -1){
 	    	let date = currentVal.replace(/\-/g,'');
 			if(date > currDate ){
 				alert("아직 해당 기간의 데이터가 등록되지 않았습니다. 가장 최근 데이터를 조회합니다.");
 				$("#searchDailyDate").val(currDate);
 				fnRetrieve();
 			}else{
 				$("#searchDailyDate").val(date);
 				fnRetrieve();
 			}
 	    }
 	});
}

//한국 시간 구하기
function koreaNow(){
	const curr = new Date();
	const utc = curr.getTime() + (curr.getTimezoneOffset() * 60 * 1000);
	const KR_TIME_DIFF = 9 * 60 * 60 * 1000;
	const korea = new Date(utc + (KR_TIME_DIFF));
	const month = korea.getMonth()+1;
	const koreaTime = ""+korea.getFullYear()+""+month+""+korea.getDate();
	return koreaTime;
}

function initData(){
	const initData = {
			"chart": {
				"type": "column",
				"animation": true
		   	 },
			 /*   "colors": ["#928B85", "#ACA89F", "#C4C1BC", "#D7D4CD", "#E8E7E3", "#807675", "#A19694", "#B3ABA9", "#CCC5C3", "#DDD7D7", "#EAE4E4", "#898989", "#ADADAD", "#C9C9CB", "#DDDDDD",
					  "#C80D9B", "#721029", "#E6CDEB", "#F468D6", "#9F5EBD",  "#77299E", "#7A7ABB", "#2CF9FF", "#72DAE6", "#23B2E0", "#F1F2FF", "#BDD8E7", "#6AAFD2", "#3081BD", "#07509B"], */
					  "colors": [
						  "#D9E2D7", "#E7ECE0", "#E7EADF", "#F4F4E8", "#F0F8FD", "#E2F0FB", "#E0EEF9", "#DDEBF6", "#D0E5F5", "#C2DDF3", "#B7D0E5", "#A8BDD2", "#99ACBF", "#808DA0", "#636D7C",
						  "#CAE2C3", "#DCECC9", "#E6EDD1", "#F4F3CE", "#E3F2FD", "#BBDEFB", "#90CAF9", "#64B5F6", "#42A5F5", "#2196F3", "#1E88E5", "#1976D2", "#1565C0",  "#0D47A1", "#183B7F"],
			   "xAxis": {
					"categories": []
				},
				"yAxis": {
					"title": {
						"text": ""

					}
				},
				"title": {
					"text": "",
					"style": {
						"color": "#15498B",
						"fontFamily": "Dotum",
						"fontWeight": "bold",
						"fontSize": "13px"
					}
				},
				"plotOptions": {
					"series": {
						"stacking": "normal",
						"dataLabels": {
							"enabled": true,
							"align": "center"
						}
					}
				},
				"legend": {
					"align": "center",
					"verticalAlign": "bottom",
					"layout": "horizontal",
					"backgroundColor" : "#FFFFFE",
					"floating": false,
					"borderColor":"#CBCED9"/* ,
					"reversed" : true */
				},
				"Cfg" : {
 					"SizeMode": 1,
					'HeaderRowHeight':12,
					"MergeSheet": msHeaderOnly,
					"HeaderRowHeight":"28",
					"DataRowHeight":"28"
					/* "MergeSheet": msHeaderOnly ,HeaderSort :0 ,SearchMode:0 */
				},
				"HeaderMode" : {Align: "Center"},
				   "Cols": [
								{Header:"플랫폼|플랫폼",	Type:"Text",   	Align:"left",   SaveName:"pltfomNm",	MinWidth:100, Edit:"0" },
						   ],
				 "series": [
						{
						},
							]
	};
	return initData;
}

function fnRetrieve() {
	/* $.blockUI(); */
	var statType = $("input[name='statType']:checked").val();
	new CommonAjax("/dshBr/ngs/retrieveNgsPlateCmplCnt.do")
		.addParam(ngsPlateSrchForm)
		.callback(function(result) {
			plateSheet.Reset();
			plateChart.removeAll(false);
			if(statType =='daily'){
				fnRetrieveDaily(result);
			}
			else if(statType =='weekly'){
				fnRetrieveWeekly(result);
			}
			else if(statType =='monthly'){
				fnRetrieveMonthly(result);
			}
		})
		.execute();
}

//일별 검색
function fnRetrieveDaily(result) {
	//initData넣기
	var dayInitData = initData();
	//일별 차트 그리기
	var beforePlateNm = '';
	var pastCntList = [];
	var dayCntList = [];
	let daySeriesData = [];
	let pastData = [];
	let toDayData = [];

	for(var i=0; i < result.dailyList.length; i++){
		if(i == 0){
			beforePlateNm = result.dailyList[0].plateNm;
		}
		//플레이트가 같으면 탄다.
		if(beforePlateNm == result.dailyList[i].plateNm){
			//작년인지 현재인지 분기 처리
			if(result.dailyList[i].sortSeq == "0"){
				pastCntList.push(result.dailyList[i].cmplCnt);
			}else{
				dayCntList.push(result.dailyList[i].cmplCnt);
			}

			// X축 일수 넣어주기.
			if(beforePlateNm == result.dailyList[i].plateNm){
				dayInitData.xAxis.categories.push(result.dailyList[i].sortSeq1+","+result.dailyList[i].cmplDt.substring(4,6)+"월"+result.dailyList[i].cmplDt.substring(6,8)+"일");
			}

			//마지막 플레이트 처리
			if(i == result.dailyList.length-1){
				var pastDayData = {name : "작년/"+beforePlateNm , data : pastCntList, stack : "group1"};
				var dayData = {name : "올해/"+beforePlateNm, data : dayCntList, stack : "group2"};

				pastData.push(pastDayData);
				toDayData.push(dayData);
				break;
			}
		}else{
			var pastDayData = {name : "작년/"+beforePlateNm , data : pastCntList, stack : "group1"};
			var dayData = {name : "올해/"+beforePlateNm, data : dayCntList, stack : "group2"};
			pastData.push(pastDayData);
			toDayData.push(dayData);
			pastCntList = [];
			dayCntList = [];

			//Befroe plate 값 넣어주기
			beforePlateNm = result.dailyList[i].plateNm;

			//작년인지 현재인지 분기 처리
			if(result.dailyList[i].sortSeq == "0"){
				pastCntList.push(result.dailyList[i].cmplCnt);
			}else{
				dayCntList.push(result.dailyList[i].cmplCnt);
			}
		}

	}

	//문자열 중복 제거
	var deduplication = [];
	for(v of dayInitData.xAxis.categories) {
		if (!deduplication.includes(v)) deduplication.push(v);
	}

	//차트 X축에 작년데이터 (일) 넣기
	let pastCount = 0;
	let toDayCount = 0;
	deduplication.forEach(function(item, index){
		if(pastCount == 0){
			if(item.substring(0,1) == 0){
				let sliceDay = item.substring(2,8);
				deduplication[index] = $("#searchDailyDate").val().substring(0,4)-1 +"년 "+sliceDay;
				pastCount++;
				return true;
			}
		}
		if(toDayCount == 0){
			if(item.substring(0,1) == 1){
				let sliceDay = item.substring(2,8);
				deduplication[index] = $("#searchDailyDate").val().substring(0,4) +"년 "+sliceDay;
				toDayCount++;
				return true;
			}
		}
		deduplication[index] = item.substring(2,8);
	});

	dayInitData.xAxis.categories = deduplication;

	daySeriesData.push(pastData);
 	for(var i =0; i < toDayData.length; i++){
 		daySeriesData[0].push(toDayData[i])
	}
	dayInitData.series = daySeriesData[0];

 	//플랫폼별 검색하면
	if($("select[name=searchPltfomCd] option:selected").text() != "선택해주세요"){
		dayInitData.colors = ["#A6DEFD","#FEB1BE"];
	}

	//차트 그리기
	plateChart.setOptions(dayInitData);
	plateChart.loadSearchData(dayInitData, {append: true});

	//그리드 그리기
	IBS_InitSheet(plateSheet,dayInitData);

	//ib sheet count 제거
	plateSheet.SetCountPosition(0);


	for(var i = 0 ; i < deduplication.length; i++){
		plateSheet.ColInsert({
			'Header': {'Text': deduplication[i].replace(/(^0+)/, "")+"|작년", Align: "Center"},
				Col:[{
					'Type': 'Float',
					'MinWidth': 52,
					'Width': 52,
					'SaveName': result.dailyList[i].monthDay,
					'Format': "0.#",
					'Edit' : '0',
					'Align':'Left',
				}]
		});
		plateSheet.ColInsert({
			'Header': {'Text': deduplication[i].replace(/(^0+)/, "")+"|올해" , Align: "Center"},
				Col:[{
					'Type': 'Float',
					'MinWidth': 52,
					'Width': 52,
					'SaveName': result.dailyList[i].monthDay,
					'Format': "0.#",
					'Edit' : '0',
					'Align':'Left',
				}]
		});
	}

	var beforePlateNm = "";
	var row = 2;
	var cell = 0;
	for(var i = 0; i < result.dailyList.length; i++){
 		if(i == 0){
			beforePlateNm = result.dailyList[i].plateNm;
			plateSheet.DataInsert(0);
		}
	 	if(beforePlateNm == result.dailyList[i].plateNm){
			if(cell == 0){
				plateSheet.SetCellValue(row, cell , result.dailyList[i].plateNm);
				plateSheet.SetCellValue(row, cell+1 , result.dailyList[i].cmplCnt);
				plateSheet.SetCellAlign(row, cell+1, 'Right');
				cell = cell+2;
			}
			else{
				plateSheet.SetCellValue(row, cell, result.dailyList[i].cmplCnt);
				plateSheet.SetCellAlign(row, cell, 'Right');
				//맨마지막 0처리
				if(i == result.dailyList.length-1){
					plateSheet.SetCellValue(row, cell+1 , 0);
					plateSheet.SetCellAlign(row, cell+1, 'Right');
					break;
				}
				cell ++;
			}
		}
		else{
			plateSheet.SetCellValue(row, cell , 0);
			plateSheet.SetCellAlign(row, cell, 'Right');
			row ++;
			cell = 0;
			plateSheet.DataInsert(-1);
			plateSheet.SetCellValue(row, cell , result.dailyList[i].plateNm);
			plateSheet.SetCellValue(row, cell+1 , result.dailyList[i].cmplCnt);
			plateSheet.SetCellAlign(row, cell+1, 'Right');
			cell = cell+2;
			beforePlateNm = result.dailyList[i].plateNm;
		}
	}
}

//주별 조회
function fnRetrieveWeekly(result) {
	//initData넣기
	var weekInitData = initData();

	//일별 차트 그리기
	var beforePlateNm = '';
	var pastCntList = [];
	var dayCntList = [];
	let weekSeriesData = [];
	let pastData = [];
	let toDayData = [];

	for(var i=0; i < result.weeklyList.length; i++){
		if(i == 0){
			beforePlateNm = result.weeklyList[0].plateNm;
		}
		//플레이트가 같으면 탄다.
		if(beforePlateNm == result.weeklyList[i].plateNm){
			//작년인지 현재인지 분기 처리
			if(result.weeklyList[i].sortSeq == "0"){
				pastCntList.push(result.weeklyList[i].cmplCnt);
			}else{
				dayCntList.push(result.weeklyList[i].cmplCnt);
				weekInitData.xAxis.categories.push(result.weeklyList[i].sortSeq1+","+result.weeklyList[i].weekNm);
			}
			//마지막 플레이트 처리
			if(i == result.weeklyList.length-1){
				var pastDayData = {name : "작년/"+beforePlateNm , data : pastCntList, stack : "group1"};
				var dayData = {name : "올해/"+beforePlateNm, data : dayCntList, stack : "group2"};

				pastData.push(pastDayData);
				toDayData.push(dayData);
				break;
			}
		}else{
			var pastDayData = {name : "작년/"+beforePlateNm , data : pastCntList, stack : "group1"};
			var dayData = {name : "올해/"+beforePlateNm, data : dayCntList, stack : "group2"};
			pastData.push(pastDayData);
			toDayData.push(dayData);
			pastCntList = [];
			dayCntList = [];

			//Befroe plate 값 넣어주기
			beforePlateNm = result.weeklyList[i].plateNm;

			//작년인지 현재인지 분기 처리
			if(result.weeklyList[i].sortSeq == "0"){
				pastCntList.push(result.weeklyList[i].cmplCnt);
			}else{
				dayCntList.push(result.weeklyList[i].cmplCnt);
			}
		}
	}

	//문자열 중복 제거
	var deduplication = [];
	for(v of weekInitData.xAxis.categories) {
		if (!deduplication.includes(v)) deduplication.push(v);
	}

	//차트 X축에 작년데이터 (주) 넣기
	let pastCount = 0;
	let toDayCount = 0;
	deduplication.forEach(function(item, index){
		if(pastCount == 0){
			if(item.substring(0,1) == 0){
				let sliceDay = item.substring(2, 15);
				deduplication[index] = $("#searchDailyDate").val().substring(0,4)-1 +"년 "+sliceDay;
				pastCount++;
				return true;
			}
		}
		if(toDayCount == 0){
			if(item.substring(0,1) == 1){
				let sliceDay = item.substring(2, 15);
				deduplication[index] = $("#searchDailyDate").val().substring(0,4) +"년 "+sliceDay;
				toDayCount++;
				return true;
			}
		}
		deduplication[index] = item.substring(2,15);
	});

	weekInitData.xAxis.categories = deduplication;

	weekSeriesData.push(pastData);
 	for(var i =0; i < toDayData.length; i++){
 		weekSeriesData[0].push(toDayData[i])
	}

	weekInitData.series = weekSeriesData[0];

 	//플랫폼별 검색하면
	if($("select[name=searchPltfomCd] option:selected").text() != "선택해주세요"){
		weekInitData.colors = ["#A6DEFD","#FEB1BE"];
	}

	//차트 그리기
	plateChart.setOptions(weekInitData);
	plateChart.loadSearchData(weekInitData, {append: true});

	//그리드 그리기
	IBS_InitSheet(plateSheet,weekInitData);

	//ib sheet count 제거
	plateSheet.SetCountPosition(0);


	for(var i = 0 ; i < deduplication.length; i++){
		plateSheet.ColInsert({
			'Header': {'Text': deduplication[i].replace(/(^0+)/, "")+"|작년", Align: "Center"},
				Col:[{
					'Type': 'Float',
					'MinWidth': 52,
					'Width': 52,
					'SaveName': result.weeklyList[i].weekCha,
					'Format': "0.#",
					'Edit' : '0',
					'Align':'Left',
				}]
		});
		plateSheet.ColInsert({
			'Header': {'Text': deduplication[i].replace(/(^0+)/, "")+"|올해" , Align: "Center"},
				Col:[{
					'Type': 'Float',
					'MinWidth': 52,
					'Width': 52,
					'SaveName': result.weeklyList[i].weekCha,
					'Format': "0.#",
					'Edit' : '0',
					'Align':'Left',
				}]
		});
	}

	var beforePlateNm = "";
	var row = 2;
	var cell = 0;
	for(var i = 0; i < result.weeklyList.length; i++){
 		if(i == 0){
			beforePlateNm = result.weeklyList[i].plateNm;
			plateSheet.DataInsert(0);
		}
	 	if(beforePlateNm == result.weeklyList[i].plateNm){
			if(cell == 0){
				plateSheet.SetCellValue(row, cell , result.weeklyList[i].plateNm);
				plateSheet.SetCellValue(row, cell+1 , result.weeklyList[i].cmplCnt);
				plateSheet.SetCellAlign(row, cell+1, 'Right');
				cell = cell+2;
			}
			else{
				plateSheet.SetCellValue(row, cell, result.weeklyList[i].cmplCnt);
				plateSheet.SetCellAlign(row, cell, 'Right');
				//맨마지막 0처리
				if(i == result.weeklyList.length-1){
					plateSheet.SetCellValue(row, cell+1 , 0);
					plateSheet.SetCellAlign(row, cell+1, 'Right');
					break;
				}
				cell ++;
			}
		}
		else{
			plateSheet.SetCellValue(row, cell , 0);
			plateSheet.SetCellAlign(row, cell, 'Right');
			row ++;
			cell = 0;
			plateSheet.DataInsert(-1);
			plateSheet.SetCellValue(row, cell , result.weeklyList[i].plateNm);
			plateSheet.SetCellValue(row, cell+1 , result.weeklyList[i].cmplCnt);
			plateSheet.SetCellAlign(row, cell+1, 'Right');
			cell = cell+2;
			beforePlateNm = result.weeklyList[i].plateNm;
		}
	}
}

//월별 조회
function fnRetrieveMonthly(result) {
	//initData넣기
	var monthInitData = initData();

	//일별 차트 그리기
	var beforePlateNm = '';
	var pastCntList = [];
	var dayCntList = [];
	let monthSeriesData = [];
	let pastData = [];
	let toDayData = [];

	for(var i=0; i < result.monthlyList.length; i++){
		if(i == 0){
			beforePlateNm = result.monthlyList[0].plateNm;
		}
		//플레이트가 같으면 탄다.
		if(beforePlateNm == result.monthlyList[i].plateNm){
			//작년인지 현재인지 분기 처리
			if(result.monthlyList[i].sortSeq == "0"){
				pastCntList.push(result.monthlyList[i].cmplCnt);
			}else{
				dayCntList.push(result.monthlyList[i].cmplCnt);
			}
			if(beforePlateNm == result.monthlyList[i].plateNm){
				monthInitData.xAxis.categories.push(result.monthlyList[i].sortSeq1+","+result.monthlyList[i].month + "월");
			}

			//마지막 플레이트 처리
			if(i == result.monthlyList.length-1){
				var pastDayData = {name : "작년/"+beforePlateNm , data : pastCntList, stack : "group1"};
				var dayData = {name : "올해/"+beforePlateNm, data : dayCntList, stack : "group2"};

				pastData.push(pastDayData);
				toDayData.push(dayData);
				break;
			}
		}else{
			var pastDayData = {name : "작년/"+beforePlateNm , data : pastCntList, stack : "group1"};
			var dayData = {name : "올해/"+beforePlateNm, data : dayCntList, stack : "group2"};
			pastData.push(pastDayData);
			toDayData.push(dayData);
			pastCntList = [];
			dayCntList = [];

			//Befroe plate 값 넣어주기
			beforePlateNm = result.monthlyList[i].plateNm;

			//작년인지 현재인지 분기 처리
			if(result.monthlyList[i].sortSeq == "0"){
				pastCntList.push(result.monthlyList[i].cmplCnt);
			}else{
				dayCntList.push(result.monthlyList[i].cmplCnt);
			}
		}
	}

	//문자열 중복 제거
	var deduplication = [];
	for(v of monthInitData.xAxis.categories) {
		if (!deduplication.includes(v)) deduplication.push(v);
	}

	//차트 X축에 작년데이터 (년) 넣기
	let pastCount = 0;
	let toDayCount = 0;
	deduplication.forEach(function(item, index){
			if(pastCount == 0){
				if(item.substring(0,1) == 0){
					let sliceDay = item.substring(2,5);
					deduplication[index] = $("#searchDailyDate").val().substring(0,4)-1 +"년 "+sliceDay;
					pastCount++;
					return true;
				}
			}
			if(toDayCount == 0){
				if(item.substring(0,1) == 1){
					let sliceDay = item.substring(2,5);
					deduplication[index] = $("#searchDailyDate").val().substring(0,4) +"년 "+sliceDay;
					toDayCount++;
					return true;
				}
			}
		deduplication[index] = item.substring(2,5);
	});

	monthInitData.xAxis.categories = deduplication;

	monthSeriesData.push(pastData);
 	for(var i =0; i < toDayData.length; i++){
 		monthSeriesData[0].push(toDayData[i])
	}


	monthInitData.series = monthSeriesData[0];

 	//플랫폼별 검색하면
	if($("select[name=searchPltfomCd] option:selected").text() != "선택해주세요"){
		monthInitData.colors = ["#A6DEFD","#FEB1BE"];
	}

	//차트 그리기
	plateChart.setOptions(monthInitData);
	plateChart.loadSearchData(monthInitData, {append: true});

	//그리드 그리기
	IBS_InitSheet(plateSheet,monthInitData);

	//ib sheet count 제거
	plateSheet.SetCountPosition(0);


	for(var i = 0 ; i < deduplication.length; i++){
		plateSheet.ColInsert({
			'Header': {'Text': deduplication[i].replace(/(^0+)/, "")+"|작년", Align: "Center"},
				Col:[{
					'Type': 'Float',
					'MinWidth': 52,
					'Width': 52,
					'SaveName': result.monthlyList[i].month,
					'Format': "0.#",
					'Edit' : '0',
					'Align':'Left',
				}]
		});
		plateSheet.ColInsert({
			'Header': {'Text': deduplication[i].replace(/(^0+)/, "")+"|올해" , Align: "Center"},
				Col:[{
					'Type': 'Float',
					'MinWidth': 52,
					'Width': 52,
					'SaveName': result.monthlyList[i].month,
					'Format': "0.#",
					'Edit' : '0',
					'Align':'Left',
				}]
		});
	}

	var beforePlateNm = "";
	var row = 2;
	var cell = 0;
	for(var i = 0; i < result.monthlyList.length; i++){
 		if(i == 0){
			beforePlateNm = result.monthlyList[i].plateNm;
			plateSheet.DataInsert(0);
		}
	 	if(beforePlateNm == result.monthlyList[i].plateNm){
			if(cell == 0){
				plateSheet.SetCellValue(row, cell , result.monthlyList[i].plateNm);
				plateSheet.SetCellValue(row, cell+1 , result.monthlyList[i].cmplCnt);
				plateSheet.SetCellAlign(row, cell+1, 'Right');
				cell = cell+2;
			}
			else{
				plateSheet.SetCellValue(row, cell, result.monthlyList[i].cmplCnt);
				plateSheet.SetCellAlign(row, cell, 'Right');
				//맨마지막 0처리
				if(i == result.monthlyList.length-1){
					plateSheet.SetCellValue(row, cell+1 , 0);
					plateSheet.SetCellAlign(row, cell+1, 'Right');
					break;
				}
				cell ++;
			}
		}
		else{
			plateSheet.SetCellValue(row, cell , 0);
			plateSheet.SetCellAlign(row, cell, 'Right');
			row ++;
			cell = 0;
			plateSheet.DataInsert(-1);
			plateSheet.SetCellValue(row, cell , result.monthlyList[i].plateNm);
			plateSheet.SetCellValue(row, cell+1 , result.monthlyList[i].cmplCnt);
			plateSheet.SetCellAlign(row, cell+1, 'Right');
			cell = cell+2;
			beforePlateNm = result.monthlyList[i].plateNm;
		}
	}
}
</script>
<div class="content">
	<form class="form-inline form-control-static" action="" id="ngsPlateSrchForm" name="ngsPlateSrchForm">
		<div class="fixed-search-cont">
			<div class="title-info">
				<!-- 타이틀/위치정보 -->
				<h2 class="headline">${activeMenu.menuNm}</h2>
				<!-- //타이틀/위치정보 -->
			</div>
			<!-- 검색영역 -->
			<div class="search-menu-wrap flex-box flex-j-sb">
				<div class="search-menu-row-wrap">
					<ul class="search-menu-row">
						<li class="search-menu-list">
							<div class="label-wrap">
								<span class="label calendar-label">조회 일자</span>
								<div class="input-calendar-wrap">
										<input type="text" name="searchDailyDate" id="searchDailyDate" class="input input-sm input-calendar date_type1" required="<spring:message code='word.regist.start.date'/>"/>
									<button type="button" class="icon-calendar btn-calendar" id="btnMonthlyCal"></button>
								</div>
							</div>
						</li>
						<li class="search-menu-list">
							<div class="option-toggle-wrap-data">
								<span class="label">구분</span>
								<ul class="checkStyleCh option-toggle-wrap" id="searchNgsTypeNmUI">
									<li class="option-toggle-list"><input type="radio" name="statType" id="statType01" value="monthly" checked="checked" class="option-toggle-radio input-hidden"><label for="statType01" class="option-toggle-btn btn size-sm">월</label></li>
									<li class="option-toggle-list"><input type="radio" name="statType" id="statType02" value="weekly"   class="option-toggle-radio input-hidden"><label for="statType02" class="option-toggle-btn btn size-sm">주</label></li>
									<li class="option-toggle-list"><input type="radio" name="statType" id="statType03" value="daily"   class="option-toggle-radio input-hidden"><label for="statType03" class="option-toggle-btn btn size-sm">일</label></li>
								</ul>
							</div>
						</li>
						<li class="search-menu-list label-wrap">
							<span class="label dropdown-label"><spring:message code='word.pltfom'/></span><!-- 서비스 -->
							<select name="searchPltfomCd" id="searchPltfomCd" class="dropdown dropdown-lg"></select>
							<input type="hidden" id='searchPltfomNm' name='searchPltfomNm' />
						</li>
					</ul>
				</div>
			</div>
		</div>
	</form>

	<!-- 검색영역 -->
	<div id="div_all" >
		<div class="sh_box">
			<!-- 그리드 레이아웃 추가 -->
			<div class="grid_wrap gridType3">
				<section>
					<div class="w100">
						<div id='divChart'></div>
					</div>
				</section>
			<!-- // 그리드 레이아웃 추가 -->
			</div>
		</div>
		<div class="sh_box mt-16" >
			<!-- 그리드 레이아웃 추가 -->
			<div class="grid_wrap gridType3">
				<section>
					<div class="w100">
						<div id='divGreed'></div>
					</div>
				</section>
		<!-- // 그리드 레이아웃 추가 -->
			</div>
		</div>
	</div>
</div>