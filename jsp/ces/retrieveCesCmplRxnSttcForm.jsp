<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="<c:url value="/resources/chartjs/chartjsUtil.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/chart/colors.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/comm/common.js"/>"></script>
<script>
	function fnOnload() {
		//ib chart 정의 시작
		var initData = {
			"chart": {
				"type": "column",
				"animation": true
			},
			"plotOptions" : {
				"series": {
					"stacking": "normal",
					"dataLabels": {
						"enabled": false,
						"align": "center"
					}
				}
			},
			"legend" : {
				"borderColor":"#CBCED9"
			},
            "tooltip": {
                "shared": true
            }
		};

		createIBChart("divAllChart", "divAllChart", {
			width : "100%",
			height : "100%"
		});
		divAllChart.setOptions(initData);

		createIBChart("divKrChart", "divKrChart", {
			width : "100%",
			height : "100%"
		});
		divKrChart.setOptions(initData);

		createIBChart("divFrChart", "divFrChart", {
			width : "100%",
			height : "100%"
		});
		divFrChart.setOptions(initData);
		//ib chart 정의 종료

		$('#searchMonth').IBMaskEdit('yyyy-MM', {
			defaultValue: moment().format('YYYY-MM')
		});

		let searchCntyDivNmUI = {
			ComboCode : "||국내|해외",
			ComboText : "|전체|국내|해외",
			ComboUseYn : "|Y|Y|Y",
		}
		$("#searchCntyDivNmUI").addCommonRadioOptions({
			"radioName": "searchCntyDivNm", // [필수]라디오버튼 Name 속성 값
			"radioData": searchCntyDivNmUI, // [필수]데이터
			"defaultValue": "" // [선택]기본 선택 값
		});

		fndataToggle("searchCntyDivNmUI");

		fnSetEvent();
		fnRetrieve();

		chartResize();
		window.addEventListener('resize', chartResize);
	}

	function chartResize() {
		var chart = document.getElementsByClassName('chart-area');
		//337
		var h = (window.innerHeight - 360) < CHART_MIN_HEIGHT ? CHART_MIN_HEIGHT : (window.innerHeight - 360);

	    for(var i = 0; i < chart.length; i++){
		    chart[i].style.height =  h + 'px';
	    }
	}

	function fndataToggle(value) {
		$("#"+value+" > li").addClass('option-toggle-list')
		$("#"+value+" > li > input").addClass("option-toggle-radio input-hidden")
		$("#"+value+" > li > label").addClass("option-toggle-btn btn size-sm")
	}

	function fnSetEvent() {

		$("#btnMonthlyCal").click(function() {
			IBCalendar.Show($(this).val(), {
				"CallBack": function(date) {
					let beforeDate = $("#searchMonth").val().replace(/[^0-9]/gi, '');
					let current = moment().format("YYYYMM");
					let selectedDate = date.replace(/[^0-9]/gi, '');

					if(current < selectedDate) {
						selectedDate = current;
						alert(ERR_SEARCH_DATE);
					}

					$("#searchMonth").val(selectedDate);

					if(beforeDate != selectedDate) {
						fnRetrieve();
					}
				},
				"Format": "Ym",
				"Target": $("#searchMonth")[0],
				"CalButtons": "InputEmpty|Today|Close"
			});
		});

		$("#searchMonth").click(function() {
			$("#btnMonthlyCal").trigger("click");
		});

		// 검색버튼
		$('#btnSearch').click(function() {
			fnRetrieve();
		});

		//change event
		$("input[name=searchCntyDivNm]").change(function() {
			fnRetrieve();
		});
	}

	function fnRetrieve() {
		var statType =  $("input[name=searchCntyDivNm]:checked").val();

		if(statType == ""){
			$("#div_all").show();
			$("#div_kr").hide();
			$("#div_fr").hide();
		}else if(statType == "국내"){
			$("#div_all").hide();
			$("#div_kr").show();
			$("#div_fr").hide();
		}else if(statType == "해외"){
			$("#div_all").hide();
			$("#div_kr").hide();
			$("#div_fr").show();
		}

		new CommonAjax("/dshBr/ces/retrieveCesCmplRxnSttc.do")
				.addParam(cesSttcSrchForm)
				.callback(function(result) {
					if(statType == ""){
						fnRetrieveAllChart(result.result);
					}
					else if(statType == "국내") {
						fnRetrieveKrChart(result.result);
					}
					else if(statType == "해외") {
						fnRetrieveFrChart(result.result);
					}
				})
				.execute();
	}

	function fnMakeMonth(yyyymm, monthLen) {
		let rtn = [];
		let base = moment(yyyymm.replace(/[^0-9]/gi, ''), 'YYYYMM');
		let baseYear = base.format("YYYY");

		for(let i=0; i<monthLen; i++) {
			let calMonth = base.clone().subtract(i, 'months');

			if(calMonth.format("YYYY") != baseYear) {
				baseYear = calMonth.format("YYYY");
			}

			if(calMonth.format('MM') == '01' || i == (monthLen - 1)) {
				rtn.push(calMonth.format('YYYY년 M월'));
			}
			else {
				rtn.push(calMonth.format('M월'));
			}
		}

		rtn.reverse();
		return rtn;
	}

	function fnMakeData(dataObj, labelObj) {
		let rtn = [];

		for (const [key, value] of Object.entries(dataObj)) {
			for(let i=0; i<labelObj.length; i++) {
				if(labelObj[i] === key) {
					rtn.push(Number(value));
				}
			}
		}

		return rtn;
	}

	function fnRetrieveAllChart(dataSet) {
		let dataChanger = chartjsUtil.dataChanger;
		let srchDate = moment($("#searchMonth").val().replace(/[^0-9]/gi, ''), 'YYYYMM');

		//테이블 작업
		let tableDataSet = dataChanger.init()
				.setBaseColumn('cmplDt')
				.setDataset(dataSet)
				.setIncludeColumns({
					"befTot" : srchDate.clone().subtract(1, 'year').format('YYYY'),
					"aftTot" : srchDate.format('YYYY')
				}, 'gubun')
				.build();

		//ibsheet 작업
		if(window.ibAllPivot != undefined) {
			ibAllPivot.Reset();
		}

		createIBSheet2(document.getElementById('divAllPivot'), "ibAllPivot", "100%", "130px");
		IBS_InitSheet(ibAllPivot, {
			"Cfg" : {
				"SizeMode": 1,
				'HeaderRowHeight':12,
				"MergeSheet": msHeaderOnly,
				"HeaderRowHeight":"28",
				"DataRowHeight":"28"
			},
			"HeaderMode" : {},
			"Cols": [
				//시트 헤더 중앙정렬 안되는 문제가 있어서 임의로 넣어둠
				{Header:"Name",	Type:"Text",	Align:"Center",		SaveName:"Name",	MaxWidth:60, 	Width:60,	Hidden:"1",	 Edit:'1', Class:"ibs-right-bor"}
			]
		});

		//ib sheet count 제거
		ibAllPivot.SetCountPosition(0);

		//contextmenu 제거
		ibAllPivot.SetActionMenu("*-");
		ibAllPivot.SetHeaderActionMenu("*-");

		//컬럼 생성
		ibAllPivot.ColInsert({
			'Header': {'Text': '년도'},
			'Col': [
				{'Type': 'Text', 'MinWidth': 80, 'Width': 80, 'SaveName': 'gubun', 'Edit' : '0', 'Align':'Center'}
			]
		});

		let changedMonthArr = fnMakeMonth($("#searchMonth").val(), dataChanger.getDataColumnLength());
		let idx = 0;
		for (const [key, value] of Object.entries(tableDataSet[0])) {
			if(key != 'cmplDt' && key != 'gubun') {
				ibAllPivot.ColInsert({
					'Header': {'Text': changedMonthArr[idx]},
					Col:[{
						'Type': 'Float',
						'MinWidth': 60,
						'Width': 60,
						'SaveName': key,
						'Edit' : '0',
						'Align':'Right'
					}]
				});
				idx++;
			}
		}

		//데이터 넣기
		for(let i=0; i<tableDataSet.length; i++) {
			let row = ibAllPivot.DataInsert(0);
			ibAllPivot.SetCellValue(row, "gubun", tableDataSet[i].gubun);

			let item = tableDataSet[i];
			for (const [key, value] of Object.entries(item)) {
				if(key != 'cmplDt' && key != 'gubun') {
					ibAllPivot.SetCellValue(row, key, value);
				}
			}
		}

		ibAllPivot.FitColWidth();

		//차트그리기
		let changedDataSet = dataChanger.init()
				.setBaseColumn('cmplDt')
				.setDataset(dataSet)
				.setIncludeColumns({
					"befTot" : "작년/전체",
					"aftTot" : "올해/전체"
				}, 'gubun')
				.build();

		let ibDataSet = [];
		for(let i=0; i<changedDataSet.length; i++) {
			let tmp = {};
			tmp.data = fnMakeData(changedDataSet[i], dataChanger.getLables());
			tmp.name = changedDataSet[i].gubun;
			tmp.stack = 'group' + (i + 1);
			tmp.type = 'line';
			tmp.color = COLOR_TYPE_03[i + 2];

			ibDataSet.push(tmp);
		}

		let chartSetting = {
			"xAxis" : {
				"categories": fnMakeMonth($("#searchMonth").val(), dataChanger.getDataColumnLength())
			},
			"yAxis": {
				"title": {
					"text": ""
				}
			},
			"series": ibDataSet
		}

		divAllChart.loadSearchData(chartSetting, {
			append: true
		});
	}

	function fnRetrieveKrChart(dataSet) {
		let dataChanger = chartjsUtil.dataChanger;
		let srchDate = moment($("#searchMonth").val().replace(/[^0-9]/gi, ''), 'YYYYMM');

		//테이블 작업
		let tableDataSet = dataChanger.init()
				.setBaseColumn('cmplDt')
				.setDataset(dataSet)
				.setIncludeColumns({
					"befKr" : srchDate.clone().subtract(1, 'year').format('YYYY'),
					"aftKr" : srchDate.format('YYYY')
				}, 'gubun')
				.build();

		//ibsheet 작업
		if(window.ibKrPivot != undefined) {
			ibKrPivot.Reset();
		}

		createIBSheet2(document.getElementById('divKrPivot'), "ibKrPivot", "100%", "130px");
		IBS_InitSheet(ibKrPivot, {
			"Cfg" : {
				"SizeMode": 1,
				'HeaderRowHeight':12,
				"MergeSheet": msHeaderOnly,
				"HeaderRowHeight":"28",
				"DataRowHeight":"28"
			},
			"HeaderMode" : {},
			"Cols": [
				//시트 헤더 중앙정렬 안되는 문제가 있어서 임의로 넣어둠
				{Header:"Name",	Type:"Text",	Align:"Center",		SaveName:"Name",	MaxWidth:60, 	Width:60,	Hidden:"1",	 Edit:'1', Class:"ibs-right-bor"}
			]
		});

		//ib sheet count 제거
		ibKrPivot.SetCountPosition(0);

		//contextmenu 제거
		ibKrPivot.SetActionMenu("*-");
		ibKrPivot.SetHeaderActionMenu("*-");

		//컬럼 생성
		ibKrPivot.ColInsert({
			'Header': {'Text': '년도'},
			'Col': [
				{'Type': 'Text', 'MinWidth': 80, 'Width': 80, 'SaveName': 'gubun', 'Edit' : '0', 'Align':'Center'}
			]
		});

		let changedMonthArr = fnMakeMonth($("#searchMonth").val(), dataChanger.getDataColumnLength());
		let idx = 0;
		for (const [key, value] of Object.entries(tableDataSet[0])) {
			if(key != 'cmplDt' && key != 'gubun') {
				ibKrPivot.ColInsert({
					'Header': {'Text': changedMonthArr[idx]},
					Col:[{
						'Type': 'Float',
						'MinWidth': 60,
						'Width': 60,
						'SaveName': key,
						'Edit' : '0',
						'Align':'Right'
					}]
				});
				idx++;
			}
		}

		//데이터 넣기
		for(let i=0; i<tableDataSet.length; i++) {
			let row = ibKrPivot.DataInsert(0);
			ibKrPivot.SetCellValue(row, "gubun", tableDataSet[i].gubun);

			let item = tableDataSet[i];
			for (const [key, value] of Object.entries(item)) {
				if(key != 'cmplDt' && key != 'gubun') {
					ibKrPivot.SetCellValue(row, key, value);
				}
			}
		}

		ibKrPivot.FitColWidth();

		//차트그리기
		let changedDataSet = dataChanger.init()
				.setBaseColumn('cmplDt')
				.setDataset(dataSet)
				.setIncludeColumns({
					"befKr" : "작년/국내",
					"aftKr" : "올해/국내",
				}, 'gubun')
				.build();

		let ibDataSet = [];
		for(let i=0; i<changedDataSet.length; i++) {
			let tmp = {};
			tmp.data = fnMakeData(changedDataSet[i], dataChanger.getLables());
			tmp.name = changedDataSet[i].gubun;

			switch(changedDataSet[i].cmplDt) {
				case 'befKr' :
					tmp.stack = 'group01';
					tmp.type = 'line';
					tmp.color = NAMED_COLOR_TYPE_03.BEFORE_LINE
					break;
				case 'aftKr' :
					tmp.stack = 'group02';
					tmp.type = 'line';
					tmp.color = NAMED_COLOR_TYPE_03.AFTER_LINE
					break;
			}

			ibDataSet.push(tmp);
		}

		let chartSetting = {
			"xAxis" : {
				"categories": fnMakeMonth($("#searchMonth").val(), dataChanger.getDataColumnLength())
			},
			"yAxis": {
				"title": {
					"text": ""
				}
			},
			"series": ibDataSet
		}

		divKrChart.loadSearchData(chartSetting, {
			append: true
		});
	}

	function fnRetrieveFrChart(dataSet) {
		let dataChanger = chartjsUtil.dataChanger;
		let srchDate = moment($("#searchMonth").val().replace(/[^0-9]/gi, ''), 'YYYYMM');

		//테이블 작업
		let tableDataSet = dataChanger.init()
				.setBaseColumn('cmplDt')
				.setDataset(dataSet)
				.setIncludeColumns({
					"befFr" : srchDate.clone().subtract(1, 'year').format('YYYY'),
					"aftFr" : srchDate.format('YYYY')
				}, 'gubun')
				.build();

		//ibsheet 작업
		if(window.ibFrPivot != undefined) {
			ibFrPivot.Reset();
		}

		createIBSheet2(document.getElementById('divFrPivot'), "ibFrPivot", "100%", "130px");
		IBS_InitSheet(ibFrPivot, {
			"Cfg" : {
				"SizeMode": 1,
				'HeaderRowHeight':12,
				"MergeSheet": msHeaderOnly,
				"HeaderRowHeight":"28",
				"DataRowHeight":"28"
			},
			"HeaderMode" : {},
			"Cols": [
				//시트 헤더 중앙정렬 안되는 문제가 있어서 임의로 넣어둠
				{Header:"Name",	Type:"Text",	Align:"Center",		SaveName:"Name",	MaxWidth:60, 	Width:60,	Hidden:"1",	 Edit:'1', Class:"ibs-right-bor"}
			]
		});

		//ib sheet count 제거
		ibFrPivot.SetCountPosition(0);

		//contextmenu 제거
		ibFrPivot.SetActionMenu("*-");
		ibFrPivot.SetHeaderActionMenu("*-");

		//컬럼 생성
		ibFrPivot.ColInsert({
			'Header': {'Text': '년도'},
			'Col': [
				{'Type': 'Text', 'MinWidth': 80, 'Width': 80, 'SaveName': 'gubun', 'Edit' : '0', 'Align':'Center'}
			]
		});

		let changedMonthArr = fnMakeMonth($("#searchMonth").val(), dataChanger.getDataColumnLength());
		let idx = 0;
		for (const [key, value] of Object.entries(tableDataSet[0])) {
			if(key != 'cmplDt' && key != 'gubun') {
				ibFrPivot.ColInsert({
					'Header': {'Text': changedMonthArr[idx]},
					Col:[{
						'Type': 'Float',
						'MinWidth': 60,
						'Width': 60,
						'SaveName': key,
						'Edit' : '0',
						'Align':'Right'
					}]
				});
				idx++;
			}
		}

		//데이터 넣기
		for(let i=0; i<tableDataSet.length; i++) {
			let row = ibFrPivot.DataInsert(0);
			ibFrPivot.SetCellValue(row, "gubun", tableDataSet[i].gubun);

			let item = tableDataSet[i];
			for (const [key, value] of Object.entries(item)) {
				if(key != 'cmplDt' && key != 'gubun') {
					ibFrPivot.SetCellValue(row, key, value);
				}
			}
		}

		ibFrPivot.FitColWidth();

		//차트그리기
		let changedDataSet = dataChanger.init()
				.setBaseColumn('cmplDt')
				.setDataset(dataSet)
				.setIncludeColumns({
					"befFr" : "작년/해외",
					"aftFr" : "올해/해외",
				}, 'gubun')
				.build();

		let ibDataSet = [];
		for(let i=0; i<changedDataSet.length; i++) {
			let tmp = {};
			tmp.data = fnMakeData(changedDataSet[i], dataChanger.getLables());
			tmp.name = changedDataSet[i].gubun;

			switch(changedDataSet[i].cmplDt) {
				case 'befFr' :
					tmp.stack = 'group01';
					tmp.type = 'line';
					tmp.color = NAMED_COLOR_TYPE_03.BEFORE_LINE;
					break;
				case 'aftFr' :
					tmp.stack = 'group02';
					tmp.type = 'line';
					tmp.color = NAMED_COLOR_TYPE_03.AFTER_LINE;
					break;
			}

			ibDataSet.push(tmp);
		}

		let chartSetting = {
			"xAxis" : {
				"categories": fnMakeMonth($("#searchMonth").val(), dataChanger.getDataColumnLength())
			},
			"yAxis": {
				"title": {
					"text": ""
				}
			},
			"series": ibDataSet
		}

		divFrChart.loadSearchData(chartSetting, {
			append: true
		});
	}

</script>
<div class="content">
	<!-- 검색영역 -->
	<form class="form-inline form-control-static" action="" id="cesSttcSrchForm" name="cesSttcSrchForm">
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
									<input type="text" name="searchMonth" id="searchMonth" class="input input-sm input-calendar date_type1" required="<spring:message code='word.regist.start.date'/>"/>
									<button type="button" class="icon-calendar btn-calendar" id="btnMonthlyCal"></button>
								</div>
							</div>
						</li>
						<li class="search-menu-list">
							<div class="option-toggle-wrap-data">
								<span class="label">구분</span>
								<ul class="checkStyleCh option-toggle-wrap" id="searchCntyDivNmUI"></ul>
							</div>
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
					<div class="w100 chart-area">
						<div id="divAllChart">
						</div>
					</div>
				</section>
				<!-- // 그리드 레이아웃 추가 -->
			</div>
		</div>
		<div class="sh_box mt-16">
			<!-- 그리드 레이아웃 추가 -->
			<div class="grid_wrap gridType3">
				<section>
					<div class="w100">
						<div id='divAllPivot'>
						</div>
					</div>
				</section>
				<!-- // 그리드 레이아웃 추가 -->
			</div>
		</div>
	</div>
	<div id="div_kr" >
		<div class="sh_box">
			<!-- 그리드 레이아웃 추가 -->
			<div class="grid_wrap gridType3">
				<section>
					<div class="w100 chart-area">
						<div id="divKrChart">
						</div>
					</div>
				</section>
				<!-- // 그리드 레이아웃 추가 -->
			</div>
		</div>
		<div class="sh_box mt-16">
			<!-- 그리드 레이아웃 추가 -->
			<div class="grid_wrap gridType3">
				<section>
					<div class="w100">
						<div id='divKrPivot'>
						</div>
					</div>
				</section>
				<!-- // 그리드 레이아웃 추가 -->
			</div>
		</div>
	</div>

	<div id="div_fr" >
		<div class="sh_box">
			<!-- 그리드 레이아웃 추가 -->
			<div class="grid_wrap gridType3">
				<section>
					<div class="w100 chart-area">
						<div id="divFrChart">
						</div>
					</div>
				</section>
				<!-- // 그리드 레이아웃 추가 -->
			</div>
		</div>
		<div class="sh_box mt-16">
			<!-- 그리드 레이아웃 추가 -->
			<div class="grid_wrap gridType3">
				<section>
					<div class="w100">
						<div id='divFrPivot'>
						</div>
					</div>
				</section>
				<!-- // 그리드 레이아웃 추가 -->
			</div>
		</div>
	</div>
</div>