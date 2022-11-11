<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value="/resources/js/chart/colors.js"/>"></script>
<script>
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
		defaultValue: moment().format('YYYY-MM-DD')
	});

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

 	$("#searchDailyDate").click(function() {
		IBCalendar.Show($(this).val(), {
			"CallBack": function(date) {
				let beforeDate = $("#searchDailyDate").val();
                $("#searchDailyDate").val(date);

                if(beforeDate != date) {
                	fnRetrieve();
                }
			},
			"Format": "Ymd",
			"Target": $("#searchDailyDate")[0],
			"CalButtons": "InputEmpty|Today|Close"
		});
	});
}


$("#btnMonthlyCal").click(function() {
	$("#searchDailyDate").trigger("click");
});

//change event
$("#btnMonthlyCal").change(function() {
	fnRetrieve();
});

function fnRetrieve() {

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
	var initData = {
			"chart": {
				"type": "column",
				"animation": true
		   	 },
			 /*   "colors": ["#DDDDDD", "#ADADAD", "#5C5A5B", "#DFE3E4", "#B7BCBF", "#7C858A", "#E9E4E4", "#CCC5C3", "#A19594", "#E8E7E2", "#C4C1BC", "#7A7067", "#C9C9CB", "#898989", "#62676B",
				   "#F1F2FF", "#BDD8E7", "#6AAFD2", "#3081BD", "#07509B", "#E590D1", "#C96DBD", "#A03D99", "#2CF9FF", "#72DAE6", "#23B2E0", "#7A7ABB", "#C80D9B", "#EAAFBC", "#C17A86"], */
				 /*   "colors": ["#DDDDDD", "#ADADAD", "#5C5A5B", "#DFE3E4", "#B7BCBF", "#7C858A", "#E9E4E4", "#CCC5C3", "#A19594", "#E8E7E2", "#C4C1BC", "#7A7067", "#C9C9CB", "#898989", "#62676B",
					   "#EAAFBC", "#C17A86", "#F1F2FF","#BDD8E7","#07509B","#C96DBD","#E590D1","#6AAFD2","#3081BD", "#A03D99", "#2CF9FF", "#72DAE6", "#23B2E0", "#7A7ABB", "#C80D9B"], */
					   "colors": ["#928B85", "#ACA89F", "#C4C1BC", "#D7D4CD", "#E8E7E3", "#807675", "#A19694", "#B3ABA9", "#CCC5C3", "#DDD7D7", "#EAE4E4", "#898989", "#ADADAD", "#C9C9CB", "#DDDDDD",
	                       "#C80D9B", "#721029", "#E6CDEB", "#F468D6", "#9F5EBD",  "#77299E", "#7A7ABB", "#2CF9FF", "#72DAE6", "#23B2E0", "#F1F2FF", "#BDD8E7", "#6AAFD2", "#3081BD", "#07509B"],
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
                    "borderColor":"#CBCED9"
				},
				"Cfg" : {
					"MergeSheet": msHeaderOnly ,HeaderSort :0 ,SearchMode:0
				},
				"HeaderMode" : {"Sort": 0},
				   "Cols": [
								{Header:"플랫폼|플랫폼",	Type:"Text",   	Align:"Center",   SaveName:"pltfomNm",	MinWidth:100, Edit:"0" },
						   ],
				 "series": [
						{
						},
							]
	};

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
			if(beforePlateNm == result.dailyList[i].plateNm){
				initData.xAxis.categories.push(result.dailyList[i].cmplDt.substring(4,6)+"월"+result.dailyList[i].cmplDt.substring(6,8)+"일");
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

		//플랫폼 조회쿼리 쿼리
		/* if (result.dailyList.length == 23 && i == 21){
			var pastDayData = {name : "작년/"+beforePlateNm , data : pastCntList, stack : "group1"};
			var dayData = {name : "올해/"+beforePlateNm, data : dayCntList, stack : "group2"};
			pastData.push(pastDayData);
			toDayData.push(dayData);
			initData.colors = ["#A6DEFD","#FEB1BE"];
		} */
	}

	//문자열 중복 제거
	var deduplication = [];
	for(v of initData.xAxis.categories) {
		if (!deduplication.includes(v)) deduplication.push(v);
	}

	initData.xAxis.categories = deduplication;

	daySeriesData.push(pastData);
 	for(var i =0; i < toDayData.length; i++){
 		daySeriesData[0].push(toDayData[i])
	}
	initData.series = daySeriesData[0];

 	//플랫폼별 검색하면
	if($("select[name=searchPltfomCd] option:selected").text() != "선택해주세요"){
		initData.colors = ["#A6DEFD","#FEB1BE"];
	}

	//차트 그리기
	plateChart.setOptions(initData);
	plateChart.loadSearchData(initData, {append: true});

	//그리드 그리기
	IBS_InitSheet(plateSheet,initData);


	for(var i = 0 ; i < deduplication.length; i++){
		plateSheet.ColInsert({
			'Header': {'Text': deduplication[i].replace(/(^0+)/, "")+"|작년", Align: "Center"},
				Col:[{
					'Type': 'Float',
					'MinWidth': 52,
					'Width': 52,
					'SaveName': result.dayDateList[i].monthDay,
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
					'SaveName': result.dayDateList[i].monthDay,
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
	var initData = {
			"chart": {
				"type": "column",
				"animation": true
		   	 },
			 /*   "colors": ["#DDDDDD", "#ADADAD", "#5C5A5B", "#DFE3E4", "#B7BCBF", "#7C858A", "#E9E4E4", "#CCC5C3", "#A19594", "#E8E7E2", "#C4C1BC", "#7A7067", "#C9C9CB", "#898989", "#62676B",
				   "#F1F2FF", "#BDD8E7", "#6AAFD2", "#3081BD", "#07509B", "#E590D1", "#C96DBD", "#A03D99", "#2CF9FF", "#72DAE6", "#23B2E0", "#7A7ABB", "#C80D9B", "#EAAFBC", "#C17A86"], */
				 /*   "colors": ["#DDDDDD", "#ADADAD", "#5C5A5B", "#DFE3E4", "#B7BCBF", "#7C858A", "#E9E4E4", "#CCC5C3", "#A19594", "#E8E7E2", "#C4C1BC", "#7A7067", "#C9C9CB", "#898989", "#62676B",
					   "#EAAFBC", "#C17A86", "#F1F2FF","#BDD8E7","#07509B","#C96DBD","#E590D1","#6AAFD2","#3081BD", "#A03D99", "#2CF9FF", "#72DAE6", "#23B2E0", "#7A7ABB", "#C80D9B"], */
					   "colors": ["#928B85", "#ACA89F", "#C4C1BC", "#D7D4CD", "#E8E7E3", "#807675", "#A19694", "#B3ABA9", "#CCC5C3", "#DDD7D7", "#EAE4E4", "#898989", "#ADADAD", "#C9C9CB", "#DDDDDD",
	                       "#C80D9B", "#721029", "#E6CDEB", "#F468D6", "#9F5EBD",  "#77299E", "#7A7ABB", "#2CF9FF", "#72DAE6", "#23B2E0", "#F1F2FF", "#BDD8E7", "#6AAFD2", "#3081BD", "#07509B"],
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
                    "borderColor":"#CBCED9"
				},
				"Cfg" : {
					"MergeSheet": msHeaderOnly ,HeaderSort :0 ,SearchMode:0
				},
				"HeaderMode" : {"Sort": 0},
				   "Cols": [
								{Header:"플랫폼|플랫폼",	Type:"Text",   	Align:"Center",   SaveName:"pltfomNm",	MinWidth:100, Edit:"0" },
						   ],
				 "series": [
						{
						},
							]
	};



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
			}
			if(beforePlateNm == result.weeklyList[i].plateNm){
				initData.xAxis.categories.push(result.weeklyList[i].weekCha + "주차");
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
	for(v of initData.xAxis.categories) {
		if (!deduplication.includes(v)) deduplication.push(v);
	}

	initData.xAxis.categories = deduplication;

	weekSeriesData.push(pastData);
 	for(var i =0; i < toDayData.length; i++){
 		weekSeriesData[0].push(toDayData[i])
	}

	initData.series = weekSeriesData[0];

 	//플랫폼별 검색하면
	if($("select[name=searchPltfomCd] option:selected").text() != "선택해주세요"){
		initData.colors = ["#A6DEFD","#FEB1BE"];
	}

	//차트 그리기
	plateChart.setOptions(initData);
	plateChart.loadSearchData(initData, {append: true});

	//그리드 그리기
	IBS_InitSheet(plateSheet,initData);

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
	var cntMonthDay =0;
	if(11 == result.monthList.length){
		cntMonthDay = 24;
	}
	else{
		cntMonthDay = 25;
	}
	var initData = {
			"chart": {
				"type": "column",
				"animation": true
		   	 },
			 /*   "colors": ["#DDDDDD", "#ADADAD", "#5C5A5B", "#DFE3E4", "#B7BCBF", "#7C858A", "#E9E4E4", "#CCC5C3", "#A19594", "#E8E7E2", "#C4C1BC", "#7A7067", "#C9C9CB", "#898989", "#62676B",
				   "#F1F2FF", "#BDD8E7", "#6AAFD2", "#3081BD", "#07509B", "#E590D1", "#C96DBD", "#A03D99", "#2CF9FF", "#72DAE6", "#23B2E0", "#7A7ABB", "#C80D9B", "#EAAFBC", "#C17A86"], */
				   "colors": ["#928B85", "#ACA89F", "#C4C1BC", "#D7D4CD", "#E8E7E3", "#807675", "#A19694", "#B3ABA9", "#CCC5C3", "#DDD7D7", "#EAE4E4", "#898989", "#ADADAD", "#C9C9CB", "#DDDDDD",
                       "#C80D9B", "#721029", "#E6CDEB", "#F468D6", "#9F5EBD",  "#77299E", "#7A7ABB", "#2CF9FF", "#72DAE6", "#23B2E0", "#F1F2FF", "#BDD8E7", "#6AAFD2", "#3081BD", "#07509B"],

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
					"borderColor":"#CBCED9"
				},
				"Cfg" : {
					"MergeSheet": msHeaderOnly ,HeaderSort :0 ,SearchMode:0
				},
				"HeaderMode" : {"Sort": 0},
				   "Cols": [
								{Header:"플랫폼|플랫폼",	Type:"Text",   	Align:"Center",   SaveName:"pltfomNm", "RowSpan": 2, MinWidth:100, Edit:"0" },
						   ],
				 "series": [
						{
						},
							]
	};

	//날짜 넣기 X축
	for(var i= 0; i < result.monthList.length; i++){
		var month = result.monthList[i].cmplDt +"월";
		initData.xAxis.categories.push(month);
	};

	let monthSeriesData = [];
	let pastData = [];
	let toYearData = [];
	var monthCount = 0;
	//홀짝 변수
	var oddEven = 1;

	for(var i=0; i < result.ngsPlateList.length; i++){
		var pastMonthData = {name : "", data : [], stack : "group1"};
		var monthData = {name : "", data : [], stack : "group2"};
		monthData.name = "올해/"+result.ngsPlateList[i].plateNm;
		pastMonthData.name =  "작년/"+result.ngsPlateList[i].plateNm;
		for(var j= 0; j < 24; j++){
			if(result.monthlyChartList[monthCount] != undefined){
		 		if(oddEven%2 == 0){
		 			monthData.data.push(result.monthlyChartList[monthCount].cmplCnt);
				}
				else{
					pastMonthData.data.push(result.monthlyChartList[monthCount].cmplCnt);
				}
		 		oddEven ++;
		 		monthCount ++;
			}
			else{
				break;
			}
		};
		pastData.push(pastMonthData);
		toYearData.push(monthData);
	}



	monthSeriesData.push(pastData);
 	for(var i =0; i < result.ngsPlateList.length; i++){
 		monthSeriesData[0].push(toYearData[i])
	}

	if(result.ngsPlateList.length == 1){
		initData.colors = ["#A6DEFD","#FEB1BE"];
	}

	initData.series = monthSeriesData[0];
/*
	console.log(monthSeriesData[0]);
	console.log(initData); */


	//차트 그리기
	plateChart.setOptions(initData);
	plateChart.loadSearchData(initData, {append: true});

	IBS_InitSheet(plateSheet,initData);
	for(var i = 0 ; i < 12; i++){
		plateSheet.ColInsert({
			'Header': {'Text': result.monthList[i].cmplDt.replace(/(^0+)/, "")+"월|작년" , Align: "Center"},
				Col:[{
					'Type': 'Float',
					'MinWidth': 52,
					'Width': 52,
					'SaveName': result.monthList[i].cmplDt,
					'Format': "0.#",
					'Edit' : '0',
					'Align':'Left',
				}]
		});
		plateSheet.ColInsert({
			'Header': {'Text': result.monthList[i].cmplDt.replace(/(^0+)/, "")+"월|올해" , Align: "Center"},
				Col:[{
					'Type': 'Float',
					'MinWidth': 52,
					'Width': 52,
					'SaveName': result.monthList[i].cmplDt,
					'Format': "0.#",
					'Edit' : '0',
					'Align':'Left',
				}]
		});
	}

	var data = new Array();
	for(var i = 0; i < result.ngsPlateList.length; i++){
		var subData = {};
		subData["pltfomNm"] = result.ngsPlateList[i].plateNm;
		data[i] = subData;
	}

	plateSheet.LoadSearchData({"data": data}, {Sync: 1});

	count = 0;
	var row = 2;
	for(var i = 0 ; i < result.monthlyGreedList.length; i++){
		for(j=0; j < cntMonthDay; j++){
			if(count != result.monthlyGreedList.length){
				var cmplCnt = 0;
				if(result.monthlyGreedList[count].plateNm != plateSheet.GetCellValue(row, 0)){
					plateSheet.SetCellValue(row, j+1 , 0);
					plateSheet.SetCellAlign(row, j+1, 'Right');
					row++;
					break;
				}
				else{
					cmplCnt = result.monthlyGreedList[count].cmplCnt;
				}
				plateSheet.SetCellValue(row, j+1 , cmplCnt);
				plateSheet.SetCellAlign(row, j+1, 'Right');
				count = count+1;
	   		}
	   		else{
	   			break;
	   		}
		}
	}
	/* plateSheet.setAutoResize(); */
	//pivot 데이타 설정
	plateSheet.ShowPivotTable({
		Rows: "pltfomNm"
	});
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
								<span class="label calendar-label">조회기준월</span>
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
									<li class="option-toggle-list"><input type="radio" name="statType" id="statType01" value="monthly" class="option-toggle-radio input-hidden"><label for="statType01" class="option-toggle-btn btn size-sm">월</label></li>
									<li class="option-toggle-list"><input type="radio" name="statType" id="statType02" value="weekly"  checked="checked" class="option-toggle-radio input-hidden"><label for="statType02" class="option-toggle-btn btn size-sm">주</label></li>
									<li class="option-toggle-list"><input type="radio" name="statType" id="statType03" value="daily"  class="option-toggle-radio input-hidden"><label for="statType03" class="option-toggle-btn btn size-sm">일</label></li>
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
				<div class="leftBox">
					<div class="search-btn-wrap f-right">
						<div class="search-btn-box">
							<div class="vertical-bar-sm vertical-only-right"></div>
							<%-- <button type="button" class="btn btn-search-sm bg-primary" id="btnSearch"><spring:message code='word.inquiry'/></button> --%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- 검색영역 -->
	<div id="div_all" style="margin-top: 15px;">
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
		<div class="sh_box">
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