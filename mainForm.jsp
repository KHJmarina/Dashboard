<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${pageRole.hasAnyRole('ROLE_SYS_OPERATION')}" var="isRoleSysAdmin"/>
<!-- moment -->
<script src='<c:url value="/resources/moment/moment-timezone-with-data.js"/>'></script>


<script>
const hq = {timezone:"Asia/Seoul", cnty:"Korea · Japan", city:"Seoul · Tokyo"};
const sg = {timezone:"Asia/Singapore", cnty:"Singapore", city:"Singapore"};
const eu = {timezone:"Europe/Amsterdam", cnty:"Netherlands · Spain", city:"Amsterdam · Madrid"};
const us = {timezone:"America/New_York", cnty:"United States of America", city:"Washington, D.C."};
const timeZones = [hq, sg, eu, us];


function fnOnload() {

}

	// 즐겨찿기 해제
function fnRemoveBookmark2(obj, menuCd) {
	if(menuCd && confirm("<spring:message code='cnfm.com.bookmark.del'/>")) {
		$.post('/com/comm/menu/deleteUserMenuBookmark.do', {"menuCd":menuCd}, function(data, textStatus, jqXHR){
       		if(typeof data.errorCode === "undefined") {
       			$(obj).parent("li").remove();
            }
		});
	}
}

</script>


<div class="overview">
	<div class="map_bg">
		<div class="flex-box flex-a-start">
			<div class="flex-box" style="flex-direction:column; width:100%;" id="chartDiv">
				<div class="flex-box flex-a-start w100">
					<div id="drawPoint" class="flex-box flex-a-start mt10 w100" style="flex-wrap: wrap;">
					</div>
                </div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="<c:url value="/resources/chartjs/chartjsUtil.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/chart/colors.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/chart/common.js"/>"></script>
<script>
function fnOnload() {
	findByChartData(document.getElementById("searchInfoForm").srvcDivCd.value);

    window.addEventListener('resize', chartResize);
}
function chartResize() {
	var zoomChart = document.getElementsByClassName('icon-zoom-out');
    var chart = document.getElementById('drawPoint').getElementsByClassName('chart-div');

	var h = ((window.innerHeight - 60)/2)-35 < 350 ? 350 : ((window.innerHeight - 60)/2)-35;
	if(zoomChart.length > 0){
		h = window.innerHeight - 94 < 700 ? 700 : window.innerHeight - 94;
	}

    for(var i = 0; i < chart.length; i++){
	    chart[i].style.height =  h + 'px';
    }
}

//chart에서 사용되는 스크립트 동적으로 가져오기
<c:forEach var="chartData" items="${chartMainList}">
	${chartData.chartScript}
</c:forEach>
</script>
