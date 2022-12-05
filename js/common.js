/**
 * CUS 공통기능
 */

/**
 * 고객노트 조회 DIV 페이지
 * 191204 : 재검색 시 페이지로드 ibsheet load 안됨 => 호출 형식으로 변경
 */
jQuery.fn.extend({
    addCstmrComment: function(options) {
        "use strict";
        var $selectedElement = $(this);
        if(window.cstmrCommentSheet) {
        	// 검사
        	if($('#cstmrCommentForm #custId').length === 0 || !options || !options['custId']) { // 에러
        		return false;
        	}
        	$('#cstmrCommentForm #custId').val(options['custId']);
        	fnRetrievCstmrComment();
        } else {
        	$.ajax({
                url: '/cus/cstmr/retrieveCstmrComment.do',
                type: 'post',
                dataType: 'html',
                contentType: 'application/json; charset=utf-8',
                async: false,
                success: function (data) {
                    if(_validReceiveData(data)) {
                        $selectedElement.html(data);
                    }
                },
                data: JSON.stringify({"dataSet":options })
            });
        }
        return $(this);

	}
});

//교수 연결 텝 조회 DIV 페이지
jQuery.fn.extend({
	addProfsrConnectTab: function(options) {
        "use strict";
        var $selectedElement = $(this);
        $.ajax({
            url: '/cus/profsr/retrieveProfsrConnectTab.do',
            type: 'post',
            data: JSON.stringify({"dataSet":options }),
            dataType: 'html',
            contentType: 'application/json; charset=utf-8',
            async: false,
            success: function (data) {
                if(_validReceiveData(data)) {
                    $selectedElement.html(data);
                }
            }
        });
        return $(this);
	}
});

//include
jQuery.fn.extend({
	includeForm: function(url, options) {
        "use strict";
        var $selectedElement = $(this);
        $.ajax({
            url: url,
            type: 'post',
            dataType: 'html',
            contentType: 'application/json; charset=utf-8',
            async: false,
            success: function (data) {
                if(_validReceiveData(data)) {
                    $selectedElement.html(data);
                }
            },
            data: JSON.stringify({"dataSet":options})
        });
        return $(this);
	}
});

/**
 * 고객검색 공통팝업
 * @param options
 * @returns
 */
function fnRetrieveCstmrPopup(options) {
	var options = Object.assign({
		callback : '',
		setTitle : '',
		setDnaSysCd : '',
		setCustStatCd : '10',
		setCustNm : '',
		setCustId : '',
		optionCheckCnt : '',
		optionSearchMile : 'N',
		clickRow : ''
	}, options);

	fnCommonPopOpen("retrieveCstmrPopup", 1300, 650);
	var $div = $('<div></div>');
	$div.attr('id', 'retrieveCstmrPopupDiv');

	var $form = $('<form></form>');
	$form.attr('id', 'retrieveCstmrPopupForm');
	$form.attr('action', '/cus/cstmr/retrieveCstmrPopup.do');
	$form.attr('method', 'post');
	$form.attr('target', 'retrieveCstmrPopup');
	$div.appendTo('body');
	$form.appendTo('body');
	$form.append($('<input type="hidden" value="'+options.callback+'" name="callback">'));
	$form.append($('<input type="hidden" value="'+options.setTitle+'" name="setTitle">'));
	$form.append($('<input type="hidden" value="'+options.setDnaSysCd+'" name="setDnaSysCd">'));
	$form.append($('<input type="hidden" value="'+options.setCustStatCd+'" name="setCustStatCd">'));
	$form.append($('<input type="hidden" value="'+options.setCustNm+'" name="setCustNm">'));
	$form.append($('<input type="hidden" value="'+options.setCustId+'" name="setCustId">'));
	$form.append($('<input type="hidden" value="'+options.optionCheckCnt+'" name="optionCheckCnt">'));
	$form.append($('<input type="hidden" value="'+options.optionSearchMile+'" name="optionSearchMile">'));
	$form.append($('<input type="hidden" value="'+options.clickRow+'" name="clickRow">'));
	$form.submit();
}

/*
 * 고객정보 조회
 * @param : sCustId 고객ID
 * @param : sTitle 윈도우 상단 이름 세팅
 */
function retrieveUserInfoPopup(sCustId, sTitle) {
	fnCommonPopOpen("retrieveUserAddInfoPopup", 1000, 800);
	var $div = $('<div></div>');
	$div.attr('id', 'retrieveUserInfoPopupDiv');

	// 윈도우 상단 이름 없을 시 디폴트 값 세팅 추가
	if(!sTitle) {
		sTitle = fnGetTitle();
	}

	var $form = $('<form></form>');
	$form.attr('id', 'retrieveUserAddInfoPopupForm');
	$form.attr('action', '/cus/cstmr/retrieveCstmrAddInfoPopup.do');
	$form.attr('method', 'post');
	$form.attr('target', 'retrieveUserAddInfoPopup');
	$div.appendTo('body');
	$form.appendTo('body');
	$form.append($('<input type="hidden" value="'+sCustId+'" name="custId">'));
	$form.append($('<input type="hidden" value="'+sTitle+'" name="setTitle">'));
	$form.submit();
}

/**
 * 교수 검색 및 등록
 * @param options
 * @returns
 */
function fnRetrieveProfsrPopup(callback, clickRow, options) {
	var options = Object.assign({
		setDmstOvrsDivCd : '',
		setCustId : '',
		setCustNm : '',
		searchFix : '',
		searchProfsrPopup : ''
	}, options);

	fnCommonPopOpen("retrieveProfsrPopup", 1280, 640);
	var $div = $('<div></div>');
	$div.attr('id', 'retrieveProfsrPopupDiv');

	var $form = $('<form></form>');
	$form.attr('id', 'retrieveProfsrPopupForm');
	$form.attr('action', '/cus/profsr/retrieveProfsrPopup.do');
	$form.attr('method', 'post');
	$form.attr('target', 'retrieveProfsrPopup');
	$div.appendTo('body');
	$form.appendTo('body');
	$form.append($('<input type="hidden" value="'+callback+'" name="callback">'));
	$form.append($('<input type="hidden" value="'+clickRow+'" name="clickRow">'));
	$form.append($('<input type="hidden" value="'+options.setDmstOvrsDivCd+'" name="setDmstOvrsDivCd">'));
	$form.append($('<input type="hidden" value="'+options.setCustId+'" name="setCustId">'));
	$form.append($('<input type="hidden" value="'+options.setCustNm+'" name="setCustNm">'));
	$form.append($('<input type="hidden" value="'+options.searchFix+'" name="searchFix">'));
	$form.append($('<input type="hidden" value="'+options.searchProfsrPopup+'" name="searchProfsrPopup">'));
	$form.submit();
}

/**
 * 교수 등급 조회 팝업
 *
 * @param options
 * @returns
 */
function fnRetrieveProfsrGrdePopup(callback, clickRow, options) {
	var options = Object.assign({
		setDmstOvrsDivCd : '',
		setCustId : '',
		setCustNm : '',
		searchFix : ''
	}, options);
	fnCommonPopOpen("retrieveProfsrGrdePopup", 1280, 800);
	var $div = $('<div></div>');
	$div.attr('id', 'retrieveProfsrGrdePopupDiv');

	var $form = $('<form></form>');
	$form.attr('id', 'retrieveProfsrGrdePopupForm');
	$form.attr('action', '/cus/profsr/retrieveProfsrGrdePopup.do');
	$form.attr('method', 'post');
	$form.attr('target', 'retrieveProfsrGrdePopup');
	$div.appendTo('body');
	$form.appendTo('body');
	$form.append($('<input type="hidden" value="'+callback+'" name="callback">'));
	$form.submit();
}

/**
 * 선입이체 팝업
 * @param options
 * @returns
 */
function fnRetrievePpmTnfPopup(callback, clickRow, options) {
	var options = Object.assign({
		setPpmGropCd : '',
		setPpmGropNm : '',
		setProfsrCd : '',
		setProfsrNm : '',
		setCrncUntCd : '',
		setCrncUntNm : '',
		setPpmBlnc : '',
		setGropTypeCd : '',
		searchFix : ''
	}, options);

	fnCommonPopOpen("retrievePpmTnfPopup", 600, 500);
	var $div = $('<div></div>');
	$div.attr('id', 'retrievePpmTnfPopupDiv');

	var $form = $('<form></form>');
	$form.attr('id', 'retrievePpmTnfPopupForm');
	$form.attr('action', '/cus/profsr/retrievePpmTnfPopup.do');
	$form.attr('method', 'post');
	$form.attr('target', 'retrievePpmTnfPopup');
	$div.appendTo('body');
	$form.appendTo('body');
	$form.append($('<input type="hidden" value="'+callback+'" name="callback">'));
	$form.append($('<input type="hidden" value="'+clickRow+'" name="clickRow">'));
	$form.append($('<input type="hidden" value="'+options.setPpmGropCd+'" name="setPpmGropCd">'));
	$form.append($('<input type="hidden" value="'+options.setPpmGropNm+'" name="setPpmGropNm">'));
	$form.append($('<input type="hidden" value="'+options.setProfsrCd+'" name="setProfsrCd">'));
	$form.append($('<input type="hidden" value="'+options.setProfsrNm+'" name="setProfsrNm">'));
	$form.append($('<input type="hidden" value="'+options.setCrncUntCd+'" name="setCrncUntCd">'));
	$form.append($('<input type="hidden" value="'+options.setCrncUntNm+'" name="setCrncUntNm">'));
	$form.append($('<input type="hidden" value="'+options.setPpmBlnc+'" name="setPpmBlnc">'));
	$form.append($('<input type="hidden" value="'+options.setGropTypeCd+'" name="setGropTypeCd">'));
	$form.append($('<input type="hidden" value="'+options.searchFix+'" name="searchFix">'));
	$form.submit();
}

/**
 * 선입그룹코드 팝업
 * @param options
 * @returns
 */
function fnRetrieveProfsrPpmGrpPopup(callback, clickRow, options) {
	var options = Object.assign({
		searchFix : ''
	   ,setCustId : ''
	   ,setPpmGropTypeCd : ''
	}, options);

	fnCommonPopOpen("retrieveProfsrPpmGrpPopup", 1440, 700);
	var $div = $('<div></div>');
	$div.attr('id', 'retrieveProfsrPpmGrpPopupDiv');

	var $form = $('<form></form>');
	$form.attr('id', 'retrieveProfsrPpmGrpPopupForm');
	$form.attr('action', '/cus/profsr/retrieveProfsrPpmGrpPopup.do');
	$form.attr('method', 'post');
	$form.attr('target', 'retrieveProfsrPpmGrpPopup');
	$div.appendTo('body');
	$form.appendTo('body');
	$form.append($('<input type="hidden" value="'+callback+'" name="callback">'));
	$form.append($('<input type="hidden" value="'+clickRow+'" name="clickRow">'));
	$form.append($('<input type="hidden" value="'+options.searchFix+'" name="searchFix">'));
	$form.append($('<input type="hidden" value="'+options.setCustId+'" name="setCustId">'));
	$form.append($('<input type="hidden" value="'+options.setPpmGropTypeCd+'" name="setPpmGropTypeCd">'));
	$form.submit();
}
/*
 * 코드 선택 팝업 조회
 * @param : callback 콜백함수명
 * @param : setTitle 팝업타이틀
 * @param : nWidth 팝업가로길이
 * @param : nHeight 팝업세로길이
 * @param : cmmnClCd 분류코드
 * @param : selValue 선택된 값
 * @param : clickRow
 */
function fnRetrieveCodeSelectPopup(options) {
	var options = Object.assign({
		callback : '',
		setTitle : '',
		nWidth : '',
		nHeight : '',
		cmmnClCd : '',
		selValue : '',
		clickRow : ''
	}, options);

	fnCommonPopOpen("retrieveCodeSelectPopup", options.nWidth, options.nHeight);
	var $div = $('<div></div>');
	$div.attr('id', 'retrieveCodeSelectPopupDiv');

	var $form = $('<form></form>');
	$form.attr('id', 'retrieveCodeSelectPopupForm');
	$form.attr('action', '/cus/com/retrieveCodeSelectPopup.do');
	$form.attr('method', 'post');
	$form.attr('target', 'retrieveCodeSelectPopup');
	$div.appendTo('body');
	$form.appendTo('body');
	$form.append($('<input type="hidden" value="'+options.callback+'" name="callback">'));
	$form.append($('<input type="hidden" value="'+options.setTitle+'" name="setTitle">'));
	$form.append($('<input type="hidden" value="'+options.cmmnClCd+'" name="cmmnClCd">'));
	$form.append($('<input type="hidden" value="'+options.selValue+'" name="selValue">'));
	$form.append($('<input type="hidden" value="'+options.clickRow+'" name="clickRow">'));
	$form.submit();
}

/**
 * 회원등록 팝업
 * @param options
 * @returns
 */
function fnRetrieveCustRgsnPopup() {
	fnCommonPopOpen("retrieveCustRgsnPopup", 1000, 800);
	var $div = $('<div></div>');
	$div.attr('id', 'retrieveCustRgsnPopupDiv');

	var $form = $('<form></form>');
	$form.attr('id', 'retrieveCustRgsnPopupForm');
	$form.attr('action', '/cus/cstmr/retrieveCustRgsnPopup.do');
	$form.attr('method', 'post');
	$form.attr('target', 'retrieveCustRgsnPopup');
	$div.appendTo('body');
	$form.appendTo('body');
	$form.submit();
}





/*
 * LPAD 함수
 * @param : s
 * @param : padLength
 * @param : padString
 */
function lpad(s, padLength, padString){
    while(s.length < padLength)
        s = padString + s;
    return s;
}
/*
 * RPAD 함수
 * @param : s
 * @param : padLength
 * @param : padString
 */
function rpad(s, padLength, padString){
    while(s.length < padLength)
        s += padString;
    return s;
}

/*
 * 배열  중복여부
 * @param : callback Boolean
 */
function fnGetArryDupChk(a) {
	var  flag = false;
	var array = new Array();
	$.each(a, function(i, el){
	    if($.inArray(el, array) === -1) {array.push(el);}
	    else {flag = true; }
	});
	return flag;
};
/*
 * 배열  중
 * @param : callback 배열
 */
function fnGetExceptDupArray(array){
	var array = [];
	$.each(this, function(i, el){
	    if($.inArray(el, array) === -1) array.push(el);
	});
	return array;
}

/*배열 최대값*/
function fnGetArrayMax(array){
	var max  = array.reduce(function(pre, cur){
		return pre>cur ? pre:cur;
	});
	return max;
}

/*sheet의 특정 컬럼 중복체크*/
function fnInxSeqChk(obj,msg){
	var inx1  = new Array(); //idxSeq7
	var inx2  = new Array(); //idxSeq5 +idxSeq7
	var idxSeq5 = "";
	var idxSeq7 = "";

	for(var i = obj.GetDataFirstRow(); i<=obj.GetDataLastRow(); i++){
		if(obj.GetCellValue(i, "ibCheck")){
			idxSeq5 = obj.GetCellValue(i, "idxSeq5");
			idxSeq7 = obj.GetCellValue(i, "idxSeq7");
			if(idxSeq7 != ""  && idxSeq5 == "" ){
				inx1.push(idxSeq7.substring(0,5))
			}else if(idxSeq5 != "" && idxSeq7 != "" ){
				inx2.push(idxSeq7.substring(0,6)+idxSeq5.substring(0,6))
			}
		}

	}

	var seq7 = false;
	var seq  = false;
	if(fnGetArryDupChk(inx1) || fnGetArryDupChk(inx2)){ /*중복된 데이타가 존재한다면 ...*/
		//var msg = "<spring:message code='word.index.dup.chk'/>";
		 if(!confirm(msg)){
			 return false;
		 }
	};
	return true;
}

/*
 * null 공백으로
 * @param : String
 */
function nullString(str){
	if(str == null || str == "null"){
		return "";
	} return str;
}
/*
 * null 공백으로
 * @param : String
 */
function nullStrHTML(str){
	if(str == null || str == "null"){
		return "&nbsp;";
	} return str;
}


/**
 *
 * cell 병합
 * obj : grid
 * clo : column 명
 * colRow : 병합할 gird의  row
 * index  : cell의 위치
 */

function fnGetMerge(obj,col,colRow,index){

	var mergeCountArray = new Array();
   	var mergeColArray = new Array();
   	var mergeFirstRow = new Array();
   	var mergeLastRow  = new Array();
	var count  =0;

   	for(var i=obj.GetDataFirstRow(); i<=obj.GetDataLastRow(); ++i){

		if(obj.GetCellValue(i,col) != obj.GetCellValue(i-1,col)){
			mergeColArray[count] = obj.GetCellValue(i,col);
			count++;
		}
	}
	var row = 0;
	count  = 0;
	var rowcount = obj.RowCount();

	for(var i = 0; i < mergeColArray.length; i++){
		count  = 0;
		for(var j = obj.GetDataFirstRow(); j<= obj.GetDataLastRow(); ++j){
			if(row < j)
				if( mergeColArray[i] != obj.GetCellValue(j,col) ){
					row = j;
					break;
				}
			count++;
		}
		mergeLastRow[i] = count+colRow;

		if(i == 0){
			mergeCountArray[i] =count;
			mergeFirstRow[i] = obj.GetDataFirstRow();
		}else{
			mergeCountArray[i] =mergeLastRow[i]-mergeLastRow[i-1];
			mergeFirstRow[i] = mergeLastRow[i]-mergeCountArray[i];
		}
	}

	for(var i = 0; i < mergeColArray.length;i++){
		obj.SetMergeCell(  mergeFirstRow[i], index, mergeCountArray[i], 1)
   	}
 }

/*
 * 천단위 콤마(,)
 * @param : str : 금액
 */
function addCommas(str) {
    return str.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/*
 * Textarea 라인, 글자수 제한하는 함수
 * @param : textarea
 * @param : maxLines 최대 라인수
 * @param : maxByte 한행 최대 글자수(바이트단위로 변경예정)
 */
function fnTextAreaLineLimit(textarea, maxLines, maxByte) {
	var lines = textarea.value.replace(/\r/g, '').split('\n'), lines_removed=false, char_removed=false, i;
    if (maxLines && lines.length > maxLines) {
        lines = lines.slice(0, maxLines);
        lines_removed = true;
    }
    if (maxByte) {
        i = lines.length;
        while (i-- > 0) if (getByteLength(lines[i]) > maxByte) {
            lines[i] = cutByteLen(lines[i], maxByte);
            char_removed = true;
        }
    }
    if (char_removed || lines_removed) {
        textarea.value = lines.join('\n')
    }
}

/*
 * 문자열 바이트단위로 자르는 함수
 * @param : str
 * @param : maxByte 최대 바이트
 */
function cutByteLen(str, maxByte) {
	var b, i, c;
	for(b=i=0;c=str.charCodeAt(i);b+=c>>7?2:1) {
		if (b > maxByte){
			break;
		}
		i++;
	}
	return str.substring(0,i);
}

/*
 * 문자열길이 바이트단위로 리턴하는 함수
 * @param : str
 */
function getByteLength(str){
	var b, i, c;
    for(b=i=0; c=str.charCodeAt(i++); b+=c>>11?3:c>>7?2:1);
    return b;
}

/*
 * 컬럼 데이터 복사
 * @param : arrList 조회 데이터 리스트
 * @param : jsonList 복사할 컬럼 Json 리스트(fromCol: 복사할 컬럼, toCol: 붙여넣기할 컬럼)
 * return 변경된 조회 데이터 리스트
 */
function fnCopyColData(arrList, jsonList){
    arrList.forEach(function(arr) {
    	jsonList.forEach(function(json) {
    		arr[json.toCol] = arr[json.fromCol];
    	});
	});
    return arrList;
}


/**
 * 교수 기타담당자 코멘트 팝업
 * @param options
 * @returns
 */
function retrieveProfsrEtcChprCmPopup(profsrCd, etcChprSn) {
	fnCommonPopOpen("retrieveProfsrEtcChprCmPopup", 1280, 500);
	var $div = $('<div></div>');
	$div.attr('id', 'retrieveProfsrEtcChprCmPopupDiv');

	var $form = $('<form></form>');
	$form.attr('id', 'retrieveProfsrEtcChprCmPopupForm');
	$form.attr('action', '/cus/profsr/retrieveProfsrEtcChprCmPopup.do');
	$form.attr('method', 'post');
	$form.attr('target', 'retrieveProfsrEtcChprCmPopup');
	$div.appendTo('body');
	$form.appendTo('body');
	$form.append($('<input type="hidden" value="'+profsrCd+'" name="profsrCd">'));
	$form.append($('<input type="hidden" value="'+etcChprSn+'" name="etcChprSn">'));
	$form.submit();
}

function fnSwitchMsg(key) {
	let cbId = key + "Cb";
	let msgId = "#" + key + "Msg";
	if (document.getElementById(cbId).checked) {
		document.getElementById(key).value = 'Y';
		$(msgId).children(".switchmsg-on").show();
		$(msgId).children(".switchmsg-off").hide();
	} else {
		document.getElementById(key).value = 'N';
		$(msgId).children(".switchmsg-on").hide();
		$(msgId).children(".switchmsg-off").show();
	}
}

//true:전각, false:반각
function fnEmCheck(val, emYn) {
	var emYCnt = 0; // 전각
	var emNCnt = 0; // 반각
	for(var i=0; i< val.length; i++) {
		var c = val.charCodeAt(i);
		if(c < 256 || (c >= 0xff61 && c <= 0xff9f)) {
			emNCnt++;
		} else {
			emYCnt++;
		}
	}

	if(emYn == "Y") {
		if(emNCnt > 0) return false;
	} else {
		if(emYCnt > 0) return false;
	}

	return true;
}

function fnTrimCheck(obj) {
	obj.val(obj.val().trim());
}