<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="<c:url value="/resources/chartjs/chartjsUtil.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/chart/colors.js"/>"></script>
<script>
function fnOnload() {
        //ib chart 정의 시작
        var initData = {
            "chart": {
                "type": "column",
                "animation": true
            },
            "plotOptions": {
                "series": {
                    "dataLabels": {
                        "enabled": false,
                        "overflow": "allow", // plot 영역 외에 표시여부 (default:justify )
                        "crop": false, // 영역외 자동숨김 처리여부 (default:true )
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
            "tooltip": {
                "headerFormat": "",
                "shared": true,
                "valueSuffix": '%',
                "valueDecimals": 2
            },
    		"yAxis": {
    			"labels" : {
    				"format": "{value}%"
    			}
    		}
        };

        createIBChart("divStdChart", "divStdChart", {
            width: "100%",
            height: "100%"
        });
        divStdChart.setOptions(initData);
        //ib chart 정의 종료
        // doAction();
        $('#searchDate').IBMaskEdit('yyyy-MM-dd', {
            defaultValue: moment(moment().format('YYYY-MM-DD')).add("-7","days").day(7).format("YYYY-MM-DD")
        });

        fnSetEvent();
        fnRetrieve();

        chartResize();
        window.addEventListener('resize', chartResize);
}

function chartResize() {
    var chart = document.getElementsByClassName('chart-area');
    var h = (window.innerHeight - 416) < 400 ? 400 : (window.innerHeight - 416);

    for (var i = 0; i < chart.length; i++) {
        chart[i].style.height = h + 'px';
    }
}

function fnSetEvent() {
    // 상단 검색 쪽

    // 캘린더 클릭 시
    $("#btnMonthlyCal").click(function() {
        IBCalendar.Show($('#searchDate').IBMaskEdit("value"), {
            "CallBack": function(date) {

                let currDate = moment(moment().format('YYYYMMDD')).add("-7","days").day(7).format("YYYYMMDD");
                if(Number(date.replace(/\//g,'')) > currDate ){
                    alert("아직 해당 기간의 데이터가 등록되지 않았습니다. 가장 최근 데이터를 조회합니다.")
                    $("#searchDate").val(currDate);
                    fnRetrieve();
                }else{
                    let beforeDate = $("#searchDate").val();
                    $("#searchDate").val(date);

                    if(beforeDate != date) {
                        fnRetrieve();
                    }
                }
            },
            "Format": "Ymd",
            "Target": $("#searchDate")[0],
            "CalButtons": "InputEmpty|Today|Close"
        });
    });
    $("#searchDate").click(function() {
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
    new CommonAjax("/dshBr/chp/retrieveChpCmplCnt.do")
        .addParam(chpCmplCntForm)
        .callback(function(result) {
           fnRetrieveStdChart(result.result);
        })
        .execute();
}

// 데이터
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

function fnRetrieveStdChart(dataSet) {

    let date = $("#searchDate").val();

    let dataChanger = chartjsUtil.dataChanger;
    let changedDataSet = dataChanger.init()
        .setBaseColumn('eqNm')
        .setDataset(dataSet.ChpCmplSttcList)
        .setIncludeColumns({
            "fourthWeek" : dataSet.weekName[3],
            "thirdWeek" :  dataSet.weekName[2],
            "secondWeek" :dataSet.weekName[1],
            "firstWeek" :  dataSet.weekName[0],
        }, 'gubun')
        .build();

    let ibDataSet = [];
    for(let i=0; i<changedDataSet.length; i++) {
        let tmp = {};
        tmp.data = fnMakeData(changedDataSet[i], dataChanger.getLables());
        tmp.name = changedDataSet[i].gubun;
        switch(changedDataSet[i].eqNm) {
            case 'firstWeek' :
                tmp.stack = 'group01';
                break;
            case 'secondWeek' :
                tmp.stack = 'group02';
                break;
            case 'thirdWeek' :
                tmp.stack = 'group03';
                break;
            case 'fourthWeek' :
                tmp.stack = 'group04';
                break;
        }
        ibDataSet.push(tmp);
    }

    // 장비 리스트 변경 필요
    let chartSetting = {
        "xAxis" : {
            "categories": ['Illumina iScan 1호기','Affymetrix GeneTitan 1호기','Affymetrix GCS3000DX v2 1호기','Agilent SureScan 1호기','QuantStudio 12K 1호기','Affymetrix GeneTitan 2호기','Affymetrix GeneTitan 3호기','Biome Quant5 1호기']
        },
        "yAxis": {
            "title": {
                "text": ""
            },
            "max" : "100",
            "tickInterval" : "10"
        },
        "series": ibDataSet,
        "colors" : ["#DBEDBE", "#7CCFD6", "#3179AF", "#1B277C"],
    }
    divStdChart.loadSearchData(chartSetting, {
        append: true
    });

    //테이블 작업
    let tableDataSet = dataChanger.init()
        .setBaseColumn('eqNm')
        .setDataset(dataSet.ChpCmplSttcList)
        .setIncludeColumns({
            "fourthWeek" : dataSet.weekName[3],
            "thirdWeek" : dataSet.weekName[2],
            "secondWeek" : dataSet.weekName[1],
            "firstWeek" : dataSet.weekName[0]
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

    var heaerActionText = localeMsg["word.filter.show"] + "|"		// 필터행 출력
        + localeMsg["word.filter.hidden"] + "|"		// 필터행 숨김
        + localeMsg["word.col.frozen"] + "|"		// 틀고정
        + localeMsg["word.col.frozen.init"];		// 틀고정 해제
    var heaerActionCode = "_ibShowFilter|_ibHideFilter|COL_FROZEN_COL|COL_INIT_FROZEN_COL";
    ibStdPivot.SetHeaderActionMenu(heaerActionText, heaerActionCode);

    //컬럼 생성
    ibStdPivot.ColInsert({
        'Header': {'Text': '주차'},
        'Col': [
            {'Type': 'Text', 'MinWidth': 80, 'Width': 80, 'SaveName': 'gubun', 'Edit' : '0', 'Align':'Center'} //, 'Format': "0.#"
        ]
    });

   // let changedMonthArr = fnMakeMonth($("#searchDate").val(), dataChanger.getDataColumnLength());
    let eqtbList = ['Illumina iScan 1호기','Affymetrix GeneTitan 1호기','Affymetrix GCS3000DX v2 1호기','Agilent SureScan 1호기','QuantStudio 12K 1호기','Affymetrix GeneTitan 2호기','Affymetrix GeneTitan 3호기','Biome Quant5 1호기'];
    let idx = 0;
    for (const [key, value] of Object.entries(tableDataSet[0])) {
        if(key != 'eqNm' && key != 'gubun') {
            ibStdPivot.ColInsert({
                'Header': {'Text': eqtbList[idx]},
                Col:[{
                    'Type': 'Float',
                    'MinWidth': 60,
                    'Width': 60,
                    'SaveName': key,
                    'Format': "0.00 \\%",
                    'Edit' : '0',
                    'Align':'Right'
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
            if(key != 'eqNm' && key != 'gubun') {
                ibStdPivot.SetCellValue(row, key, value);
            }
        }
    }

    ibStdPivot.SetRowBackColor(1, "#1B277C");
    ibStdPivot.SetRowFontColor(1, "#FFFFFF");
    ibStdPivot.FitColWidth();

}
</script>
<div class="content">
    <!-- 검색영역 -->
    <form class="form-inline form-control-static" action="" id="chpCmplCntForm" name="chpCmplCntForm">
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
                                    <input type="text" name="searchDate" id="searchDate" class="input input-sm input-calendar date_type1" required="<spring:message code='word.regist.start.date'/>"/>
                                    <button type="button" class="icon-calendar btn-calendar" id="btnMonthlyCal"></button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="leftBox" style="display:none;">
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
    <div id="div_std" >
        <div class="sh_box">
            <!-- 그리드 레이아웃 추가 -->
            <div class="grid_wrap gridType3">
                <section>
                    <div class="w100 chart-area">
                        <div id="divStdChart">
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
                        <div id='divStdPivot'>
                        </div>
                    </div>
                </section>
                <!-- // 그리드 레이아웃 추가 -->
            </div>
        </div>
    </div>
</div>



