<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set value="${pageRole.hasAnyRole('ROLE_SYS_OPERATION')}" var="isRoleSysAdmin"/>

<script src='<c:url value="/resources/js/ces/common.js"/>'></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>

<script>
	function fnUserInfo() {
		fnCommonPopOpen("userInfoPopup", 1000, 450);
		var $form = $('<form></form>');
		$form.attr('id', 'userInfoPopupForm');
		$form.attr('action', '/comm/user/retrieveUserInfoPopup.do');
	    $form.attr('method', 'post');
	    $form.attr('target', 'userInfoPopup')
	    $form.appendTo('body');
	    $form.submit();
	    $form.remove();
	}

	function fnUnitySearch() {

		var ordNo = $('#unitySearch').val().trim();
		var url = '';
		var menuCd = '';

		if(ordNo.length != 10) {
			alert("Not a correct order number.");
			return;
		}

		// 200730 : 대문자 변환 추가
		ordNo = ordNo.toUpperCase();
// 		$('#unitySearch').val(ordNo);

		new CommonAjax("/com/comm/menu/retrieveUnitySearch.do")
		.addParam({"ordNo":ordNo})
	    .callback(function (resultData) {

		    if(resultData.search.length === 0) {
	    		alert("Not a correct order number.");
				return;
	    	}

			var ordPrgrStatCd = resultData.search[0].ordPrgrStatCd;
	    	var srvcDivCd = resultData.search[0].srvcDivCd;
	    	var srvcTypeCd = resultData.search[0].srvcTypeCd;
			var ngsOrdDivCd = resultData.search[0].ordDivCd;

			if(resultData.search == '') {
				alert("Not a correct order number.");
				return;
			}


			if(srvcDivCd == 'CES') {
				var options = {
				   		"ordNo" : ordNo
				       ,"tabYn" : "Y"
				   	};
		        fnMoveCesOrdDetail(options);
			} else {
				if(srvcDivCd == 'NGS') {
					if(ngsOrdDivCd != '10' && ordPrgrStatCd == '10') {
						// 추가분석, BI ONLY, 주문생성단계
						alert("<spring:message code='cnfm.ngs.bi.tmp'/>");  //추가 분석의 Report 상태가 TempSave인 상태에서는 주문정보상세가 불가능합니다.
						return;
					}
					url = "/ngs/order/retrieveOrdSearchDetailForm.do";
					menuCd = "NGS100300";
				}

				else if(srvcDivCd == 'OLG') {
					url = "/olg/ordMngt/retrieveOrdSearchDetailForm.do";
					menuCd = "OLG100120";
				}

				else if(srvcDivCd == 'CHP') {
					url = "/chp/order/retrieveChpOrdSearchDetailForm.do";
					menuCd = "CHP200400";
				}

				else if(srvcDivCd == 'PGS') {
					url = "";
					menuCd = "";
				}

				$('#frmMenu').find("input[name=ordNo]").remove();
				$('#frmMenu').append('<input type="hidden" name="ordNo" value="'+ordNo+'">');

				fnMove(url, menuCd, "Y");
			}
	    })
	    .execute();
	}

	function test() {
		new CommonAjax("/ces/report/test.do")
		.callback(function (resultData) {
			alert(resultData.message);
			if(resultData.result == "S"){
				alert("dsaf");
			}
		})
		.execute();
	}

	function moveMain(service) {
		var loactionInfo = window.location.href;
		document.getElementById("searchInfoForm").srvcDivCd.value = service;
		if(loactionInfo.indexOf("main.do") == -1){
			document.getElementById("searchInfoForm").submit();
		}else{
			findByChartData(service);
		}
	}


	/* 상단 서브 메뉴 */
/*	function moveMain(el) {
		$('.sub_menu ul li').removeClass('on');
		$(el).addClass('on');
	}*/
</script>
<sec:authentication var="userDetails" property="principal.egovUserVO" />
<header class="header">
	<!-- 주문번호통합검색영역 -->
	<div class="top_menu">
		<div class="left-items">
				<div class="logo_area">
					<div class="logo_img"></div>
				</div>
				<nav class="sub_menu">
					<ul id="topMenuList">
 						<li onClick="moveMain('NGS');"  id="NGS" style="cursor: pointer;"><a class="icon-item icon_ngs"></a>NGS</li>
 						<li onClick="moveMain('CES');" id="CES" style="cursor: pointer;"><a class="icon-item icon_ces"></a>CES</li>
 						<li onClick="moveMain('OLG');"  id="OLG" style="cursor: pointer;"><a class="icon-item icon_oligo"></a>Oligo</li>
 						<li onClick="moveMain('CHP');" id="CHP" style="cursor: pointer;"><a class="icon-item icon_chip"></a>Microarray</li>
 						<li onClick="moveMain('PGS');" id="PGS" style="cursor: pointer;"><a class="icon-item icon_pgs"></a>PGS</li>
					</ul>
				</nav>
			<div>
				<form id="searchInfoForm" method="POST" action="/main.do" accept-charset="UTF-8">
					<input type="hidden" id="srvcDivCd" name="srvcDivCd" value="<c:out value="${srvcDivCd}"/>">
				</form>
			</div>
			<div class="right-items">
				<c:if test="${isRoleSysAdmin eq true}">
					<div class="admin_area">
						<a href="/com/user/retrieveUserForm.do" class="admin_img" id="ADMIN"></a>
					</div>
				</c:if>
				<div class="logout_area">
					<a href="/logout" class="logout_img"></a>
				</div>
			</div>
		</div>
	</div>

</header>





<!-- 블루 컬러 배경은 하드코딩으로 스타일 추가 예정 -->
<%-- <header class="header">
	<!-- 주문번호통합검색영역 -->
	<div class="top_menu">
		<div class="left-items">
				<div class="logo_area">
					<div class="logo_img"></div>
				</div>
				<nav class="sub_menu">
					<ul>
						<li onClick="moveMain(this);"  id="NGS"><a href="/" class="icon-item icon_ngs"></a>NGS</li>
						<li onClick="moveMain(this);" id="CES"><a href="/" class="icon-item icon_ces"></a>CES</li>
						<li onClick="moveMain(this);"  id="OLG" class="on"><a href="/" class="icon-item icon_oligo"></a>Oligo</li>
						<li onClick="moveMain(this);" id="CHP"><a href="/" class="icon-item icon_chip"></a>Microarray</li>
						<li onClick="moveMain(this);" id="PGS"><a href="/" class="icon-item icon_pgs"></a>PGS</li>
					</ul>
				</nav>
			<div class="right-items">
				<c:if test="${isRoleSysAdmin eq true}">
					<div class="admin_area">
						<a href="/com/user/retrieveUserForm.do" class="admin_img" id="ADMIN"></a>
					</div>
				</c:if>
				<div class="logout_area">
					<a href="/logout" class="logout_img"></a>
				</div>
			</div>
		</div>
	</div>

</header> --%>






<!-- 이전 영역 -->
<%--
<header class="header">
	<!-- 주문번호통합검색영역 -->
	<div class="g-search-wrap">
		<div class="g-search-top">
			<div class="g-search-top-left vertical-group">
				<div> [[[[  logo 위치 ]]]]</div>
				<div class="g-search-top-center vertical-group">
					<button type="button" class="btn btn-main btn-search bg-primary-empty bg-white" id="NGS" onclick="moveMain('NGS');">NGS</button>
					<button type="button" class="btn btn-main btn-search bg-primary-empty bg-white ml-16" id="CES" onclick="moveMain('CES');">CES</button>
					<button type="button" class="btn btn-main btn-search bg-primary-empty bg-white ml-16" id="OLG" onclick="moveMain('OLG');">Oligo</button>
					<button type="button" class="btn btn-main btn-search bg-primary-empty bg-white ml-16" id="CHP" onclick="moveMain('CHP');">Microarray</button>
					<button type="button" class="btn btn-main btn-search bg-primary-empty bg-white ml-16" id="PGS" onclick="moveMain('PGS');">PGS</button>
					<c:if test="${isRoleSysAdmin eq true}">
					<a href="/com/user/retrieveUserForm.do"><button type="button" class="btn btn-main btn-search bg-primary-empty bg-white ml-16" id="ADMIN">ADMIN</button></a>
					</c:if>
				</div>
			</div>
			<div class="g-search-top-right vertical-group">
				<!-- <span class="g-search-user-name"><c:out value="${userDetails.userNm}" /></span> -->
				<div class="vertical-bar-md"></div>
				<!-- <a href="javascript:void(0);" target="_blank" class="manual"><spring:message code='word.com.manual'/></a> -->
				<div class="g-search-icon-group" >
					<!-- <a href="#" class="icon-guide"></a> -->
					<!-- <a href="javascript:fnUserInfo();" class="icon-user-setting user-setting"></a> -->
					<a href="/com/user/retrieveUserForm.do" class="icon-user-setting user-setting"></a>
					<a href="/logout" class="icon-user-logout user-logout"><!-- <spring:message code='word.com.logout'/> --></a>
				</div>
			</div>
		</div>
	</div>
	<%--
	<div class="header-util">
		<c:forEach items="${activeMenuPath}"  var="menuPath" varStatus="status">
			<c:if test="${status.first}">
				<a href="/" class="icon-home"></a>
			</c:if>
			<c:if test="${!status.last}">
				<span class="icon-arrow-right"><c:out value="${menuPath.menuNm}"></c:out></span>
			</c:if>
			<c:if test="${status.last}">
				<span class="current-page"><c:out value="${menuPath.menuNm}"></c:out></span>
			</c:if>
		</c:forEach>
	</div>

</header>
 --%>
</header>
