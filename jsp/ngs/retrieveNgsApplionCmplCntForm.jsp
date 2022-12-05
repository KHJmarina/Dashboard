<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="<c:url value="/resources/chartjs/chart.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/chartjs/chartjs-plugin-datalabels.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/chartjs/chartjsUtil.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/chart/colors.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/comm/common.js"/>"></script>
<script src='<c:url value="/resources/moment/moment-with-locales.js"/>'></script>
<script src='<c:url value="/resources/moment/moment-timezone-with-data.js"/>'></script>
<script>
function fnOnload() {
    createIBSheet2(document.getElementById('divPivot'), "ibPivot", "100%", "900px");
    IBS_InitSheet(ibPivot, {
        "Cfg" : {
            "SizeMode": 1,
            'HeaderRowHeight':12,
            "MergeSheet": msHeaderOnly,
            "HeaderRowHeight":"28",
            "DataRowHeight":"28"
        },
        "HeaderMode" : {Align: "Center"},
        "Cols": [
            {"Header" : "Application Name",	"Type" : "Text",	"Align" : "Left",	"SaveName" : "legend",          "MinWidth" : 100, 	"Edit": 0},
            {"Header" : "전체 완료",		"Type" : "Text",	"Align" : "Right",	"SaveName" : "cmplCnt",		    "MinWidth" : 100, 	"Edit": 0},
            {"Header" : "납기 내 완료",		"Type" : "Text",	"Align" : "Right",	"SaveName" : "complance",	    "MinWidth" : 100, 	"Edit": 0},
            {"Header" : "납기 내 미완료",	"Type" : "Text",	"Align" : "Right",	"SaveName" : "nonCompliance",	"MinWidth" : 100, 	"Edit": 0},
            {"Header" : "준수율",	    	"Type" : "Float",	"Align" : "Right",	"SaveName" : "percentage",	    "MinWidth" : 100, 	"Edit": 0,	"Format" : "0.00\\%"},
        ]
    });
    ibPivot.SetCountPosition(0);

    $('#searchDate').IBMaskEdit('yyyy-MM', {
        defaultValue:getDefaultSearchMount()
    });

    fnSetEvent();
    fnRetrieve();
}

function fnSetEvent() {
    $("#searchDate").click(function() {
        $("#btnMonthlyCal").trigger("click");
    });

    $("#btnMonthlyCal").click(function() {
        IBCalendar.Show($(this).val(), {
            "CallBack": function(date) {
                let beforeDate = $("#searchDate").val();
                $("#searchDate").val(date);

                if(checkDiffrentDate(beforeDate, date)) {
                    $("#searchDate").val(checkSearchMonthDate(date));
                    fnRetrieve();
                }
            },
            "Format": "Ym",
            "Target": $("#searchDate")[0],
            "CalButtons": "InputEmpty|Today|Close"
        });
    });
}

function fnRetrieve() {
    new CommonAjax("/dshBr/ngs/retrieveNgsApplicationSttc.do")
        .addParam(ngsApplionSrchForm)
        .callback(function(result) {
            ibPivot.LoadSearchData({"data": result.result.pivot});
            fnRetrieveChart(result.result);
        })
        .execute();
}

function fnRetrieveChart(dataSet) {
    let initData = {
        "chart": {
            "type": ["line", "column"]
        },
        "colors" : ["#37A282", "#FEB1BE", "#0969DB"],
        "xAxis": {
            "categories": dataSet.legend
        },
        "yAxis": [ {
            "title": {
                "text": '준수율',
                rotation: 0,
                margin: 30
            },
            "labels": {
                "format": '{value}%',
            },
            "opposite": true,
            "min": 0,
            "max": 100
        },{
            "title": {
                "text": '건수',
                rotation: 0,
                margin: 30
            },
            "labels": {
                "format": '{value}',
            }
        }],
        plotOptions: {
            series: {
                lineWidth: 0,
                shadow: false
            }
        },
        "legend": {
            "borderWidth": 1,
            "borderColor":"#CBCED9",
            "verticalAlign": "bottom",
            "align": "center"
        },
        "series": [],
        "tooltip": {
            "headerFormat": "",
            "shared": true
        }
    };

    createIBChart("divChart", "divChart", {
        width : "100%",
        height : "600px"
    });
    divChart.loadSearchData(initData);
    dataSet.seriesList.forEach(element => {
        divChart.addSeries(createSeries(element));
    });
}

</script>
<div class="content">
    <!-- 검색영역 -->
    <form class="form-inline form-control-static" action="" id="ngsApplionSrchForm" name="ngsApplionSrchForm">
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
    <!-- IBChart -->
    <div id="div_chart" >
        <div class="sh_box">
            <!-- 그리드 레이아웃 추가 -->
            <div class="grid_wrap gridType3">
                <section>
                    <div class="w100">
                        <div id="divChart">
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
                        <div id='divPivot'>
                        </div>
                    </div>
                </section>
                <!-- // 그리드 레이아웃 추가 -->
            </div>
        </div>
    </div>
    <!-- IBChart -->
</div>
