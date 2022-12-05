<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="<c:url value="/resources/chartjs/chart.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/chartjs/chartjs-plugin-datalabels.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/chartjs/chartjsUtil.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/chart/colors.js"/>"></script>
<script>
    function fnOnload(){
        $('#searchDate').IBMaskEdit('yyyy-MM', {
            defaultValue: moment(moment().format('YYYY-MM-DD')).add("-1","days").format("YYYY-MM-DD")
        });

        fnSetEvent();
        fnRetrieve();

        chartResize();
        window.addEventListener('resize', chartResize);
    }

    function chartResize() {
        var chart = document.getElementsByClassName('chart-area');
        var h = (window.innerHeight - 472) < 400 ? 400 : (window.innerHeight - 472);

        for (var i = 0; i < chart.length; i++) {
            chart[i].style.height = h + 'px';
        }
    }

    function fnSetEvent(){
        // 캘린더 클릭 시
        $("#btnMonthlyCal").click(function() {
            IBCalendar.Show($('#searchDate').IBMaskEdit("value"), {
                "CallBack": function(date) {
                    let currDate = moment(moment().format('YYYY-MM-DD')).add("-1","days").format("YYYYMM");
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
                "Format": "Ym",
                "Target": $("#searchDate")[0],
                "CalButtons": "InputEmpty|Today|Close"
            });
        });
        $("#searchDate").click(function() {
            $("#btnMonthlyCal").trigger("click");
        });
    }

    function fnRetrieve(){
        new CommonAjax("/dshBr/pgs/retrievePgsCmplCnt.do")
            .addParam(pgsCmplCntForm)
            .callback(function (result) {
                fnRetrieveCmplChart(result.result);
            })
            .execute();
    }

    function fnRetrieveCmplChart(dataSet){

        let initData = {
            "chart": {
                "type": "column",
                "animation": true
            },
            "colors" : ["#E8A452", "#FCE395", "#FFC000", "#29755C", "#83C690", "#37A282"],
            "xAxis": {
                "categories": fnMakeMonth(dataSet.month)
            },
            "yAxis": {
                "title": {
                    "text": ""
                }
            },
            "plotOptions": {
                "series": {
                    "stacking": "normal",
                    // "stacking": "percent",
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
            "series": [],
            "tooltip": {
                "headerFormat": "",
                "shared": true
            }
        };

        // 차트 생성
        createIBChart("divCmplChart", "divCmplChart", {
            width : "100%",
            height : "100%"
        });

        divCmplChart.loadSearchData(initData);

        dataSet.seriesList.forEach(element => {
            divCmplChart.addSeries(createSeries(element));
        });


        //ibsheet 작업
        if(window.ibPgsPivot != undefined) {
            ibPgsPivot.Reset();
        }

        createIBSheet2(document.getElementById('divStdPivot'), "ibPgsPivot", "100%", "130px");
        IBS_InitSheet(ibPgsPivot, {
            "Cfg" : {
                "SizeMode": 1,
                'HeaderRowHeight':12,
                "HeaderRowHeight":"28",
                "DataRowHeight":"28",
                'SumPosition' : 1
            },
            "HeaderMode" : {
                "ColMove" : false,
                "Align" : "Center"
                            },
            "Cols": [
                {"Header" : "구분", "Type" : "Text", "Align" : "Left",	"SaveName" : "bpDivNm",	"MinWidth" : 30, "Edit": 0},
                {"Header" : "Order Status", "Type" : "Text", "Align" : "Left", "SaveName" : "ordPrgrStatCd", "MinWidth" : 60, "Width": 60, "Edit": 0}
            ]
        });

        //ib sheet count 제거
        ibPgsPivot.SetCountPosition(0);


        var heaerActionText = localeMsg["word.filter.show"] + "|"		// 필터행 출력
            + localeMsg["word.filter.hidden"] + "|"		// 필터행 숨김
            + localeMsg["word.col.frozen"] + "|"		// 틀고정
            + localeMsg["word.col.frozen.init"];		// 틀고정 해제
        var heaerActionCode = "_ibShowFilter|_ibHideFilter|COL_FROZEN_COL|COL_INIT_FROZEN_COL";
        ibPgsPivot.SetHeaderActionMenu(heaerActionText, heaerActionCode);

        // ibsheet 컬럼 생성.
        let monthList = fnMakeMonth(dataSet.month);
        for (var i = 0; i < monthList.length; i++){
            ibPgsPivot.ColInsert({
                'Header': {'Text': monthList[i]},
                Col:[{
                    'Type': 'Float',
                    'MinWidth': 60,
                    'Width': 60,
                    'SaveName': monthList[i],
                    'Edit' : '0',
                    'Align':'Right',
                    'EmptyToReplaceChar': '0',
                    "Format": "#,##0",
                }]
            });
        }

        // ibsheet 그리기
        for(var i = dataSet.seriesList.length-1; i >= 0 ; i--){
            var row = 1;
            var cell = 2;

            ibPgsPivot.DataInsert(0);

            let bpDivNm = "";
            if (dataSet.seriesList[i].stack == "group01"){
                bpDivNm = "DTC";
            }else{
                bpDivNm = "병원";
            }

            ibPgsPivot.SetCellValue(row, 0 , bpDivNm);
            ibPgsPivot.SetCellValue(row, 1 , dataSet.seriesList[i].name);


            for(var j=0; j < dataSet.seriesList[i].cntData.length; j++){
                ibPgsPivot.SetCellValue(row, cell, dataSet.seriesList[i].cntData[j]);
                cell++;
            }
        }

        ibPgsPivot.SetRowBackColor(3, "#FFC000");
        ibPgsPivot.SetRowBackColor(6, "#37A282");
        ibPgsPivot.SetRowFontColor(6, "#FFFFFF");

    }

    function fnMakeMonth(monthList) {
        let rtn = [];

        for(let i=0; i < monthList.length; i++){
            let year = monthList[i].substring(0,4);
            let mon = "";
            if(monthList[i].substring(4,5) == 0) {
                 mon = monthList[i].substring(5, 6);
            }else{
                 mon = monthList[i].substring(4, 6);
            }

            if(i < 1 || mon == '1'){
                rtn.push(year + "년 " + mon + "월");
            }else{
                rtn.push(mon + "월");
            }
        }
        return rtn;
    }

    function createSeries(element) {
        let series = {};
        let bpDivNm = "";

        if(element.stack == "group01"){
            bpDivNm = "DTC"
        }else{
            bpDivNm = "병원"
        }

        series.name = "[" + bpDivNm + "] " + element.name;
        series.type = element.type;
        series.data = element.cntData;
        series.stack = element.stack;

        console.log(series);
        return series;
    }



</script>
<div class="content">
    <!-- 검색영역 -->
    <form class="form-inline form-control-static" action="" id="pgsCmplCntForm" name="pgsCmplCntForm">
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
                        <div id="divCmplChart">
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