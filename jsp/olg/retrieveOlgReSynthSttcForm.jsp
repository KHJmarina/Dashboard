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
		"yAxis": {
			"labels" : {
				"format": "{value}%"
			}
		},
		"legend" : {
			"borderColor":"#CBCED9"
		},
        "tooltip": {
            "shared": true,
            "valueSuffix": '%',
            "valueDecimals": 2
        }
	};

	createIBChart("divAllChart", "divAllChart", {
		width : "100%",
		height : "100%"
	});
	divAllChart.setOptions(initData);

	createIBChart("divStdChart", "divStdChart", {
		width : "100%",
		height : "100%"
	});
	divStdChart.setOptions(initData);

	createIBChart("divModiChart", "divModiChart", {
		width : "100%",
		height : "100%"
	});
	divModiChart.setOptions(initData);
	//ib chart 정의 종료

	$('#searchMonth').IBMaskEdit('yyyy-MM', {
		defaultValue: moment().format('YYYY-MM')
	});

	let searchOlgTypeNmUI = {
		ComboCode : "||Standard|Modified",
		ComboText : "|전체|일반|특수",
		ComboUseYn : "|Y|Y|Y",
	}
    $("#searchOlgTypeNmUI").addCommonRadioOptions({
        "radioName": "searchOlgTypeNm", // [필수]라디오버튼 Name 속성 값
        "radioData": searchOlgTypeNmUI, // [필수]데이터
        "defaultValue": "" // [선택]기본 선택 값
    });

	fndataToggle("searchOlgTypeNmUI");

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
    $("input[name=searchOlgTypeNm]").change(function() {
    	fnRetrieve();
    });
}

function fnRetrieve() {
  	var statType =  $("input[name=searchOlgTypeNm]:checked").val();

	if(statType == ""){ //일별조회
		$("#div_all").show();
		$("#div_std").hide();
		$("#div_modi").hide();
	}else if(statType == "Standard"){ //주별
		$("#div_all").hide();
		$("#div_std").show();
		$("#div_modi").hide();
	}else if(statType == "Modified"){ //월별
		$("#div_all").hide();
		$("#div_std").hide();
		$("#div_modi").show();
	}

    new CommonAjax("/dshBr/olg/retrieveOlgReSynthSttc.do")
	  .addParam(olgSttcSrchForm)
	  .callback(function(result) {
		  if(statType == ""){
			  fnRetrieveAllChart(result.result);
		  }
		  else if(statType == "Standard") {
			  fnRetrieveStdChart(result.result);
		  }
		  else if(statType == "Modified") {
			  fnRetrieveModiChart(result.result);
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
	   .setBaseColumn('acpgDt')
	   .setDataset(dataSet)
	   .setIncludeColumns({
		  "befTotOlgReRt" : srchDate.clone().subtract(1, 'year').format('YYYY'),
		  "aftTotOlgReRt" : srchDate.format('YYYY')
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
    	if(key != 'acpgDt' && key != 'gubun') {
    		ibAllPivot.ColInsert({
			    'Header': {'Text': changedMonthArr[idx]},
			    Col:[{
			        'Type': 'Float',
			        'MinWidth': 60,
			        'Width': 60,
			        'SaveName': key,
			        'Edit' : '0',
			        'Align':'Right',
			        "Format" : "0.00 \\%"
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
			if(key != 'acpgDt' && key != 'gubun') {
				ibAllPivot.SetCellValue(row, key, value);
			}
		}
	}

	ibAllPivot.FitColWidth();

	//차트그리기
	let changedDataSet = dataChanger.init()
	   .setBaseColumn('acpgDt')
	   .setDataset(dataSet)
	   .setIncludeColumns({
		  "befTotOlgReRt" : "작년/전체",
		  "aftTotOlgReRt" : "올해/전체"
	   }, 'gubun')
	   .build();

	let loopCnt = changedDataSet.length;
	for(let i=0; i<loopCnt; i++) {
		changedDataSet.push(changedDataSet[i]);
	}

	let ibDataSet = [];
	for(let i=0; i<changedDataSet.length; i++) {
		let tmp = {};
		tmp.data = fnMakeData(changedDataSet[i], dataChanger.getLables());
		tmp.name = changedDataSet[i].gubun;
		tmp.stack = 'group' + (i + 1);

		if(i >= changedDataSet.length / 2) {
			tmp.type = 'line';
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
    	"series": ibDataSet,
    	"colors" : COLOR_TYPE_03
	}

	divAllChart.loadSearchData(chartSetting, {
		append: true
	});
}

function fnRetrieveStdChart(dataSet) {
	let dataChanger = chartjsUtil.dataChanger;
	let srchDate = moment($("#searchMonth").val().replace(/[^0-9]/gi, ''), 'YYYYMM');

	//테이블 작업
	let tableDataSet = dataChanger.init()
	   .setBaseColumn('acpgDt')
	   .setDataset(dataSet)
	   .setIncludeColumns({
		  "befTotOlgReRt" : srchDate.clone().subtract(1, 'year').format('YYYY'),
		  "aftTotOlgReRt" : srchDate.format('YYYY')
	   }, 'gubun')
	   .build();

	//ibsheet 작업
	if(window.ibStdPivot != undefined) {
		ibStdPivot.Reset();
	}

	createIBSheet2(document.getElementById('divStdPivot'), "ibStdPivot", "100%", "130px");
    IBS_InitSheet(ibStdPivot, {
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
    ibStdPivot.SetCountPosition(0);

	//contextmenu 제거
	ibStdPivot.SetActionMenu("*-");
	ibStdPivot.SetHeaderActionMenu("*-");

    //컬럼 생성
    ibStdPivot.ColInsert({
    	'Header': {'Text': '년도'},
    	'Col': [
    		{'Type': 'Text', 'MinWidth': 80, 'Width': 80, 'SaveName': 'gubun', 'Edit' : '0', 'Align':'Center'}
    	]
    });

    let changedMonthArr = fnMakeMonth($("#searchMonth").val(), dataChanger.getDataColumnLength());
    let idx = 0;
    for (const [key, value] of Object.entries(tableDataSet[0])) {
    	if(key != 'acpgDt' && key != 'gubun') {
    		ibStdPivot.ColInsert({
			    'Header': {'Text': changedMonthArr[idx]},
			    Col:[{
			        'Type': 'Float',
			        'MinWidth': 60,
			        'Width': 60,
			        'SaveName': key,
			        'Edit' : '0',
			        'Align':'Right',
			        "Format" : "0.00 \\%"
			    }]
    		});
	    	idx++;
    	}
    }

    //데이터 넣기
	for(let i=0; i<tableDataSet.length; i++) {
		let row = ibStdPivot.DataInsert(0);
		ibStdPivot.SetCellValue(row, "gubun", tableDataSet[i].gubun);

		let item = tableDataSet[i];
		for (const [key, value] of Object.entries(item)) {
			if(key != 'acpgDt' && key != 'gubun') {
				ibStdPivot.SetCellValue(row, key, value);
			}
		}
	}

	ibStdPivot.FitColWidth();

	//차트그리기
	let changedDataSet = dataChanger.init()
	   .setBaseColumn('acpgDt')
	   .setDataset(dataSet)
	   .setIncludeColumns({
		  "befStdOlgReRt" : "작년/일반",
		  "aftStdOlgReRt" : "올해/일반",
		  "befTotOlgReRt" : "작년/일반",
		  "aftTotOlgReRt" : "올해/일반"
	   }, 'gubun')
	   .build();

	let ibDataSet = [];
	for(let i=0; i<changedDataSet.length; i++) {
		let tmp = {};
		tmp.data = fnMakeData(changedDataSet[i], dataChanger.getLables());
		tmp.name = changedDataSet[i].gubun;

		switch(changedDataSet[i].acpgDt) {
			case 'befStdOlgReRt' :
				tmp.stack = 'group01';
				break;
			case 'aftStdOlgReRt' :
				tmp.stack = 'group02';
				break;
			case 'befTotOlgReRt' :
				tmp.stack = 'group03';
				tmp.type = 'line';
				break;
			case 'aftTotOlgReRt' :
				tmp.stack = 'group04';
				tmp.type = 'line';
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
    	"series": ibDataSet,
    	"colors" : COLOR_TYPE_03
	}

	divStdChart.loadSearchData(chartSetting, {
		append: true
	});
}

function fnRetrieveModiChart(dataSet) {
	let dataChanger = chartjsUtil.dataChanger;
	let srchDate = moment($("#searchMonth").val().replace(/[^0-9]/gi, ''), 'YYYYMM');

	//테이블 작업
	let tableDataSet = dataChanger.init()
	   .setBaseColumn('acpgDt')
	   .setDataset(dataSet)
	   .setIncludeColumns({
		  "befTotOlgReRt" : srchDate.clone().subtract(1, 'year').format('YYYY'),
		  "aftTotOlgReRt" : srchDate.format('YYYY')
	   }, 'gubun')
	   .build();

	//ibsheet 작업
	if(window.ibModiPivot != undefined) {
		ibModiPivot.Reset();
	}

	createIBSheet2(document.getElementById('divModiPivot'), "ibModiPivot", "100%", "130px");
    IBS_InitSheet(ibModiPivot, {
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
    ibModiPivot.SetCountPosition(0);

	//contextmenu 제거
	ibModiPivot.SetActionMenu("*-");
	ibModiPivot.SetHeaderActionMenu("*-");

    //컬럼 생성
    ibModiPivot.ColInsert({
    	'Header': {'Text': '년도'},
    	'Col': [
    		{'Type': 'Text', 'MinWidth': 80, 'Width': 80, 'SaveName': 'gubun', 'Edit' : '0', 'Align':'Center'}
    	]
    });

    let changedMonthArr = fnMakeMonth($("#searchMonth").val(), dataChanger.getDataColumnLength());
    let idx = 0;
    for (const [key, value] of Object.entries(tableDataSet[0])) {
    	if(key != 'acpgDt' && key != 'gubun') {
    		ibModiPivot.ColInsert({
			    'Header': {'Text': changedMonthArr[idx]},
			    Col:[{
			        'Type': 'Float',
			        'MinWidth': 60,
			        'Width': 60,
			        'SaveName': key,
			        'Edit' : '0',
			        'Align':'Right',
			        "Format" : "0.00 \\%"
			    }]
    		});
	    	idx++;
    	}
    }

    //데이터 넣기
	for(let i=0; i<tableDataSet.length; i++) {
		let row = ibModiPivot.DataInsert(0);
		ibModiPivot.SetCellValue(row, "gubun", tableDataSet[i].gubun);

		let item = tableDataSet[i];
		for (const [key, value] of Object.entries(item)) {
			if(key != 'acpgDt' && key != 'gubun') {
				ibModiPivot.SetCellValue(row, key, value);
			}
		}
	}

	ibModiPivot.FitColWidth();

	//차트그리기
	let changedDataSet = dataChanger.init()
	   .setBaseColumn('acpgDt')
	   .setDataset(dataSet)
	   .setIncludeColumns({
		  "befModOlgReRt" : "작년/특수",
		  "aftModOlgReRt" : "올해/특수",
		  "befTotOlgReRt" : "작년/특수",
		  "aftTotOlgReRt" : "올해/특수"
	   }, 'gubun')
	   .build();

	let ibDataSet = [];
	for(let i=0; i<changedDataSet.length; i++) {
		let tmp = {};
		tmp.data = fnMakeData(changedDataSet[i], dataChanger.getLables());
		tmp.name = changedDataSet[i].gubun;

		switch(changedDataSet[i].acpgDt) {
			case 'befModOlgReRt' :
				tmp.stack = 'group01';
				break;
			case 'aftModOlgReRt' :
				tmp.stack = 'group02';
				break;
			case 'befTotOlgReRt' :
				tmp.stack = 'group03';
				tmp.type = 'line';
				break;
			case 'aftTotOlgReRt' :
				tmp.stack = 'group04';
				tmp.type = 'line';
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
    	"series": ibDataSet,
    	"colors" : COLOR_TYPE_03
	}

	divModiChart.loadSearchData(chartSetting, {
		append: true
	});
}

</script>
<div class="content">
	<!-- 검색영역 -->
	<form class="form-inline form-control-static" action="" id="olgSttcSrchForm" name="olgSttcSrchForm">
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
								<ul class="checkStyleCh option-toggle-wrap" id="searchOlgTypeNmUI"></ul>
							</div>
						</li>
					</ul>
				</div>
				<div class="leftBox"  style="display:none;">
					<div class="search-btn-wrap f-right">
						<div class="search-btn-box">
							<div class="vertical-bar-sm vertical-only-right"></div>
							<button type="button" class="btn btn-search-sm bg-primary" id="btnSearch"><spring:message code='word.inquiry'/></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 검색영역 -->

	<!-- 검색영역 -->
	<div id="div_all" >
		<div class="sh_box">
			<!-- 그리드 레이아웃 추가 -->
			<div class="grid_wrap gridType3">
				<section>
					<div class="w100 chart-area">
						<div id="divAllChart"></div>
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
	<div id="div_std" >
		<div class="sh_box">
			<!-- 그리드 레이아웃 추가 -->
			<div class="grid_wrap gridType3">
				<section>
					<div class="w100 chart-area">
						<div id="divStdChart"></div>
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
						<div id='divStdPivot'>
						</div>
					</div>
				</section>
		<!-- // 그리드 레이아웃 추가 -->
			</div>
		</div>
	</div>

	<div id="div_modi" >
		<div class="sh_box">
			<!-- 그리드 레이아웃 추가 -->
			<div class="grid_wrap gridType3">
				<section>
					<div class="w100 chart-area">
						<div id="divModiChart"></div>
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
						<div id='divModiPivot'>
						</div>
					</div>
				</section>
		<!-- // 그리드 레이아웃 추가 -->
			</div>
		</div>
	</div>
</div>