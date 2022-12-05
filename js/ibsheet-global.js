var ibsGlobal;
ibsGlobal = ibsGlobal || {};


ibsGlobal.Msg = {
    "Lang" : {
        "Alert" : {
            "SYS_CanReloadStart" : "",
            "SYS_CanReloadChanges" : "모든 변경사항을 서버에 반영합니다.",
            "SYS_CanCancelChanges" : "모든 변경사항을 취소합니다.",
            "SYS_And" : "and",
            "SYS_CanReloadSelect" : "모든 선택을 지웁니다.",
            "SYS_CanReloadEnd" : "! 계속 하시겠습니까?",
            "SYS_ErrTimeout" : "데이터를 다운로드 할 수 없습니다. 시간이 초과되었습니다.",
            "SYS_AskTimeout" : "서버 시간초과로 데이터를 다운로드 할 수 없습니다. 재요청을 하시겠습니까?",
            "SYS_UploadTimeout" : "데이터를 업로드 할 수 없습니다. 시간이 초과되었습니다.",
            "SYS_AskUploadTimeout" : "서버 시간초과로 데이터를 업로드 할 수 없습니다. 재전송을 하시겠습니까?",
            "SYS_ErrHide" : "컬럼을 숨김 처리 할 수 없습니다!",
            "SYS_ErrHideExt" : "고정컬럼의 너비가 너무 큽니다!",
            "SYS_ErrPrintOpen" : "인쇄 다이얼로그를 열 수 없습니다.",
            "SYS_ErrPrint" : "문서 인쇄를 실패 하였습니다.",
            "SYS_ErrCheck" : "서버 동기화에 실패하였습니다. 업데이트를 임시적으로 제한하시겠습니까?",
            "SYS_NotFound" : "더 이상 찾을 항목이 없습니다.",
            "SYS_SearchStart" : "검색 결과가 없습니다. 처음부터 다시 찾으시겠습니까?",
            "SYS_SearchError" : "검색어 입력이 잘못되었습니다 !",
            "SYS_ErrAdd" : "여기에 새로운 행을 추가 할 수 없습니다.",
            "SYS_Invalid" : "잘못된 값",
            "SYS_DelRow" : "%d' 행을 삭제 하시겠습니까 ?",
            "SYS_DelSelected" : "%d 개의 선택된 행을 삭제 하시겠습니까 ?",
            "SYS_StyleErr" : "IBSheet CSS 스타일을 로드 할 수 없습니다 !",
            "SYS_ExportDownload" : "다운로드",
            "SYS_FoundResults" : "%d 개를 찾았습니다.",
            "SYS_PrintPrepared" : "출력할 준비가 되었습니다.",
            "SYS_InitColsError" : "이미 컬럼초기화가 되어있습니다. 컬럼초기화를 취소합니다.",
            "SYS_FrozenColsError" : "고정컬럼의 크기가 전체 컬럼 수 보다 같거나 큽니다.",
            "SYS_NoWordColumn" : "선택된 컬럼에서 데이터를 찾지 못했습니다.",
            "SYS_NoWordAll" : "시트 전체에서 데이터를 찾지 못했습니다.",
            "SYS_InitDataRowsError" : "DataRows 설정이 잘못되었습니다.",
            "SYS_InvalidExcelFileExtension" : "허용되지 않는 파일 형식입니다. 진행을 취소합니다.",
            "SYS_InvalidTextFileExtension" : "허용되지 않는 파일 형식입니다. 진행을 취소합니다.",
            "SYS_ExceedClipCopyRange" : "클립보드에 복사할 수 있는 데이터 범위를 초과하였습니다.",
            "SYS_InvalidComboList" : "콤보목록 설정이 올바르지 않습니다.( %s )",
            "SYS_LoadExcelError" : "엑셀 파일을 읽는 도중 예외가 발생하였습니다",
            "SYS_PivotPopupInvalidCols" : "피벗 테이블 컬럼 레이블 설정이 잘못 되었습니다.",
            "SYS_PivotPopupInvalidRows" : "피벗 테이블 행 레이블 설정이 잘못 되었습니다.",
            "SYS_PivotPopupInvalidValues" : "피벗 테이블 값 레이블 설정이 잘못 되었습니다.",
            "SYS_PivotPopupInvalidData" : "피벗 테이블 설정 대상 시트에 데이터가 없습니다.",
            "SYS_ExceedFileSize" : "최대 파일 크기를 초과 하였습니다. [최대 크기 : %d]"
        },
        "Text" : {
            "SYS_InvalidChildNodeInsert" : "부모 상태가 삭제이므로 자식레벨로 입력할 수 없습니다.",
            "SYS_InvalidChildNodeCopy" : "부모 상태가 삭제이므로 자식레벨은 복사할 수 없습니다.",
            "SYS_ParentDelNotDelete" : "부모행이 삭제상태여서 삭제 취소 할 수 없습니다.",
            "SYS_NotDelParent" : "자식 행이 있으면 삭제가 불가능합니다.",
            "SYS_NoUpRow" : "수정 상태의 행이 없습니다."        ,
            "SYS_NoInsRow" : "입력 상태의 행이 없습니다.",
            "SYS_NoDelRow" : "삭제 상태의 행이 없습니다.",
            "SYS_NoCopyArgument" : "복사할 행이 없습니다.",
            "SYS_NoMoveArgument" : "이동할 행이 없습니다.",
            "SYS_NoSumRow" : "합계행이 없습니다.",
            "SYS_DelSelected" : "선택한 행을 지웁니다.",
            "SYS_NoArgument" : "인자가 없습니다.",
            "SYS_IncorrectArg" : "인자값이 잘못되었습니다.",
            "SYS_IncorrectRow" : "삭제할 행이 데이터 범위가 아닙니다.",
            "SYS_ConfirmDelete" : "삭제하시겠습니까?",
            "SYS_NoDeleteData" : "삭제할 행이 선택되지 않았습니다.",
            "SYS_ExtentErr" : "그리드 공간이 부족합니다.",
            "SYS_Sort" : "소팅처리중..",
            "SYS_SelectAll" : "전체 선택중..",
            "SYS_DoFilter" : "필터링중..",
            "SYS_UpdateGrid" : "업데이트중..",
            "SYS_CollapseAll" : "접기 처리중..",
            "SYS_ExpandAll" : "펼침 처리중..",
            "SYS_Render" : "표시하는중..",
            "SYS_Page" : "",
            "SYS_NoPages" : "",
            "SYS_UpdateCfg" : "설정처리중..",
            "SYS_StartErr" : "<b style='color:#ff6600;'>그리드 표시중 오류가 발생하였습니다.</b>",
            "SYS_Calculate" : "계산중..",
            "SYS_UpdateValues" : "값 업데이트중..",
            "SYS_UpdateTree" : "트리 업데이트중..",
            "SYS_PageErr" : "데이타 영역을 다운로드할 수 없습니다.",
            "SYS_Layout" : "",
            "SYS_Load" : "잠시만 기다려주십시오..",
            "SYS_ColumnsCaption" : "선택 컬럼 표시",
            "SYS_ColUpdate" : "컬럼 업데이트중..",
            "SYS_Picture" : "이미지",
            "SYS_DefaultsDate" : "일자 선택 ...",
            "SYS_DefaultsButton" : "선택 ...",
            "SYS_GroupCustom" : "헤더 타이틀을 이곳에 끌어놓으십시오.",
            "SYS_Group" : "그룹핑중..",
            "SYS_DefaultsFilterOff" : "전체",
            "SYS_Items" : "아이템 %d - %d",
            "SYS_Print" : "<h2><center>인쇄를 준비하는 동안 잠시 기다려 주십시오.</center></h2>",
            "SYS_SearchMethodList" : "",
            "SYS_Contains" : "",
            "SYS_Starts" : "",
            "SYS_Ends" : "",
            "SYS_And" : "and",
            "SYS_Or" : "or",
            "SYS_Not" : "",
            "SYS_SearchSearch" : "조회",
            "SYS_SearchFilter" : "필터",
            "SYS_SearchSelect" : "선택",
            "SYS_SearchMark" : "마킹",
            "SYS_SearchFind" : "찾기",
            "SYS_SearchClear" : "초기화",
            "SYS_SearchHelp" : "도움말",
            "SYS_Search" : "조회중 ...",
            "SYS_Printed" : "Please switch to window containing the report to print it",
            "SYS_DoUndo" : "실행취소 처리중..",
            "SYS_DoRedo" : "다시실행 처리중..",
            "SYS_LoadStyles" : "스타일을 로딩중입니다 ...",
            "SYS_SetStyle" : "스타일 업데이트중..",
            "SYS_LoadPage" : "로딩하는중",
            "SYS_RenderPage" : "표시하는중",
            "SYS_ColWidth" : "컬럼폭을 조정하고 있습니다. '%d'",
            "SYS_ColMove" : "컬럼을 이동중입니다. '%d'",
            "SYS_Password" : "***",
            "SYS_DefaultsNone" : "모두 지우기",
            "SYS_RadioFilterOff" : "",
            "SYS_DragObjectMove" : "이동 행 <b style='color:green;'>%d</b>",
            "SYS_DragObjectCopy" : "복사 행 <b style='color:green;'>%d</b>",
            "SYS_DragObjectMoreMove" : "<b style='color:blue;'>%d</b> 개 행 이동",
            "SYS_DragObjectMoreCopy" : "<b style='color:blue;'>%d</b> 개 행 복사",
            "SYS_ExportFinished" : "<center><b>파일이 생성되었습니다.</b><br/><br/>버튼을 클릭하십시오<br/></center><br/>",
            "SYS_RenderProgressCaption" : "페이지 표시",
            "SYS_RenderProgressText" : "%d 페이지 중 %d 페이지가 완료되었습니다.",
            "SYS_RenderProgressCancel" : "",
            "SYS_PrintProgressCaption" : "파일 생성",
            "SYS_PrintProgressText" : "총 %d 개의 행중 %d 개 행이 완료되었습니다.",
            "SYS_PrintProgressCancel" : "취소",
            "SYS_ExportProgressCaption" : "파일 생성",
            "SYS_ExportProgressText" : "총 %d 개의 행중 %d 개 행이 완료되었습니다.",
            "SYS_ExportProgressCancel" : "취소",
            "SYS_ExpandProgressCaption" : "모든행을 확장",
            "SYS_ExpandProgressText" : "총 %d 개의 행중 %d 개 행이 완료되었습니다.",
            "SYS_ExpandProgressCancel" : "확장을 멈춤",
            "SYS_ExportCaption" : "다운로드할 컬럼을 선택",
            "SYS_PrintCaption" : "출력할 컬럼을 선택",
            "SYS_DefaultsAll" : "모두 선택",
            "SYS_DefaultsAlphabet" : "%d ...",
            "SYS_PrintRows" : "페이지별 최대 표시 행의 개수",
            "SYS_PrintExpanded" : "",
            "SYS_PrintFiltered" : "모든행 출력",
            "SYS_PrintOptions" : "프린트 옵션",
            "SYS_ExportOptions" : "Export 옵션",
            "SYS_ExportFormat" : "파일 포맷",
            "SYS_ExportFormats" : "XLS,CSV",
            "SYS_ExportExpanded" : "",
            "SYS_ExportFiltered" : "모든행 내보내기",
            "SYS_ExportOutline" : "Export tree in Excel outline",
            "SYS_ExportIndent" : "Indent tree in main column",
            "SYS_RemoveUnused" : "미사용 페이지 삭제",
            "SYS_ErrorSave" : "저장중 오류가 발생하였습니다.",
            "SYS_DatesRepeat" : "반복",
            "SYS_DatesStart" : "시작",
            "SYS_DatesEndTime" : "마지막",
            "SYS_DatesValue" : "값",
            "SYS_DatesRepeatEnum" : "||주|일|시간",
            "SYS_DatesRepeatKeys" : "||w|d|h",
            "SYS_RenderProgressCaptionRows" : "행 페이지 렌더링",
            "SYS_RenderProgressCaptionCols" : "컬럼 페이지 렌더링",
            "SYS_RenderProgressCaptionChildren" : "트리 페이지 렌더링",
            "SYS_StatusInsert" : "입력",
            "SYS_StatusUpdate" : "수정",
            "SYS_StatusDelete" : "삭제",
            "SYS_StatusRead" : "조회",
            "SYS_SaveConfirm" : "저장하시겠습니까?",
            "SYS_EmptySaveContent" : "저장할 내역이 없습니다.",
            "SYS_KeyFieldEmpty" : "%row 번째 행의 [%col](은)는 필수 입력 항목 입니다.",
            "SYS_SubSum" : "소계",
            "SYS_Cumulate" : "누계",
            "SYS_Sum" : "합계",
            "SYS_Avg" : "평균",
            "SYS_Cnt" : "개수",
            "SYS_NoType" : "타입이 맞지않아  편집이 불가합니다.",
            "SYS_NoEditType" : "편집 불가능한 DataType 입니다.",
            "SYS_NoValueCheck" : "값이 0 또는 1 이여야 합니다.",
            "SYS_LicenseError" : "라이센스를 발급받으시기 바랍니다.",
            "SYS_LicenseExpired" : "라이센스 기간이 만료되었습니다.",
            "SYS_MaximumBigValue" : "최대값 보다 큰 값 입니다. [최대값=%d]",
            "SYS_MinimumSmallValue" : "최소값 보다 작은 값 입니다. [최소값=%d]",
            "SYS_NoDataRow" : "No Data",
            "SYS_CloseFindDialog" : "검색창을 닫으시겠습니까?",
            "SYS_FindTitle" : "찾기",
            "SYS_FindContent" : "찾을 내용",
            "SYS_FindColumn" : "찾을 컬럼",
            "SYS_AllColumn" : "전체 컬럼",
            "SYS_SelectedColumn" : "선택 컬럼",
            "SYS_KindCongruence" : "일치 종류",
            "SYS_AllCongruence" : "모든 단어 일치",
            "SYS_FrontCongruence" : "앞글자 일치",
            "SYS_BackCongruence" : "뒷글자 일치",
            "SYS_MiddleCongruence" : "가운데 일치",
            "SYS_StartRowPosition" : "시작 위치",
            "SYS_FindFromFirstRow" : "첫 행부터 찾기",
            "SYS_FindFromFocusCell" : "포커스 셀 이후부터 찾기",
            "SYS_CaseSensitive" : "대/소문자 구분",
            "SYS_FindWrap" : "끝에서 되돌리기",
            "SYS_KeepDlg" : "찾은 후 닫지않기",
            "SYS_FindDialogFindButton" : "찾기",
            "SYS_FindDialogCancelButton" : "취소"       ,
            "SYS_InvalidDateFormat" : "날짜 형식에 맞지 않습니다.",
            "SYS_InvalidTimeFormat" : "시간 형식에 맞지 않습니다.",
            "SYS_InvalidCombo" : "일치하는 콤보 항목이 없습니다.",
            "SYS_InvalidNumberFormat" : "숫자 형식에 맞지 않습니다.",
            "SYS_NoFindString" : "찾으려는 값이 입력되지 않았습니다. 값을 입력하세요.",
            "SYS_FullInputWarning" : "%row 번째 행의 [%col]을(를) 모두 입력하십시오",
            "SYS_ExceededInputLength" : "데이터의 길이제한범위를 초과하였습니다.",
            "SYS_InsertSuccess" : "입력완료",
            "SYS_UpdateSuccess" : "수정완료",
            "SYS_SaveSuccess" : "저장완료",
            "SYS_SaveDup" : "저장중복",
            "SYS_SaveMiss" : "미처리",
            "SYS_SaveFail" : "저장오류",
            "SYS_ColSortAsc" : "오름차순 정렬",
            "SYS_ColSortDesc" : "내림차순 정렬",
            "SYS_ColHidden" : "컬럼 숨기기",
            "SYS_CancelColHidden" : "모든 컬럼 숨기기 취소",
            "SYS_SaveColInfo" : "컬럼 정보 저장",
            "SYS_ResetColInfo" : "컬럼 정보 저장 취소",
            "SYS_ShowFilter" : "필터행 사용",
            "SYS_HideFilter" : "필터행 사용 안함",
            "SYS_InvalidGetSaveString" : "KeyFieldError",
            "SYS_InvalidValue" : "유효하지 않은 문자 또는 문자열이 포함되어 있습니다.",
            "SYS_SearchDesc" : "조회 중 입니다.",
            "SYS_SaveDesc" : "저장 중 입니다.",
            "SYS_DownloadDesc" : "다운로드 중 입니다.",
            "SYS_UploadDesc" : "업로드 중 입니다.",
            "SYS_ProcessDesc" : "처리 중 입니다.",
            "SYS_PivotTitle" : "피벗 테이블 설정",
            "SYS_PivotTargetCol1" : "대상 컬럼 (일반)",
            "SYS_PivotTargetCol2" : "대상 컬럼 (숫자형)",
            "SYS_PivotColLabel" : "컬럼",
            "SYS_PivotRowLabel" : "행",
            "SYS_PivotValueLabel" : "값",
            "SYS_PivotButtonPivot" : "피벗테이블",
            "SYS_PivotButtonCross" : "크로스테이블",
            "SYS_PivotButtonBase" : "원본시트",
            "SYS_PivotButtonInit" : "초기화",
            "SYS_PivotButtonClose" : "닫기",
            "SYS_PivotRatioSumRow" : "행합계비율",
            "SYS_PivotRatioSumCol" : "열합계비율",
            "SYS_PivotInfoMessage" : "<li>대상 컬럼을 드래그하여 컬럼, 행, 값의 레이블을 설정 합니다.</li><li>컬럼과 행의 레이블에는 동일한 컬럼을 설정할 수 없습니다.</li>",
            "SYS_ExcelDone" : "엑셀 데이터가 로드 되었습니다.",
            "SYS_OverMaxRow" : "엑셀 데이터가 최대 행수 설정값 보다 많습니다.",
            "SYS_NoMatchedHeader" : "엑셀 데이터에 시트 헤더와 동일한 정보가 없습니다.",
            "SYS_FilterTitle" : "필터 입력",
            "SYS_FilterInfoMessage" : "<li>검색어와 연산자는 공백으로 구분</li><li>AND 연산자 : and, 공백, &<br/>ex) 대한 and 민국</li><li>OR 연산자 : or, |<br/>ex) 대한 or 민국</li><li>범위 연산자 : ~ <br/>ex) 10 ~ 20</li><li>검색어에 연산자 또는 공백이 포함되는 경우 \"\" 사용<br/>ex) \"대한 민국\", \"You and I\"</li>",
            "SYS_InvalidPaste" : "일부 셀에서 붙여넣기 작업을 실패하였습니다."
        },
        "MenuButtons" : {
            "SYS_Ok" : "선택",
            "SYS_Clear" : "취소",
            "SYS_Today" : "오늘",
            "SYS_All" : "전체선택",
            "SYS_Cancel" : "취소",
            "SYS_Yesterday" : "어제",
            "SYS_InputEmpty" : "공백",
            "SYS_EmptyTip" : "공백일자"
        },
        "MenuFilter" : {
            "SYS_F0" : "사용안함",
            "SYS_F1" : "같음",
            "SYS_F2" : "같지 않음",
            "SYS_F3" : "작음",
            "SYS_F4" : "같거나 작음",
            "SYS_F5" : "큼",
            "SYS_F6" : "같거나 큼",
            "SYS_F7" : "단어로 시작함",
            "SYS_F8" : "단어로 시작하지 않음",
            "SYS_F9" : "단어로 끝남",
            "SYS_F10" : "단어로 끝나지 않음",
            "SYS_F11" : "포함함",
            "SYS_F12" : "포함하지 않음",
            "SYS_CheckedText" : "1",
            "SYS_UnCheckedText" : "0"
        },
        "Format" : {
            "SYS_YearName" : "년",
            "SYS_LongDayNames" : "일요일,월요일,화요일,수요일,목요일,금요일,토요일",
            "SYS_ShortDayNames" : "일,월,화,수,목,금,토",
            "SYS_Day2CharNames" : "일,월,화,수,목,금,토",
            "SYS_Day1CharNames" : "일,월,화,수,목,금,토",
            "SYS_LongMonthNames" : "1월,2월,3월,4월,5월,6월,7월,8월,9월,10월,11월,12월",
            "SYS_LongMonthNames2" : "1월,2월,3월,4월,5월,6월,7월,8월,9월,10월,11월,12월",
            "SYS_ShortMonthNames" : "1월,2월,3월,4월,5월,6월,7월,8월,9월,10월,11월,12월",
            "SYS_DayNumbers" : "1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,11th,12th,13th,14th,15th,16th,17th,18th,19th,20th,21st,22nd,23rd,24th,25th,26th,27th,28th,29th,30th,31st",
            "SYS_Quarters" : "I,II,III,IV",
            "SYS_Halves" : "I,II",
            "SYS_DateSeparator" : "-",
            "SYS_InputDateSeparators" : "/.-",
            "SYS_TimeSeparator" : ":",
            "SYS_InputTimeSeparators" : ":",
            "SYS_AMDesignator" : "AM",
            "SYS_PMDesignator" : "PM",
            "SYS_FirstWeekDay" : "0",
            "SYS_FirstWeekYearDay" : "3",
            "SYS_NaD" : "",
            "SYS_GMT" : "0",
            "SYS_d" : "yyyy-MM-dd",
            "SYS_g" : "yyyy-MM-dd HH:mm",
            "SYS_G" : "yyyy-MM-dd HH:mm:ss",
            "SYS_m" : "yyyy/MM",
            "SYS_M" : "MM/dd",
            "SYS_t" : "HH:mm",
            "SYS_T" : "HH:mm:ss",
            "SYS_ValueSeparator" : ";",
            "SYS_ValueSeparatorHtml" : ";",
            "SYS_RangeSeparator" : "~",
            "SYS_RangeSeparatorHtml" : "~",
            "SYS_RepeatSeparator" : "#",
            "SYS_CountSeparator" : "*",
            "SYS_AddSeparator" : "+",
            "SYS_DecimalSeparator" : ".",
            "SYS_InputDecimalSeparators" : ".,",
            "SYS_GroupSeparator" : ",",
            "SYS_InputGroupSeparators" : "",
            "SYS_Percent" : "%",
            "SYS_NaN" : "",
            "SYS_ng" : "0.######",
            "SYS_nf" : "0.00",
            "SYS_nc" : "$###########0.00",
            "SYS_np" : "0.00%",
            "SYS_nr" : "0.0000",
            "SYS_ne" : "0.000000 E+000",
            "SYS_Cont" : "...",
            "SYS_ContLeft" : "...",
            "SYS_ContRight" : "...",
            "SYS_EmptyDate" : ""
        },
        "User" : {
        }
    }
};

ibsGlobal.MainCss = "";

ibsGlobal.MainCss += '/* Base tags */';
ibsGlobal.MainCss += '.GMImage {padding-bottom:256px;}';
ibsGlobal.MainCss += '.GMNone {display:none;}';
ibsGlobal.MainCss += '.GMSection,.GMSectionFF3, .GMChildPart {table-layout:fixed; width:0;}';
ibsGlobal.MainCss += '.GMSectionFF3 {border-collapse:collapse; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Sections */';
ibsGlobal.MainCss += '.GMMainTable {border:1px solid #c7c7c7; border-collapse:separate; text-align:left; background:#ffffff; font-size:12px; font-family:"NotoKrR","돋움",Dotum,AppleGothic,sans-serif;}';
ibsGlobal.MainCss += '.GMFootLeft,.GMFootMid,.GMFootRight {border-top:1px solid #4C84FF;}';
ibsGlobal.MainCss += '.GMHeadLeft,.GMBodyLeft,.GMFootLeft,.GMHScrollLeft {border-right:1px solid #c7c7c7;}    ';
ibsGlobal.MainCss += '.GMHeadRight,.GMBodyRight,.GMFootRight,.GMHScrollRight {border-left:1px solid #c7c7c7;} ';
ibsGlobal.MainCss += '.GMVScroll {padding-top:1px; padding-bottom:1px;}';
ibsGlobal.MainCss += '.GMHScrollLeft,.GMHScrollMid,.GMHScrollLeftResizeTouch,.GMHScrollRightResizeTouch {padding-left:1px; padding-right:1px; cursor:default;}';
ibsGlobal.MainCss += '.GMHScrollLeftResizeTouch {border-right:2px solid #000000; padding-right:18px; background:#F4F4F4;}';
ibsGlobal.MainCss += '.GMHScrollRightResizeTouch {border-left:2px solid #000000; padding-left:18px; background:#F4F4F4;}';
ibsGlobal.MainCss += '.GMHScrollMidLeftResizeTouch {border-left:1px solid #000000; padding-left:19px; background:#F4F4F4;}';
ibsGlobal.MainCss += '.GMHScrollMidRightResizeTouch {border-right:1px solid #000000; padding-right:19px; background:#F4F4F4;}';
ibsGlobal.MainCss += '.GMHScrollWide {padding-right:1px;}';
ibsGlobal.MainCss += '.GMHScrollHidden {overflow:visible !important; background:#F4F4F4; cursor:default; }';
ibsGlobal.MainCss += '.GMXScroll {background:#F4F4F4;}';
ibsGlobal.MainCss += '.GMPage {border-top:0px solid #E0E0E0;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Rows */';
ibsGlobal.MainCss += '.GMSpaceRowHeight{height:21px; }';
ibsGlobal.MainCss += '.GMRowHeight     {height:18px; }';
ibsGlobal.MainCss += '.GMRowHeightTouch{height:22px; }';
ibsGlobal.MainCss += '.GMSpaceMargin   {margin:0; }';
ibsGlobal.MainCss += '.GMSpaceMarginTouch{margin:0; }';
ibsGlobal.MainCss += '.GMSpaceRow {background:#ffffff; white-space:nowrap; overflow:hidden; padding-top:2px; padding-bottom:2px; border-bottom:1px solid #D6D6D6;}';
ibsGlobal.MainCss += '.GMGroupRow,.GMSearchRow,.GMPagerRow ';
ibsGlobal.MainCss += '{background-color:#0171bc; white-space:nowrap; padding-top:1px; padding-bottom:1px; overflow:hidden; border-bottom:1px solid #99BCE8;} ';
ibsGlobal.MainCss += '.GMGroupRow,.GMPagerRow {background-position:0 -1801px; padding-top: 4px; padding-bottom: 4px}';
ibsGlobal.MainCss += '.GMFillRow {background:#ffffff; }';
ibsGlobal.MainCss += '.GMRowAbove,.GMRowBelow {border-left:1px solid #9cb6c8; border-right:1px solid #9cb6c8;}';
ibsGlobal.MainCss += '.GMRowAbove { margin-top:3px; overflow:hidden;}';
ibsGlobal.MainCss += '.GMRowBelow {margin-bottom:3px; overflow:hidden;}';
ibsGlobal.MainCss += '.GMCountRowTop {background-color:#F5F6FA; white-space:nowrap;padding-top:1px; padding-bottom:1px; overflow:hidden; border-bottom:1px solid #c7c7c7;}'; //cell카운트 문지환
ibsGlobal.MainCss += '.GMCountRowTop span {color:#4C84FF;}'; //cell카운트 문지환
ibsGlobal.MainCss += '.GMCountRowBottom {background-color:#fdfdfd; white-space:nowrap; padding-top:1px; padding-bottom:1px; overflow:hidden; border-top:1px solid #c7c7c7;}';
ibsGlobal.MainCss += '.GMCountFont { font-size:/*IBFS*/12px; font-family:"NotoKrR","돋움",Dotum,AppleGothic,sans-serif; padding-left:0 !important; text-shadow: 0 0 1px rgba(0,0,0,0.2); color:#666666; }';
ibsGlobal.MainCss += '.GMNoDataRow {padding-top:0; padding-bottom:0; background-color:#ffffff; color:#000000; line-height:27px;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Cell */'; // 문지환
ibsGlobal.MainCss += '.GMCell,.GMCellPanel,.GMCellFilter,.GMHeaderDrag,.GMHeaderGroup ';
ibsGlobal.MainCss += ' {border-bottom:1px solid #D6D6D6; border-right:1px solid #D6D6D6; border-left:0; border-top:0;vertical-align:top; overflow:hidden; height:auto; padding-left:11px; padding-right:11px; font-size:/*IBFS*/12px; font-family:"NotoKrR","돋움",Dotum,AppleGothic,sans-serif;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMCellHeader,.GMCellHeaderEmpty';
ibsGlobal.MainCss += ' {vertical-align:middle; overflow:hidden;height:auto; background-color:#fdfdfd; padding-top:1px; border-right:1px solid #D6D6D6; border-bottom:1px solid #D6D6D6;} ';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMHeaderGroup, .GMHeaderGroupCustom { vertical-align: middle; height:20px; text-align: center; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMCellBorderFF3 {border-left:0;border-top:0;} ';
ibsGlobal.MainCss += '.GMCellSpace {vertical-align:middle;}';
ibsGlobal.MainCss += '/*.GMCellSpace {vertical-align:top; padding-top:5px !important; }*/';
ibsGlobal.MainCss += '.GMCellSpacePanel,.GMCellSpaceBool {vertical-align:top; }';
ibsGlobal.MainCss += '.GMCellSpaceRadio { padding-top:3px !important;}';
ibsGlobal.MainCss += '.GMCellSpaceEditButton { vertical-align:top; padding-top:4px !important; border:1px solid #000000 !important; background-color:#ffffff !important; }';
ibsGlobal.MainCss += '.GMCellSpaceButtonButton { vertical-align:top; }';
ibsGlobal.MainCss += '.GMCellSpaceButton { vertical-align:top; padding-top:5px !important; white-space:nowrap; }';
ibsGlobal.MainCss += '.GMCellSpaceAbove { border-top:1px solid #9cb6c8; }';
ibsGlobal.MainCss += '.GMCellSpaceBelow { border-bottom:1px solid #9cb6c8; }';
ibsGlobal.MainCss += '.GMCellPanel,.GMCellHeaderPanel{ white-space:nowrap; } ';
ibsGlobal.MainCss += '.GMCellHidden { background:transparent!important; border-top:none!important; border-bottom:none!important; }';
ibsGlobal.MainCss += '.GMHeaderButton { padding:0; }';
ibsGlobal.MainCss += '.GMHeaderGroup {background: #FDFDFD; color:#505050; font-weight: bold; border-radius: 5px; margin:0 2px 0 2px; line-height:20px;}';
ibsGlobal.MainCss += '.GMHeaderGroupFocus {background-color: #C0C0A0; }';
ibsGlobal.MainCss += '.GMHeaderGroupDelete {background-color: #F0F0E0; color: #F0F0E0; }';
ibsGlobal.MainCss += '.GMHeaderGroupCustom {color:#fff; padding-left:5px; cursor:default; white-space:nowrap; }';
ibsGlobal.MainCss += '.GMHeaderDrag {background: #9FB9E9; cursor:default; overflow:hidden; }';
ibsGlobal.MainCss += '.GMHeaderFocus {background: #9FB9E9;}';
ibsGlobal.MainCss += '.GMPanel {padding-left:80px;}';
ibsGlobal.MainCss += '.GMNoTreeLines1 {text-align:right;}';
ibsGlobal.MainCss += '.GMNoTreeLines2 {text-align:right; vertical-align:middle; padding-top:0;}';
ibsGlobal.MainCss += '.GMTree {padding-top:0; white-space:nowrap;}';
ibsGlobal.MainCss += '.GMSpannedTree {vertical-align:top;}';
ibsGlobal.MainCss += '.GMCellClassInner {padding-top:0; padding-bottom:0;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Inside cell */'; // 문지환
ibsGlobal.MainCss += '.GMStatus,.GMSeq,.GMPopup,.GMPopupEdit,.GMHtml,.GMText,.GMLines,.GMPass,.GMInt,.GMFloat,.GMDate,.GMNumber,';
ibsGlobal.MainCss += '.GMLink,.GMImg,.GMRadio,.GMRadioText,.GMList,.GMEnum,.GMAbs,.GMPagerEdit,.GMUser,.GMResult,.GMBtn ';
ibsGlobal.MainCss += ' {white-space:nowrap;vertical-align: middle;padding:0 11px;}  /*IH*/';//cell 여백
ibsGlobal.MainCss += '.GMInt,.GMFloat { text-align:right; }';
ibsGlobal.MainCss += '.GMLines,.GMRadio,.GMHtml,.GMList { white-space:normal; }   ';
ibsGlobal.MainCss += '.GMImg,.GMHtml {padding:0 11px; } ';
ibsGlobal.MainCss += '.GMRadio,.GMRadioText { padding:0; font-weight:normal !important; }';
ibsGlobal.MainCss += '.GMBool { text-align:center; }';
ibsGlobal.MainCss += '.GMIcon { background-repeat:no-repeat; }';
ibsGlobal.MainCss += '.GMHiddenSpace { display:none; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMHeaderText {padding:1px 11px; color: #989EB3; background:#fff; vertical-align:middle; font-size:/*IBFS*/12px; text-shadow: 0 0 1px rgba(0,0,0,0.2); font-weight:700; font-family:"NotoKrR","돋움",Dotum,AppleGothic,sans-serif;}';
ibsGlobal.MainCss += '.GMAbs { padding:0; }';
ibsGlobal.MainCss += '.GMUser { padding:0; }';
ibsGlobal.MainCss += '.GMPagerEdit { text-align:right; padding-top:5px; padding:0 !important;}';
ibsGlobal.MainCss += '.GMPagerTotal { text-align:left; padding-top:0px; }';
ibsGlobal.MainCss += '.GMEditPager { /*background-color:#ffffff; border:1px solid gray;*/font-size:/*IBFS*/12px; font-family:"NotoKrR","돋움",Dotum,AppleGothic,sans-serif;}';
ibsGlobal.MainCss += '.GMMergedCellH {padding:0 0 5px 0}';
ibsGlobal.MainCss += '.GMMergedCellV {padding:0 0 1px 0}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMWrap0 { white-space:nowrap; }';
ibsGlobal.MainCss += '.GMWrap1 { white-space:normal; word-wrap:break-word; }';
ibsGlobal.MainCss += '.GMEllipsis { white-space:nowrap; text-overflow:ellipsis;}';
ibsGlobal.MainCss += '';// 문지환 text-align
ibsGlobal.MainCss += '.GMAlignLeft { text-align:left; border-right: 1px solid #D6D6D6 !important;}';
ibsGlobal.MainCss += '.GMAlignCenter { text-align:center; border-right: 1px solid #D6D6D6 !important;}';
ibsGlobal.MainCss += '.GMAlignJustify { text-align:center; }';
ibsGlobal.MainCss += '.GMAlignRight { text-align:right; border-right: 1px solid #D6D6D6 !important;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMValignTop { vertical-align:top; }';
ibsGlobal.MainCss += '.GMValignMiddle { vertical-align:middle; }';
ibsGlobal.MainCss += '.GMValignBottom { vertical-align:bottom;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMCellButtonBase {';
ibsGlobal.MainCss += '    color: #fff;';
ibsGlobal.MainCss += '    display: inline-block;';
ibsGlobal.MainCss += '    padding: 2px 10px 3px;';
ibsGlobal.MainCss += '    text-decoration: none;';
ibsGlobal.MainCss += '    border-radius: 3px;';
ibsGlobal.MainCss += '    -moz-border-radius: 3px;';
ibsGlobal.MainCss += '    -webkit-border-radius: 3px;';
ibsGlobal.MainCss += '    box-shadow: 0 1px 3px rgba(0,0,0,0.5);';
ibsGlobal.MainCss += '    -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);';
ibsGlobal.MainCss += '    -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);';
ibsGlobal.MainCss += '    border-bottom: 1px solid rgba(0,0,0,0.25);';
ibsGlobal.MainCss += '    line-height: 1;';
ibsGlobal.MainCss += '    border:0;';
ibsGlobal.MainCss += '    font-family: "Dotum";';
ibsGlobal.MainCss += '    font-weight: bold;';
ibsGlobal.MainCss += '    text-shadow: 0 -1px 1px rgba(0,0,0,0.25);';
ibsGlobal.MainCss += '    height: 20px;';
ibsGlobal.MainCss += '}';
ibsGlobal.MainCss += '.GMCellButton {';
ibsGlobal.MainCss += '    cursor: pointer;';
ibsGlobal.MainCss += '    background-color: #05246e;';
ibsGlobal.MainCss += '}';
ibsGlobal.MainCss += '.GMCellButton0 {';
ibsGlobal.MainCss += '    cursor:default;';
ibsGlobal.MainCss += '    background-color: #989eb3;';
ibsGlobal.MainCss += '}';
ibsGlobal.MainCss += '.GMCellButton:hover { background-color: #222222; }';
ibsGlobal.MainCss += '.GMCellButton0:hover {}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Tree Img with lines */';
ibsGlobal.MainCss += '.GM000,.GM010,.GM001,.GM011,.GM100,.GM110,.GM101,.GM111, ';
ibsGlobal.MainCss += '.GM000T,.GM010T,.GM001T,.GM011T,.GM100T,.GM110T,.GM101T,.GM111T,';
ibsGlobal.MainCss += '.GM00,.GM01,.GM10,.GM11,.GM00T,.GM01T,.GM10T,.GM11T,';
ibsGlobal.MainCss += '.GM0T,.GM1T,.GM0TL,.GM1TL,.GM0C,.GM1C,.GM0CL,.GM1CL,.GM0E,.GM1E,.GM0EL,.GM1EL,';
ibsGlobal.MainCss += '.GM0,.GM1,.GMT,.GMTL,.GMC,.GMCL,.GME,.GMEL,.GMD0,.GMD1,.GMD2,.GMD3,.GMD4,.GMD0L,.GMD1L,.GMD2L,.GMD3L,.GMD4L ';
ibsGlobal.MainCss += '{background-image:url(Tree.gif); vertical-align:top; background-size: 2000px;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += 'u.GM000,u.GM010,u.GM001,u.GM011,u.GM100,u.GM110,u.GM101,u.GM111 { padding-left:39px; }';
ibsGlobal.MainCss += 'u.GM000T,u.GM010T,u.GM001T,u.GM011T,u.GM100T,u.GM110T,u.GM101T,u.GM111T { padding-left:60px; }';
ibsGlobal.MainCss += 'u.GM00,u.GM01,u.GM10,u.GM11 { padding-left:26px; }   ';
ibsGlobal.MainCss += 'u.GM00T,u.GM01T,u.GM10T,u.GM11T { padding-left:47px; }   ';
ibsGlobal.MainCss += 'u.GM0T,u.GM1T,u.GM0TL,u.GM1TL,u.GM0C,u.GM1C,u.GM0CL,u.GM1CL,u.GM0E,u.GM1E,u.GM0EL,u.GM1EL { padding-left:34px; }   ';
ibsGlobal.MainCss += 'u.GM0,u.GM1 { padding-left:13px; }';
ibsGlobal.MainCss += 'u.GMT,u.GMTL,u.GMC,u.GMCL,u.GME,u.GMEL,u.GMD0,u.GMD1,u.GMD2,u.GMD3,u.GMD4,u.GMD0L,u.GMD1L,u.GMD2L,u.GMD3L,u.GMD4L { padding-left:21px; }   ';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GM000,.GM000T{ background-position:-24px 0px; }';
ibsGlobal.MainCss += '.GM010,.GM010T{ background-position:-136px 0; }';
ibsGlobal.MainCss += '.GM001,.GM001T{ background-position:-272px 0; }';
ibsGlobal.MainCss += '.GM011,.GM011T{ background-position:-392px 0; }';
ibsGlobal.MainCss += '.GM100,.GM100T{ background-position:-512px 0; }';
ibsGlobal.MainCss += '.GM110,.GM110T{ background-position:-640px 0; }';
ibsGlobal.MainCss += '.GM101,.GM101T{ background-position:-768px 0; }';
ibsGlobal.MainCss += '.GM111,.GM111T{ background-position:-896px 0; }';
ibsGlobal.MainCss += '.GM00,.GM00T  { background-position:-37px 0;  }';
ibsGlobal.MainCss += '.GM10,.GM10T  { background-position:-149px 0; }';
ibsGlobal.MainCss += '.GM01,.GM01T  { background-position:-285px 0; }';
ibsGlobal.MainCss += '.GM11,.GM11T  { background-position:-405px 0; }';
ibsGlobal.MainCss += '.GM0,.GM0T    { background-position:-50px 0;  }';
ibsGlobal.MainCss += '.GM1,.GM1T    { background-position:-298px 0; }';
ibsGlobal.MainCss += '.GMT          { background-position:-63px 0;  }';
ibsGlobal.MainCss += '.GM0TL        { background-position:-1032px 0; }';
ibsGlobal.MainCss += '.GM1TL        { background-position:-1088px 0; }';
ibsGlobal.MainCss += '.GM0C         { background-position:-1160px 0; }';
ibsGlobal.MainCss += '.GM1C         { background-position:-1216px 0; }';
ibsGlobal.MainCss += '.GM0CL        { background-position:-1288px 0; }';
ibsGlobal.MainCss += '.GM1CL        { background-position:-1344px 0; }';
ibsGlobal.MainCss += '.GM0E         { background-position:-1416px 0; }';
ibsGlobal.MainCss += '.GM1E         { background-position:-1472px 0; }';
ibsGlobal.MainCss += '.GM0EL        { background-position:-1544px 0; }';
ibsGlobal.MainCss += '.GM1EL        { background-position:-1600px 0; }';
ibsGlobal.MainCss += '.GMTL         { background-position:-1045px 0; }';
ibsGlobal.MainCss += '.GMC          { background-position:-1173px 0; }';
ibsGlobal.MainCss += '.GMCL         { background-position:-1301px 0; }';
ibsGlobal.MainCss += '.GME          { background-position:-1429px 0; }';
ibsGlobal.MainCss += '.GMEL         { background-position:-1557px 0; }';
ibsGlobal.MainCss += '.GMD0         { background-position:-1664px 0; }';
ibsGlobal.MainCss += '.GMD1         { background-position:-1696px 0; }';
ibsGlobal.MainCss += '.GMD2         { background-position:-1728px 0; }';
ibsGlobal.MainCss += '.GMD3         { background-position:-1760px 0; }';
ibsGlobal.MainCss += '.GMD0L        { background-position:-1792px 0; }';
ibsGlobal.MainCss += '.GMD1L        { background-position:-1824px 0; }';
ibsGlobal.MainCss += '.GMD2L        { background-position:-1856px 0; }';
ibsGlobal.MainCss += '.GMD3L        { background-position:-1888px 0; }';
ibsGlobal.MainCss += '.GMD4         { background-position:-1920px 0; }';
ibsGlobal.MainCss += '.GMD4L        { background-position:-1952px 0; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Tree Img without lines  */';
ibsGlobal.MainCss += '.GMND0,.GMND1,.GMND2,.GMND3,.GMND4,.GMNC,.GMNE,.GMNCR,.GMNER {background-image:url(TreeN.png); background-repeat:no-repeat; vertical-align:top; }';
ibsGlobal.MainCss += 'u.GMND0,u.GMND1,u.GMND2,u.GMND3,u.GMND4,u.GMNC,u.GMNE,u.GMNCR,u.GMNER { padding-left:20px; }';
ibsGlobal.MainCss += '.GMND0 { background-position: -6px 0; }';
ibsGlobal.MainCss += '.GMND1 { background-position: -56px 0; }';
ibsGlobal.MainCss += '.GMND2 { background-position: -106px 0; }';
ibsGlobal.MainCss += '.GMND3 { background-position: -156px 0; }';
ibsGlobal.MainCss += '.GMND4 { background-position: -206px 0; }';
ibsGlobal.MainCss += '.GMNC { background-position:right -50px;}';
ibsGlobal.MainCss += '.GMNE { background-position:right -2000px;}';
ibsGlobal.MainCss += '.GMNCR { background-position:-255px -50px;}';
ibsGlobal.MainCss += '.GMNER { background-position:-255px -2000px;}';
ibsGlobal.MainCss += 'u.GMNL { padding-left:21px; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Tree Node Image */';
ibsGlobal.MainCss += '.GMTreeNodeIcon0, .GMTreeNodeIcon1, .GMTreeNodeIcon2 { background-position:2px 4px; background-repeat:no-repeat; background-size:16px; }';
ibsGlobal.MainCss += '.GMTreeNodeIcon0 { background-image:url(treenode0.png); }';
ibsGlobal.MainCss += '.GMTreeNodeIcon1 { background-image:url(treenode1.png); }';
ibsGlobal.MainCss += '.GMTreeNodeIcon2 { background-image:url(treenode2.png); }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Cell images */';
ibsGlobal.MainCss += '.GMIconLink { text-decoration:none; width:1000px; display:inline-block; }';
ibsGlobal.MainCss += '.GMIconLeft,.GMIconRight,.GMIconCenter {  background-repeat:no-repeat; }';
ibsGlobal.MainCss += '.GMIconLeft { background-position:left 0; padding-left:20px !important; }';
ibsGlobal.MainCss += '.GMIconRight { background-position:right 0; padding-right:20px !important; }';
ibsGlobal.MainCss += '.GMIconCenter { background-position:center 0; }';
ibsGlobal.MainCss += '.GMPopupRight { background:url(view_btn.png) no-repeat center center; background-size:10px; }'; //돋보기 아이콘
ibsGlobal.MainCss += '.GMExpandLeft,.GMCollapseLeft,.GMExpandHeaderLeft,.GMCollapseHeaderLeft { padding-left:20px!important; }';
ibsGlobal.MainCss += '.GMDateRight{ padding-right:20px!important;}';
ibsGlobal.MainCss += 'u.GMDateRight,u.GMPopupRight { padding-right:0!important; padding-left:17px; }';
ibsGlobal.MainCss += '.GMDateRight {background:url(grid_calendar.png) no-repeat 0px center; background-size:12px;}'; // 달력 아이콘
ibsGlobal.MainCss += '.GMEnumRight { background:url(combo.png) no-repeat 0px center; background-size:16px;}';
ibsGlobal.MainCss += 'u.GMEnumRight {padding-right:0; padding-left:17px}';
ibsGlobal.MainCss += '.GMExpandLeft { background:url(ic_plus.png) no-repeat 3px center; background-size: 12px; padding:2px 0 0  18px; _padding:0 0 0 18px }';
ibsGlobal.MainCss += '.GMCollapseLeft { background:url(ic_minus.png) no-repeat 3px center; background-size: 12px; padding:2px 0 0  18px; _padding:0 0 0 18px }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMRadio0Left,.GMRadio1Left,.GMRadio2Left,.GMRadio3Left,.GMRadioRO0Left,.GMRadioRO1Left,.GMRadioRO2Left,.GMRadioRO3Left { padding-left:17px; padding-right:10px; line-height:17px; background-repeat:no-repeat; background-position:3px 50%;}';
ibsGlobal.MainCss += '.GMRadio0Right,.GMRadio1Right,.GMRadio2Right,.GMRadio3Right,.GMRadioRO0Right,.GMRadioRO1Right,.GMRadioRO2Right,.GMRadioRO3Right {line-height:17px; padding-right:17px; padding-left:10px; background-repeat:no-repeat; background-position:3px 50%;}';
ibsGlobal.MainCss += '.GMRadio0Left  { background-image:url(chk2.png); background-size:14px;} ';
ibsGlobal.MainCss += '.GMRadioRO0Left  { background-image:url(chk2R.png); background-size:14px;} ';
ibsGlobal.MainCss += '.GMRadio1Left  { background-image:url(chk3.png); background-size:14px;} ';
ibsGlobal.MainCss += '.GMRadioRO1Left  { background-image:url(chk3R.png); background-size:14px;} ';
ibsGlobal.MainCss += '.GMRadio2Left  { background-image:url(chk0.png); background-size:14px;}';
ibsGlobal.MainCss += '.GMRadioRO2Left  { background-image:url(chk0R.png); background-size:14px;}';
ibsGlobal.MainCss += '.GMRadio3Left  { background-image:url(chk1.png); background-size:14px;}';
ibsGlobal.MainCss += '.GMRadioRO3Left  { background-image:url(chk1R.png); background-size:14px;}';
ibsGlobal.MainCss += '.GMRadio0Right { background-image:url(chk2.png); background-size:14px;} ';
ibsGlobal.MainCss += '.GMRadioRO0Right { background-image:url(chk2R.png); background-size:14px;} ';
ibsGlobal.MainCss += '.GMRadio1Right { background-image:url(chk3.png); background-size:14px;} ';
ibsGlobal.MainCss += '.GMRadioRO1Right { background-image:url(chk3R.png); background-size:14px;} ';
ibsGlobal.MainCss += '.GMRadio2Right { background-image:url(chk0.png); background-size:14px;}';
ibsGlobal.MainCss += '.GMRadioRO2Right { background-image:url(chk0R.png); background-size:14px;}';
ibsGlobal.MainCss += '.GMRadio3Right { background-image:url(chk1.png); background-size:14px;}';
ibsGlobal.MainCss += '.GMRadioRO3Right { background-image:url(chk1R.png); background-size:14px;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += 'u.GMFilter0,u.GMFilter1 { padding-left:16px; }';
ibsGlobal.MainCss += '.GMBool0,.GMBool0RO,.GMBool1,.GMBool1RO,.GMBool2,.GMBool2RO,.GMBool3,.GMBool3RO {background-position:center center; background-repeat:no-repeat;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMCheck0Left, .GMCheck1Left, .GMCheckRO0Left, .GMCheckRO1Left { background-repeat:no-repeat; padding-left:20px!important; background-position:3px 50%;}';
ibsGlobal.MainCss += '.GMCheck0Left   { background-image:url(chk0.png); background-size: 14px;}';
ibsGlobal.MainCss += '.GMCheck1Left   { background-image:url(chk1.png); background-size: 14px;}';
ibsGlobal.MainCss += '.GMCheckRO0Left { background-image:url(chk0R.png); background-size: 14px;}';
ibsGlobal.MainCss += '.GMCheckRO1Left { background-image:url(chk1R.png); background-size: 14px;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMBool0   { background-image:url(view_check.png); background-size: 14px; }';
ibsGlobal.MainCss += '.GMBool0RO { background-image:url(view_check_inactive.png); background-size: 14px; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMBool1   { background-image:url(view_check_on.png); background-size: 14px; }';
ibsGlobal.MainCss += '.GMBool1RO { background-image:url(view_check_on_inactive.png); background-size: 14px; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMBool2   { background-image:url(chk2.png); background-size: 14px; }';
ibsGlobal.MainCss += '.GMBool2RO { background-image:url(chk2R.png); background-size: 14px; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMBool3   { background-image:url(chk3.png); background-size: 14px; }';
ibsGlobal.MainCss += '.GMBool3RO { background-image:url(chk3R.png); background-size: 14px; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Filter images  */';
ibsGlobal.MainCss += '.GMFilter0Left,.GMFilter1Left,.GMFilter2Left,.GMFilter3Left,.GMFilter4Left,.GMFilter5Left,.GMFilter6Left,.GMFilter7Left,';
ibsGlobal.MainCss += '.GMFilter8Left,.GMFilter9Left,.GMFilter10Left,.GMFilter11Left,.GMFilter12Left {width:100%; height:18px; padding-left:18px;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMFilter0Left,.GMFilter0Menu   { background:url(filter0.png) no-repeat left center; background-size: 18px;}   ';
ibsGlobal.MainCss += '.GMFilter1Left,.GMFilter1Menu   { background:url(filter1.png) no-repeat left center; background-size: 18px;}';
ibsGlobal.MainCss += '.GMFilter2Left,.GMFilter2Menu   { background:url(filter2.png) no-repeat left center; background-size: 18px;}';
ibsGlobal.MainCss += '.GMFilter3Left,.GMFilter3Menu   { background:url(filter3.png) no-repeat left center; background-size: 18px;}';
ibsGlobal.MainCss += '.GMFilter4Left,.GMFilter4Menu   { background:url(filter4.png) no-repeat left center; background-size: 18px;}';
ibsGlobal.MainCss += '.GMFilter5Left,.GMFilter5Menu   { background:url(filter5.png) no-repeat left center; background-size: 18px;}   ';
ibsGlobal.MainCss += '.GMFilter6Left,.GMFilter6Menu   { background:url(filter6.png) no-repeat left center; background-size: 18px;}';
ibsGlobal.MainCss += '.GMFilter7Left,.GMFilter7Menu   { background:url(filter7.png) no-repeat left center; background-size: 18px;}';
ibsGlobal.MainCss += '.GMFilter8Left,.GMFilter8Menu   { background:url(filter8.png) no-repeat left center; background-size: 18px;}';
ibsGlobal.MainCss += '.GMFilter9Left,.GMFilter9Menu   { background:url(filter9.png) no-repeat left center; background-size: 18px;}';
ibsGlobal.MainCss += '.GMFilter10Left,.GMFilter10Menu { background:url(filter10.png) no-repeat left center; background-size: 18px;}';
ibsGlobal.MainCss += '.GMFilter11Left,.GMFilter11Menu { background:url(filter11.png) no-repeat left center; background-size: 18px;}';
ibsGlobal.MainCss += '.GMFilter12Left,.GMFilter12Menu { background:url(filter12.png) no-repeat left center; background-size: 18px;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMFilter0Menu,.GMFilter1Menu,.GMFilter2Menu,.GMFilter3Menu,.GMFilter4Menu,.GMFilter5Menu,.GMFilter6Menu,.GMFilter7Menu,.GMFilter8Menu,.GMFilter9Menu,';
ibsGlobal.MainCss += '.GMFilter10Menu,.GMFilter11Menu,.GMFilter12Menu {width:18px; height:18px; overflow:hidden; margin: 4px 0 0 -1px;}';
ibsGlobal.MainCss += '.GMFilterMenuHeader { padding-left:2px; border-bottom:0 !important; } ';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/*  Keyfield Image(필수값) */';
ibsGlobal.MainCss += '.GMKeyfield {background-image:url(keyfield.png); background-size: 7px; display:inline-block; vertical-align:middle; background-repeat: no-repeat; background-position:center 1px; padding: 0 2px 0 4px; line-height: 9px;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* GMKeyfield : hack OP*/';
ibsGlobal.MainCss += ' @media all and (-webkit-min-device-pixel-ratio:10000), not all and (-webkit-min-device-pixel-ratio:0) ';
ibsGlobal.MainCss += ' { .GMKeyfield{  background-position: center 3px;padding: 0 2px 0 4px; line-height: 9px; }}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* CheckBox Header Image */';
ibsGlobal.MainCss += '.GMCheckHeader0 {background-image:url(view_check.png); background-size: 14px; display:inline-block; vertical-align:middle; background-repeat:no-repeat; padding:2px 7px 0 6px;  background-position:center center; /*margin:0 2px 0 7px;*/}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* GMCheckHeader0 : hack CR,SF*/';
ibsGlobal.MainCss += '@media screen and (-webkit-min-device-pixel-ratio:0) ';
ibsGlobal.MainCss += '{.GMCheckHeader0{background-size: 14px; padding: 2px 6px 0 6px; }}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* GMCheckHeader0 : hack FF*/';
ibsGlobal.MainCss += '.GMCheckHeader0, x:-moz-any-link, x:default { background-size: 14px; padding: 2px 6px 0 6px; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* GMCheckHeader0 : hack OP*/';
ibsGlobal.MainCss += ' @media all and (-webkit-min-device-pixel-ratio:10000), not all and (-webkit-min-device-pixel-ratio:0) ';
ibsGlobal.MainCss += ' { .GMCheckHeader0{background-size: 14px; padding:1px  17px 0 0; }}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMCheckHeader1 {background-image:url(view_check_on.png); background-size: 14px; display:inline-block; vertical-align:middle; background-repeat:no-repeat; padding:2px 6px 0 6px; margin:0 0 0 0; background-position:center center;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* GMCheckHeader1 : hack CR,SF*/';
ibsGlobal.MainCss += '@media screen and (-webkit-min-device-pixel-ratio:0) ';
ibsGlobal.MainCss += '{.GMCheckHeader1{background-size: 14px; padding: 2px 6px 0 6px; }}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* GMCheckHeader1 : hack FF*/';
ibsGlobal.MainCss += '.GMCheckHeader1, x:-moz-any-link, x:default { background-size: 14px; padding: 2px 6px 0 6px; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* GMCheckHeader1 : hack OP*/';
ibsGlobal.MainCss += ' @media all and (-webkit-min-device-pixel-ratio:10000), not all and (-webkit-min-device-pixel-ratio:0) ';
ibsGlobal.MainCss += ' { .GMCheckHeader1 { background-size: 14px; padding:1px  17px 0 0;  }}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Sort images */';
ibsGlobal.MainCss += '.GMSort {position:absolute; right:2px;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMSort1 { background: url(sort2.png) no-repeat right center; background-size: 8px; width:10px; }';
ibsGlobal.MainCss += '.GMSort2 { background: url(sort2.png) no-repeat right center; background-size: 8px; width:10px; }';
ibsGlobal.MainCss += '.GMSort3 { background: url(sort3.png) no-repeat right center; background-size: 8px; width:10px; }';
ibsGlobal.MainCss += '.GMSort4 { background: url(sort4.png) no-repeat right center; background-size: 8px; width:10px; }';
ibsGlobal.MainCss += '.GMSort5 { background: url(sort5.png) no-repeat right center; background-size: 8px; width:10px; }';
ibsGlobal.MainCss += '.GMSort6 { background: url(sort6.png) no-repeat right center; background-size: 8px; width:10px; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* State classes */';
ibsGlobal.MainCss += '/* The colors must be set by numbers not by names */';
ibsGlobal.MainCss += '.GMColorDefault  { background-color:#FFFFFF;}';
ibsGlobal.MainCss += '.GMColorNoFocus  { background-color:#E8F4FF;}';
ibsGlobal.MainCss += '.GMColorReadOnly { background-color:#E5E7ED;}';
ibsGlobal.MainCss += '.GMColorPreview  { background-color:#FFFFFF;}';
ibsGlobal.MainCss += '.GMColorAlternate{ background-color:#fdfdfd;}';
ibsGlobal.MainCss += '.GMColorSelected { background-color:/*#FFFF80*/#aadbff; color:#4C84FF; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMColorFilter {background-color:#FFFFFF;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/*//.GMClassSelected { }*/';
ibsGlobal.MainCss += '.GMColorError   { background-color:#FF6969; }';
ibsGlobal.MainCss += '.GMColorDeleted { background-color:#FFCDCD; }';
ibsGlobal.MainCss += '.GMClassDeleted { font-style:italic; }';
ibsGlobal.MainCss += '.GMColorAdded   { background-color:#CDFFCD; }';
ibsGlobal.MainCss += '.GMClassAdded   { font-weight:bold; }';
ibsGlobal.MainCss += '.GMColorMoved1  { background-color:#FFFFFF; }';
ibsGlobal.MainCss += '.GMColorMoved2  { background-color:#D7EBEB; }';
ibsGlobal.MainCss += '.GMColorChanged { background-color:#EBEBFF; }';
ibsGlobal.MainCss += '.GMColorChangedCell { background-color:#E1E1FF; }';
ibsGlobal.MainCss += '.GMClassChangedCell { font-weight:bold; }';
ibsGlobal.MainCss += '.GMColorMaxChildren { background-color:#FFFFF0; }';
ibsGlobal.MainCss += '.GMColorDetail { background-color:#FFF0FF; }';
ibsGlobal.MainCss += '.GMColorDetailSelected { background-color:#FFF0E0; color:#4C84FF; }';
ibsGlobal.MainCss += '.GMColorDragged{ background-color:#E0E0C0; }';
ibsGlobal.MainCss += '.GMColorFound1 { background-color:#FF87FF; }';
ibsGlobal.MainCss += '.GMColorFound2 { background-color:#FFC387; }';
ibsGlobal.MainCss += '.GMColorFound3 { background-color:#87FF87; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMColorHovered             { background-color:#f4edfe; }';
ibsGlobal.MainCss += '.GMColorHoveredCell         { background-color:#d7c6ee; }';
ibsGlobal.MainCss += '.GMColorHoveredCellReadOnly { background-color:#E5E7ED; }';
ibsGlobal.MainCss += '.GMColorHoveredCellSpace    { background-color:#FFFFFF; }';
ibsGlobal.MainCss += '.GMColorHoveredCellSpaceEdit{ background-color:#C0C0FF; }';
ibsGlobal.MainCss += '.GMColorHoveredCellSpaceBool{ background-color:#FFFFFF; }';
ibsGlobal.MainCss += '.GMColorHoveredCellButton   { background-color:#d0dde7; }';
ibsGlobal.MainCss += '.GMColorHoveredCellButton1  { background-color:#add4f5; }';
ibsGlobal.MainCss += ''; // Cell 포커스 컬러 문지환
ibsGlobal.MainCss += '.GMColorFocused             { background-color:#E4EDFF; color:#4C84FF; }';
ibsGlobal.MainCss += '.GMColorFocusedCell         { background-color:#e5e7ed; color:#222; }';
ibsGlobal.MainCss += '.GMColorFocusedCellSpace    { background-color:#E6E6E6;  color:#4C84FF; }';
ibsGlobal.MainCss += '.GMColorFocusedCellButton   { background-color:#BCD;  color:#4C84FF; }';
ibsGlobal.MainCss += '.GMColorFocusedCellHeader   { background-color:#FFFFFE;  color:#4C84FF; }';
ibsGlobal.MainCss += '.GMColorFocusedCellPanel    { background-color:#FFFFFE;  color:#4C84FF; }';
ibsGlobal.MainCss += '.GMColorEditedCell          { background-color:#FFFFFF; }';
ibsGlobal.MainCss += '.GMColorViewedCell          { background-color:#FFFFFF; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Hover, focus, edit cursors */'; //Row 포커스 컬러 문지환
ibsGlobal.MainCss += '.GMHoverRowBackground   { /*opacity:0.5; filter:alpha(opacity=50);*/ background:#E4EDFF; } /* 일반모드에서의 Hover Row의 Background*/';
ibsGlobal.MainCss += '.GMHoverRowBorder       { z-index:0; border-top:1px solid blue; border-bottom:1px solid #CBCED9; } /* 일반모드에서의 Hover Row의 Border*/';
ibsGlobal.MainCss += '.GMHoverCellBorder            { z-index:0; /*border:1px solid blue;*/ cursor:default; } /* 일반모드에서의 Hover Cell의 Border*/';
ibsGlobal.MainCss += '.GMFocusRowBackground   { opacity:0.15; filter:alpha(opacity=15); background:/*IBSB*/#e5e7ed;} /* <-- Sheet : Selected Row Background */';
ibsGlobal.MainCss += '.GMFocusRowBorder       { z-index:0; /*border:1px solid /*IBSB*/#CBCED9; color:#4C84FF;*/ } /* <-- Sheet : Selected Row Border */';
ibsGlobal.MainCss += '.GMFocusCellBorder      { z-index:0; border:0;} /* <-- Sheet : Selected Cell Border */';
ibsGlobal.MainCss += '.GMFocusCellSpaceBorder,.GMEditCellSpaceBorder { z-index:4; }';
ibsGlobal.MainCss += '.GMEditCellBorder       { z-index:0; border:1px solid #4C84FF; outline: 0;}    /*<-- Sheet : CellEdit Border */';
ibsGlobal.MainCss += '.GMEditCellInput        { position:relative; overflow:hidden; z-index:2; } ';
ibsGlobal.MainCss += '/* IH */';
ibsGlobal.MainCss += '.GMCursorBackground, .GMCursorBorderLeft ,.GMCursorBorderRight,.GMCursorBorderTop,.GMCursorBorderBottom ';
ibsGlobal.MainCss += ' {position:relative;overflow:hidden;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMCursorBackground  {border:none; padding:0;}';
ibsGlobal.MainCss += '.GMCursorBorderLeft  {padding-right:0; padding-top:0; padding-bottom:0; border-right:none; border-top:none; border-bottom:none;  width:0; height:0; }';
ibsGlobal.MainCss += '.GMCursorBorderRight {padding-left:0; padding-top:0; padding-bottom:0; border-left:none; border-top:none; border-bottom:none;  width:0; height:0;}';
ibsGlobal.MainCss += '.GMCursorBorderTop   {padding-bottom:0; padding-left:0; padding-right:0; border-bottom:none; border-left:none; border-right:none;  width:0; height:0;}';
ibsGlobal.MainCss += '.GMCursorBorderBottom{padding-top:0; padding-left:0; padding-right:0; border-top:none; border-left:none; border-right:none; width:0; height:0;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Cell edges */';
ibsGlobal.MainCss += '.GMNoLeft { border-left:0; }';
ibsGlobal.MainCss += '.GMNoRight { border-right:0; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Dragging */';
ibsGlobal.MainCss += '.GMMouseObject { opacity:0.5; filter:alpha(opacity=50); z-index:300; overflow:hidden;}';
ibsGlobal.MainCss += '.GMDragObject {z-index:300; margin-left:10px; margin-top:10px; padding-left:3px; padding-right:3px;background:#E4E5F0 ; border:1px solid #777;}';
ibsGlobal.MainCss += '.GMDragColInsideTop,.GMDragColInsideBottom,.GMDragColOutsideTop,.GMDragColOutsideBottom{position:absolute;width:10px; height:11px; overflow:hidden; z-index:258;}';
ibsGlobal.MainCss += '.GMDragColInsideTop     {background:url(in_top.gif) no-repeat;}     ';
ibsGlobal.MainCss += '.GMDragColInsideBottom  {background:url(in_bottom.gif) no-repeat;}  ';
ibsGlobal.MainCss += '.GMDragColOutsideTop    {background:url(out_top.gif) no-repeat;}    ';
ibsGlobal.MainCss += '.GMDragColOutsideBottom {background:url(out_bottom.gif) no-repeat;}  ';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Messages */';
ibsGlobal.MainCss += '.GMDisabled{position:absolute; z-index:264; background:#ffffff; opacity:0.5; filter:alpha(opacity=50); } ';
ibsGlobal.MainCss += '.GMProcess {position: absolute; left:0; top:0; background:#E2F0FF; border:1px solid #777; white-space:nowrap; text-align:center; visibility:hidden; z-index:266;}';
ibsGlobal.MainCss += '.GMMessage {background:#E2F0FF; border:1px solid #000000; padding:10px; white-space:nowrap; text-align:center;';
ibsGlobal.MainCss += '             position: absolute; left:0; top:0; visibility:hidden; z-index:266;}';
ibsGlobal.MainCss += '.GMMessageShadow ';
ibsGlobal.MainCss += '{display:none; position:absolute; margin-left:3px; margin-top:3px; z-index:265;background:#888; opacity:0.5; filter:alpha(opacity=50); left:0; top:0; visibility:hidden;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Other */';
ibsGlobal.MainCss += '/* !!! No .GM style prefix here !!! */';
ibsGlobal.MainCss += '.GridTmpTag { position:absolute; left:5px; top:5px; visibility:hidden; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Popup menus */';
ibsGlobal.MainCss += '.GMMenuMain  {position:absolute;left:0;top:0; z-index:258;}';
ibsGlobal.MainCss += '.GMMenuOuter {overflow:hidden; background:#f5f6fa; margin:2px; margin-left:-2px; margin-top:1px; border:1px solid #92999E;}';
ibsGlobal.MainCss += '.GMMenuHeader{overflow:hidden; position:absolute; z-index:0;border:0px solid #b0b0c0; background:#fff; cursor:pointer; _cursor:hand;}';
ibsGlobal.MainCss += '.GMMenuHead {color:#15498B; cursor:pointer; text-align:left; font-weight:bold; padding-top:5px; padding-bottom:4px;';
ibsGlobal.MainCss += '    background: #fdfdfd; /* Old browsers */';
ibsGlobal.MainCss += '    background: -moz-linear-gradient(top,  #fdfdfd 0%, #99bce8 100%); /* FF3.6+ */';
ibsGlobal.MainCss += '    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#fdfdfd), color-stop(100%,#99bce8)); /* Chrome,Safari4+ */';
ibsGlobal.MainCss += '    background: -webkit-linear-gradient(top,  #fdfdfd 0%,#99bce8 100%); /* Chrome10+,Safari5.1+ */';
ibsGlobal.MainCss += '    background: -o-linear-gradient(top,  #fdfdfd 0%,#99bce8 100%); /* Opera 11.10+ */';
ibsGlobal.MainCss += '    background: -ms-linear-gradient(top,  #fdfdfd 0%,#99bce8 100%); /* IE10+ */';
ibsGlobal.MainCss += '    background: linear-gradient(top,  #fdfdfd 0%,#99bce8 100%); /* W3C */';
ibsGlobal.MainCss += '    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr="#fdfdfd", endColorstr="#99bce8",GradientType=0 ); /* IE6-9 */';
ibsGlobal.MainCss += '}';
ibsGlobal.MainCss += '.GMMenuClose {float:right!important; width:14px; cursor:pointer; _cursor:hand; display:none;}';
ibsGlobal.MainCss += '.GMMenuBody {cursor:default; }';
ibsGlobal.MainCss += '.GMMenuShadow {position:absolute;margin:3px 0 0 3px;z-index:0;display:none; background-color:#888; opacity:0.5; filter:alpha(opacity=50);}';
ibsGlobal.MainCss += '.GMMenuCheckedIconRight {padding-right:17px; background:url(view_check_on.png) no-repeat 96% center; background-size: 16px;}';
ibsGlobal.MainCss += '.GMMenuUncheckedIconRight { padding-right:17px;background:url(view_check.png) no-repeat 96% center ; background-size: 16px;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMMenuCursorIcon {background-image:url(d_gray_right.gif); background-repeat:no-repeat; background-position: 3px center;_background-color:#fff}';
ibsGlobal.MainCss += '.GMMenuHoverIcon {background-image:url(d-right.png); background-repeat:no-repeat; background-size: 5px; background-position: 3px center; _background-color:#ffeeaa }   ';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMMenuNextIcon { padding-right:10px; }';
ibsGlobal.MainCss += '.GMMenuNextIconRtl { padding-left:10px; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMMenuItemText,.GMMenuItemIcon,.GMMenuEnum,.GMMenuEnumHeader,.GMMenuEdit,.GMFilterMenuItemText ';
ibsGlobal.MainCss += '{white-space:nowrap; overflow:hidden; vertical-align: middle; padding:2px 0 2px 0; font-size:/*IBFS*/12px; font-family:"NotoKrR","돋움",Dotum,AppleGothic,sans-serif;}';
ibsGlobal.MainCss += '.GMMenuItemDisabled {opacity:0.50; filter:alpha(opacity=30); overflow:hidden; }';
ibsGlobal.MainCss += '.GMMenuLevel {color:blue;text-align:center; }  ';
ibsGlobal.MainCss += '.GMMenuEnumParent,.GMMenuEditParent {padding-left:5px; padding-right:2px}';
ibsGlobal.MainCss += '.GMMenuItemIcon {background-repeat:no-repeat;}';
ibsGlobal.MainCss += '.GMMenuEnum {border:1px solid #DDD; border-top:1px solid #666; border-left:1px solid #666; padding-left:15px; overflow:hidden;}';
ibsGlobal.MainCss += '.GMMenuEnumHeader  {padding:1px 0 2px 16px; cursor:default; } ';
ibsGlobal.MainCss += '.GMMenuEdit{border:1px solid #DDD; border-top:1px solid #666; border-left:1px solid #666; background:white; overflow:hidden;white-space:nowrap;';
ibsGlobal.MainCss += '  padding-left:2px; padding-right:2px;}';
ibsGlobal.MainCss += '.GMMenuEditInput,.GMMenuEditTextarea {margin:0;padding:0;border:0; background:#FDD;_margin:-1px; _padding-right:1px; _padding_left:1px; }   ';
ibsGlobal.MainCss += '.GMMenuEditTextarea { line-height:13px;  }   ';
ibsGlobal.MainCss += '.GMMenuEditInt,.GMMenuEditFloat,.GMMenuEditDate { text-align:right; } ';
ibsGlobal.MainCss += '.GMMenuEditMulti { white-space:normal; }';
ibsGlobal.MainCss += '.GMMenuItem {background-color:#ffffff;padding:2px;}  ';
ibsGlobal.MainCss += '.GMMenuItemHover {background-color:#ffeeaa; border:1px solid #aaaadd;margin:0 1px; padding:1px 0;}';
ibsGlobal.MainCss += '.GMMenuFocusHover {margin:1px; background-color:#CAE1F3; border:1px solid #000000;}';
ibsGlobal.MainCss += '.GMMenuFocus      {margin:1px; background-color:#CAE1F3; border:1px solid #aaaadd;}';
ibsGlobal.MainCss += '.GMMenuSeparator {margin:1px 3px 0 3px; height:1px; border-top:1px solid #aaaadd; overflow:hidden;}';
ibsGlobal.MainCss += '.GMMenuCaption {padding:2px; background:#ffffff; color:blue; text-align:center;}';
ibsGlobal.MainCss += '.GMMenuVSeparator { border-right:1px solid #DDD; }';
ibsGlobal.MainCss += '.GMMenuFoot { border-top:none; text-align:center; white-space:nowrap; }';
ibsGlobal.MainCss += '.GMMenuButton {font-size:11px;background:#4C84FF; text-align:center; border:1px solid #4C84FF;border-radius:10px;margin:5px 2px 4px 2px;padding:0;white-space:nowrap;width:48px;color:#fff;} ';
ibsGlobal.MainCss += '.GMMenuButtonHover { background:#1650b9; border:1px solid #1650b9; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMEnumMenuItem {background-color:#ffffff;padding:2px;padding-top:0px;padding-bottom:0px;}  ';
ibsGlobal.MainCss += '.GMEnumMenuFocus      {margin:1px; background-color:#4C84FF; border:1px solid #4C84FF; color:#ffffff;}';
ibsGlobal.MainCss += '.GMEnumMenuFocusHover {margin:1px; background-color:#4C84FF; border:1px solid #4C84FF; color:#ffffff;}';
ibsGlobal.MainCss += '.GMEnumMenuItemHover {background-color:#4C84FF; border:0px solid #aaaadd;margin:0 1px; padding:1px;padding-top:0px;padding-bottom:0px; color:#fff;}';
ibsGlobal.MainCss += '.GMEnumMenuColBorderColor {border-color:#e0e0ff; font-size:/*IBFS*/12px; font-family:"NotoKrR","돋움",Dotum,AppleGothic,sans-serif;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMSuggestMenuItem {background-color:#ffffff;padding:2px;padding-top:0px;padding-bottom:0px;}  ';
ibsGlobal.MainCss += '.GMSuggestMenuFocus       {margin:1px; background-color:#CAE1F3; border:1px solid #aaaadd;}';
ibsGlobal.MainCss += '.GMSuggestMenuFocusHover {margin:1px; background-color:#CAE1F3; border:1px solid #000000;}';
ibsGlobal.MainCss += '.GMSuggestMenuItemHover {background-color:#ffeeaa; border:0px solid #aaaadd;margin:0 1px; padding:1px;padding-top:0px;padding-bottom:0px;}';
ibsGlobal.MainCss += '.GMSuggestMenuColBorderColor {border-color:#e0e0ff;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Grid configuration menus */';
ibsGlobal.MainCss += '.GMCfgMenuOuter,.GMColumnsMenuOuter { border:1px solid #000000; }';
ibsGlobal.MainCss += '.GMCfgMenuHead,.GMColumnsMenuHead { padding-left:3px; }';
ibsGlobal.MainCss += '.GMCfgMenuBody,.GMColumnsMenuBody { padding-left:4px; padding-right:4px;}';
ibsGlobal.MainCss += '.GMCfgMenuFoot,.GMColumnsMenuFoot { padding-right:3px; padding-left:3px;}';
ibsGlobal.MainCss += '.GMCfgMenuButton { width:70px; } ';
ibsGlobal.MainCss += '.GMCfgMenuItemText,.GMColumnsMenuItemText { padding-left:3px; }';
ibsGlobal.MainCss += '.GMColumnsMenuItemText { white-space:nowrap; }';
ibsGlobal.MainCss += '.GMCfgMenuItem,.GMColumnsMenuItem { padding-top:3px; padding-bottom:3px;}';
ibsGlobal.MainCss += '.GMCfgMenuItemHover,.GMCfgMenuFocus,.GMCfgMenuFocusHover,';
ibsGlobal.MainCss += '.GMColumnsMenuItemHover,.GMColumnsMenuFocus,.GMColumnsMenuFocusHover { padding-top:2px; padding-bottom:2px;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Popup grid dialog */';
ibsGlobal.MainCss += '.GMPopupGridOuter { border:0; overflow:visible; }';
ibsGlobal.MainCss += '.GMPopupGridHead { padding:0; }';
ibsGlobal.MainCss += '.GMPopupGridBody { padding:0; }';
ibsGlobal.MainCss += '.GMPopupGridFoot { padding:0; }';
ibsGlobal.MainCss += '.GMPopupGridButton { width:50px;margin-top:-2px; margin-bottom:3px;} ';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Calendar */';
ibsGlobal.MainCss += '/* calendar small design */';
ibsGlobal.MainCss += '.GMPickMain  {position:absolute; left:0; top:0; z-index:258; font-size:/*IBFS*/12px; font-family:"NotoKrR","돋움",Dotum,AppleGothic,sans-serif;}';
ibsGlobal.MainCss += '.GMPickOuter {overflow:hidden; background:white; border:1px solid #E1E3E4; }';
ibsGlobal.MainCss += '.GMPickHeader{overflow:hidden; position:absolute; z-index:258; border:1px solid black; background:#ffffff; cursor:pointer; _cursor:hand;}';
ibsGlobal.MainCss += '.GMPickHeaderBottom{border-bottom:0; padding-bottom:1px;}';
ibsGlobal.MainCss += '.GMPickHeaderTop{border-top:0; padding-bottom:1px; }';
ibsGlobal.MainCss += '.GMPickHead {background:#5c8397; font:10px NanumGothic,Verdana,Arial; color:white; cursor:default; padding-left:5px; padding-top:1px; padding-bottom:1px;border-bottom:1px solid white;}';
ibsGlobal.MainCss += '.GMPickClose{float:right; width:14px; cursor:pointer; _cursor:hand; display:none;}';
ibsGlobal.MainCss += '.GMPickBody {cursor:default; padding:0; }';
ibsGlobal.MainCss += '.GMPickShadow{position:absolute; background:#888; z-index:257; margin:3px 0 0 3px;opacity:0.5; filter:alpha(opacity=50);} ';
ibsGlobal.MainCss += '.GMPickFooter,.GMPick2Footer{text-align:center; padding:2px; cursor:default; background:#ffffff; border-top:1px solid #ffffff}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMPickMY{background-color:#E5E7ED;border-bottom:1px solid #E5E7ED;color:#4C84FF;text-shadow:0 0 1px rgba(0,0,0,0.2); cursor:default;text-align:center;padding:7px 0 7px 0;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMPickMYDown{padding-right:13px; background:url(header_on.png) no-repeat right; cursor:pointer; _cursor:hand; background-size: 8px; font-size:12px; font-weight:600;}';
ibsGlobal.MainCss += '.GMPickMYUp {padding-right:13px; background:url(d-up.png) no-repeat right center; cursor:pointer; _cursor:hand; background-size: 10px; font-weight:600;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMPickMYRtl{padding-right:0; padding-left:13px; }';
ibsGlobal.MainCss += '.GMPickBL,.GMPickBR{padding-top:13px; cursor:pointer; _cursor:hand; width:16px; height:14px; overflow:hidden;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMPickBL {float:left !important; background:url(calendar_allow_l.png) no-repeat 50%; background-size: 7px}';
ibsGlobal.MainCss += '.GMPickBR {float:right !important; background:url(calendar_allow_r.png) no-repeat 50%; background-size: 7px}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMPickTable{width:234px !important;}';
ibsGlobal.MainCss += '.GMPickRow  {background:#ffffff;}';
ibsGlobal.MainCss += '.GMPickRowW {background:#ffffff;}';
ibsGlobal.MainCss += '.GMPickCell {width:27px; height:24px; border:1px solid #ffffff; vertical-align: middle;}';
ibsGlobal.MainCss += '.GMPickWDN {background:transparent; color:#333333;text-align:center; cursor:default; text-shadow:0 0 1px rgba(0,0,0,0.2); margin:3px 5.2px;padding:1px;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMPickHover,.GMPickSelHover,.GMPickWD,.GMPickSa,.GMPickSu,.GMPickHo,.GMPickSel,.GMPickNow,.GMPickWDNE,.GMPickSaNE,.GMPickSuNE,';
ibsGlobal.MainCss += '.GMPickSelNE,.GMPickNowNE,.GMPickOM,.GMPickOMNE {text-align:center; border:1px solid #ffffff; cursor:pointer; _cursor:hand;}';
ibsGlobal.MainCss += '.GMPickWN,.GMPickWNE {text-align:center; cursor:pointer; _cursor:hand;padding:5px 4px; background:#ffffff; white-space:nowrap;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMPickWDNE,.GMPickSaNE,.GMPickSuNE,.GMPickSelNE,.GMPickNowNE,.GMPickWNE {cursor:default;}';
ibsGlobal.MainCss += '.GMPickWD{background-color:#ffffff; font-family:"Arial"; text-shadow:0 0 1px rgba(0,0,0,0.2);}';
ibsGlobal.MainCss += '.GMPickSa{background-color:#ffffff; color:blue; font-family:"Arial"; text-shadow:0 0 1px rgba(0,0,0,0.2);}';
ibsGlobal.MainCss += '.GMPickSu{background-color:#ffffff; color:red; font-family:"Arial"; text-shadow:0 0 1px rgba(0,0,0,0.2);}';
ibsGlobal.MainCss += '.GMPickHo {background-color:#ffffff; color:orange; font-family:"Arial"; text-shadow:0 0 1px rgba(0,0,0,0.2);}';
ibsGlobal.MainCss += '.GMPickSel{background:#4C84FF; border:0; color:#fff; padding:5px 5px; font-family:"Arial"; text-shadow:0 0 1px rgba(0,0,0,0.2);';
/*ibsGlobal.MainCss += 'background: -moz-radial-gradient(center, ellipse cover, #4C84FF 0%, #4C84FF 44%, #294fe0 100%);';
ibsGlobal.MainCss += 'background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, #4C84FF), color-stop(44%, #4C84FF), color-stop(100%, #294fe0));';
ibsGlobal.MainCss += 'background: -webkit-radial-gradient(center, ellipse cover, #4C84FF 0%, #4C84FF 44%, #294fe0 100%);';
ibsGlobal.MainCss += 'background: -o-radial-gradient(center, ellipse cover, #4C84FF 0%, #4C84FF 44%, #294fe0 100%);';
ibsGlobal.MainCss += 'background: -ms-radial-gradient(center, ellipse cover, #4C84FF 0%, #4C84FF 44%, #294fe0 100%);';*/
ibsGlobal.MainCss += '}';
ibsGlobal.MainCss += '.GMPickSelNE{background-color:#fbea54; border:1px solid #dad1d1; font-family:"Arial"; text-shadow:0 0 1px rgba(0,0,0,0.2);}';

ibsGlobal.MainCss += '.GMPickNow {background:radial-gradient(ellipse at center, #ff670f 0%, #FF843D 44%, #ff670f 100%); border:0; color:#fff; padding:5px 6px; font-family:"Arial"; text-shadow:0 0 1px rgba(0,0,0,0.2);';
ibsGlobal.MainCss += 'background: -moz-radial-gradient(center, ellipse cover, #ff670f 0%, #FF843D 44%, #ff670f 100%);';
ibsGlobal.MainCss += 'background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, #ff670f), color-stop(44%, #FF843D), color-stop(100%, #ff670f));';
ibsGlobal.MainCss += 'background: -webkit-radial-gradient(center, ellipse cover, #ff670f 0%, #FF843D 44%, #ff670f 100%);';
ibsGlobal.MainCss += 'background: -o-radial-gradient(center, ellipse cover, #ff670f 0%, #FF843D 44%, #ff670f 100%);';
ibsGlobal.MainCss += 'background: -ms-radial-gradient(center, ellipse cover, #ff670f 0%, #FF843D 44%, #ff670f 100%);';
ibsGlobal.MainCss += '}';
ibsGlobal.MainCss += '.GMPickNowNE{background-color:#4C84FF; border:1px solid #4C84FF; font-family:"Arial"; text-shadow:0 0 1px rgba(0,0,0,0.2);}';
ibsGlobal.MainCss += '.GMPickHover{background:radial-gradient(ellipse at center, #585858 0%, #3b3b3b 44%, #313131 100%); color:#fff; border:0; padding:5px 5px; font-family:"Arial";';
ibsGlobal.MainCss += 'background: -moz-radial-gradient(center, ellipse cover, #585858 0%, #3b3b3b 44%, #313131 100%);';
ibsGlobal.MainCss += 'background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, #585858), color-stop(44%, #3b3b3b), color-stop(100%, #313131));';
ibsGlobal.MainCss += 'background: -webkit-radial-gradient(center, ellipse cover, #585858 0%, #3b3b3b 44%, #313131 100%);';
ibsGlobal.MainCss += 'background: -o-radial-gradient(center, ellipse cover, #585858 0%, #3b3b3b 44%, #313131 100%);';
ibsGlobal.MainCss += 'background: -ms-radial-gradient(center, ellipse cover, #585858 0%, #3b3b3b 44%, #313131 100%);';
ibsGlobal.MainCss += '}';
ibsGlobal.MainCss += '.GMPickSelHover{background-color:#eeeeaa; border:0; font-family:"Arial"; text-shadow:0 0 1px rgba(0,0,0,0.2);}';
ibsGlobal.MainCss += '.GMPickOM{background-color:white; color:#CBCED9; font-family:"Arial"; text-shadow:0 0 1px rgba(0,0,0,0.2);}';
ibsGlobal.MainCss += '.GMPickOMNE{color:#aaaaaa;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMPickEmpty{background:url(d_blank.png) no-repeat 50%; cursor:pointer; _cursor:hand;padding:3px 0; background-size: 14px}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMPickTimeCell ';
ibsGlobal.MainCss += '{text-align:right; padding-bottom:4px; padding-top:6px; padding-right:5px; border-top:1px solid #8CA9E1; background:#EFF0F1;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMPickTime ';
ibsGlobal.MainCss += '{border:0px none; white-space:nowrap; text-align:right; background:#EFF0F1;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMPickButton{background:#E5E7ED; text-align:center; border:1px solid #E5E7ED; cursor:pointer; text-shadow:0 0 1px rgba(0,0,0,0.2); width:45px; height:24px; font:inherit; margin:2px; border-radius: 4px;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMPickButtonHover{background:#989EB3; border:1px solid #989EB3; color:#fff; }';
ibsGlobal.MainCss += '.GMPick2Table{width:234px !important; vertical-align:middle}';
ibsGlobal.MainCss += '.GMPick2CellM{height:20px; width:55px; }';
ibsGlobal.MainCss += '.GMPick2CellY{height:20px; width:55px; vertical-align:middle }';
ibsGlobal.MainCss += '.GMPick2CellSep{height:20px; width:5px; }';
ibsGlobal.MainCss += '.GMPick2Cell{vertical-align:middle}';
ibsGlobal.MainCss += '.GMPick2M,.GMPick2Y,.GMPick2MSel,.GMPick2YSel,.GMPick2MHover,.GMPick2YHover,.GMPick2MSelHover,.GMPick2YSelHover';
ibsGlobal.MainCss += '{cursor:pointer; _cursor:hand; text-align:center; margin-left:1px; margin-right:1px; padding-left:4px; padding-right:4px; overflow:hidden;  border-radius:10px;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMPick2MSel,.GMPick2YSel {background-color:#4C84FF; border:1px solid #2d8cdb; border-radius:10px; margin-left:0; margin-right:0; color:#ffffff;}';
ibsGlobal.MainCss += '.GMPick2MHover,.GMPick2YHover {background:#DDD; border:1px solid #ffffff; margin-left:0; margin-right:0;}';
ibsGlobal.MainCss += '.GMPick2MSelHover,.GMPick2YSelHover {background-color:#4C84FF; border:1px solid #2d8cdb; margin-left:0; margin-right:0; color:#ffffff;}   ';
ibsGlobal.MainCss += '.GMPick2SepH {width:1px; height:1px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMPick2Sep {width:1px; background:#E3E4E6; overflow:hidden; margin-left:2px; margin-right:2px; height:20px;}';
ibsGlobal.MainCss += '.GMPick2BL,.GMPick2BR {width:54px; cursor:pointer; _cursor:hand; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMPick2BL {background:url(d_left_cal.png) no-repeat center center; background-size: 12px;}';
ibsGlobal.MainCss += '.GMPick2BR {background:url(d_right_cal.png) no-repeat center center; background-size: 12px;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Edit controls */';
ibsGlobal.MainCss += '.GMEdit,.GMEditInline {padding:2px 4px;border:1px solid #DDD; border-top:1px solid #666; border-left:1px solid #666;background:#ffffff; white-space:nowrap; overflow:hidden;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMEditInline { display:inline-block; vertical-align:bottom; }';
ibsGlobal.MainCss += '.GMEditInput,.GMEditTextarea {border:0 solid transparent !important; margin:0; padding:0; padding-right:1px !important;vertical-align: middle; font-size:/*IBFS*/12px; font-family:"NotoKrR","돋움",Dotum,AppleGothic,sans-serif;} ';
ibsGlobal.MainCss += '.GMEditDate {z-index:-500 !important;}';
ibsGlobal.MainCss += '/*IH */';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMEditTextarea { line-height:13px; }';
ibsGlobal.MainCss += '.GMEditSpaceInput { vertical-align:middle; }';
ibsGlobal.MainCss += '.GMEditNormalInput,.GMEditNormalTextarea,.GMEditSpaceTextarea { padding-left:5px; background-color:#FFFFFF; /*#FFDCFF;*/; } /* IH : Cell Textedit Padding */';
ibsGlobal.MainCss += '.GMEditInt,.GMEditFloat { text-align:right; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMEditNormalTextarea {}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMEditMulti { white-space:normal; }';
ibsGlobal.MainCss += '.GMEditReadOnly { background-color:#E5E7ED; }   '; //readonly
ibsGlobal.MainCss += '.GMEditParent { position:absolute; z-index:258; overflow:hidden; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMEnumHeaderLeft,.GMEnumHeaderRight,.GMEnumHeaderNone ';
ibsGlobal.MainCss += '{background:white; cursor:pointer; _cursor:hand; vertical-align:middle; text-align:left; padding:2px 0 2px 2px; font-size:/*IBFS*/12px; font-family:"NotoKrR","돋움",Dotum,AppleGothic,sans-serif;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMEnumHeaderRight {background: url(combo.png) no-repeat right center;margin:3px 4px 0 6px;background-size:16px;}';
ibsGlobal.MainCss += ' @media screen and (-webkit-min-device-pixel-ratio:0) {.GMEnumHeaderRight{margin:3px 4px 0 6px;}}/* hack:CR,SF */';
ibsGlobal.MainCss += '.GMEnumHeaderRight, x:-moz-any-link, x:default {margin:3px 4px 0 6px;} /* hack:FF */';
ibsGlobal.MainCss += ' @media all and (-webkit-min-device-pixel-ratio:10000), not all and (-webkit-min-device-pixel-ratio:0) {.GMEnumHeaderRight{ margin:1px 0 0 0;}}/* hack:OP */';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMEnumMenuHeader { background:#ffffff; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMEnumControl,.GMEnumInline {';
ibsGlobal.MainCss += '   cursor:pointer; _cursor:hand; padding-left:15px; padding-right:4px; padding-top:2px; padding-bottom:2px;';
ibsGlobal.MainCss += '   border:1px solid #DDD; border-top:1px solid #666; border-left:1px solid #666; overflow:hidden;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMEnumInline { display:inline-block; vertical-align:bottom; }';
ibsGlobal.MainCss += '.GMEnumHeader { cursor:pointer; _cursor:hand;padding-left:15px; padding-right:4px; padding-top:2px; padding-bottom:2px;} ';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/*  Custom scrollbars  */'; //가로 스크롤
ibsGlobal.MainCss += '.GMCustScroll1RightHidden { background:url(VScroll.png) left -108px; height:18px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll1Right { padding-right:18px; background:url(VScroll.png) right 0; }';
ibsGlobal.MainCss += '.GMCustScroll1RightHover { padding-right:18px; background:url(VScroll.png) right -18px; }';
ibsGlobal.MainCss += '.GMCustScroll1Left { padding-left:18px;  background:url(VScroll.png) left 0; }';
ibsGlobal.MainCss += '.GMCustScroll1LeftHover { padding-left:18px;  background:url(VScroll.png) left -18px; }';
ibsGlobal.MainCss += '.GMCustScroll1SliderRight { padding-right:3px; /*background:url(VScroll.png) right -36px;*/ border-radius:20px; background:#CBCED9; }';
ibsGlobal.MainCss += '.GMCustScroll1SliderLeft { padding-left:3px; /*background:url(VScroll.png) left -36px;*/ border-radius:20px;  background:#CBCED9; }';
ibsGlobal.MainCss += '.GMCustScroll1SliderHIn { height:18px; overflow:hidden; /*background:url(VScroll.png) center -54px;*/ border-radius:20px; background:#CBCED9; }';
ibsGlobal.MainCss += '.GMCustScroll1SliderRightHover { padding-right:3px; /*background:url(VScroll.png) right -72px;*/ border-radius:20px; background-color:#c2c4cc; }';
ibsGlobal.MainCss += '.GMCustScroll1SliderLeftHover { padding-left:3px; /*background:url(VScroll.png) left -72px;*/ border-radius:20px; background-color:#c2c4cc; }';
ibsGlobal.MainCss += '.GMCustScroll1SliderHInHover { height:18px; overflow:hidden; /*background:url(VScroll.png) center -90px;*/ border-radius:20px; background-color:#c2c4cc; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMCustScroll2RightHidden { background:url(VScroll.png) left -460px; height:10px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll2Right { padding-right:10px; background:url(VScroll.png) right -400px; }';
ibsGlobal.MainCss += '.GMCustScroll2RightHover { padding-right:10px; background:url(VScroll.png) right -410px; }';
ibsGlobal.MainCss += '.GMCustScroll2Left { padding-left:10px;  background:url(VScroll.png) left -400px; }';
ibsGlobal.MainCss += '.GMCustScroll2LeftHover { padding-left:10px;  background:url(VScroll.png) left -410px; }';
ibsGlobal.MainCss += '.GMCustScroll2SliderRight { padding-right:6px; background:url(VScroll.png) right -420px; }';
ibsGlobal.MainCss += '.GMCustScroll2SliderLeft { padding-left:6px; background:url(VScroll.png) left -420px; }';
ibsGlobal.MainCss += '.GMCustScroll2SliderHIn { height:10px; overflow:hidden; background:url(VScroll.png) center -430px; }';
ibsGlobal.MainCss += '.GMCustScroll2SliderRightHover { padding-right:6px; background:url(VScroll.png) right -440px; }';
ibsGlobal.MainCss += '.GMCustScroll2SliderLeftHover { padding-left:6px; background:url(VScroll.png) left -440px; }';
ibsGlobal.MainCss += '.GMCustScroll2SliderHInHover { height:10px; overflow:hidden; background:url(VScroll.png) center -450px; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMCustScroll3Right,.GMCustScroll3RightHidden { background:white; height:9px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll3SliderRight,.GMCustScroll3SliderRightHover { padding-right:3px; height:9px; background:url(VScroll.png) right -126px; }';
ibsGlobal.MainCss += '.GMCustScroll3SliderLeft,.GMCustScroll3SliderLeftHover { height:9px; background:url(VScroll.png) left -126px; }';
ibsGlobal.MainCss += '.GMCustScroll3SliderRightHover { background-position:right -135px; }';
ibsGlobal.MainCss += '.GMCustScroll3SliderLeftHover { background-position:left -135px; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMCustScroll4Right,.GMCustScroll4RightHidden,.GMCustScroll4SliderRight,.GMCustScroll4SliderRightHover { height:1px; overflow:hidden; }';
ibsGlobal.MainCss += ''; // 세로스크롤
ibsGlobal.MainCss += '.GMCustScroll1DownHidden { background:url(HScroll.png) -108px top; width:18px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll1Down { padding-bottom:18px; background:url(HScroll.png) 0px bottom; cursor:default; width:18px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll1DownHover { padding-bottom:18px; background:url(HScroll.png) -18px bottom; width:18px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll1Up { padding-top:18px; background:url(HScroll.png) 0px top; width:18px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll1UpHover { padding-top:18px;  background:url(HScroll.png) -18px top; width:18px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll1SliderDown { padding-bottom:3px; /*background:url(HScroll.png) -36px bottom;*/ background-color:#CBCED9; border-radius:20px; width:18px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll1SliderUp { padding-top:3px; /*background:url(HScroll.png) -36px top;*/ background-color:#CBCED9; border-radius:20px; width:18px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll1SliderVIn { /*background:url(HScroll.png) -54px center;*/ background-color:#CBCED9; width:18px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll1SliderDownHover { padding-bottom:3px; /*background:url(HScroll.png) -72px bottom;*/ background-color:#c2c4cc; border-radius:20px; width:18px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll1SliderUpHover { padding-top:3px; /*background:url(HScroll.png) -72px top;*/ background-color:#c2c4cc; border-radius:20px; width:18px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll1SliderVInHover { /*background:url(HScroll.png) -90px center;*/ background-color:#c2c4cc; width:18px; overflow:hidden; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMCustScroll2DownHidden { background:url(HScroll.png) -460px top; width:10px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll2Down { padding-bottom:10px; background:url(HScroll.png) -400px bottom; cursor:default; width:10px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll2DownHover { padding-bottom:10px; background:url(HScroll.png) -410px bottom; width:10px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll2Up { padding-top:10px; background:url(HScroll.png) -400px top; width:10px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll2UpHover { padding-top:10px;  background:url(HScroll.png) -410px top; width:10px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll2SliderDown { padding-bottom:6px; background:url(HScroll.png) -420px bottom; width:10px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll2SliderUp { padding-top:6px; background:url(HScroll.png) -420px top; width:10px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll2SliderVIn { background:url(HScroll.png) -430px center; width:10px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll2SliderDownHover { padding-bottom:6px; background:url(HScroll.png) -440px bottom; width:10px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll2SliderUpHover { padding-top:6px; background:url(HScroll.png) -440px top; width:10px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMCustScroll2SliderVInHover { background:url(HScroll.png) -450px center; width:10px; overflow:hidden; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMCustScroll3Down,.GMCustScroll3DownHidden { background:white; width:9px; overflow:hidden; cursor:default; }';
ibsGlobal.MainCss += '.GMCustScroll3SliderDown,.GMCustScroll3SliderDownHover { padding-bottom:3px; width:9px; background:url(HScroll.png) -126px bottom; }';
ibsGlobal.MainCss += '.GMCustScroll3SliderUp,.GMCustScroll3SliderUpHover { width:9px; background:url(HScroll.png) -126px top; cursor:default; }';
ibsGlobal.MainCss += '.GMCustScroll3SliderDownHover { background-position:-135px bottom; }';
ibsGlobal.MainCss += '.GMCustScroll3SliderUpHover { background-position:-135px top; cursor:default; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMCustScroll4Down,.GMCustScroll4DownHidden,.GMCustScroll4SliderDown,.GMCustScroll4SliderDownHover { width:1px; overflow:hidden; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Other messages */';
ibsGlobal.MainCss += '.GMHintMain {position:absolute; margin-left:-1px; margin-top:-1px; left:0px; top:0px; z-index:260; background:#ffffff; cursor:default; }';
ibsGlobal.MainCss += '.GMHintOuter {overflow:hidden; border:1px solid #000000; background:#ffffff !important; color:black; text-align:left; }';
ibsGlobal.MainCss += '.GMHintHeaderOuter {background-color:#39aefb !important; color:#ffffff; border: 1px solid #ffffff; }';
ibsGlobal.MainCss += '.GMHintShadow {position:absolute; z-index:259;background:#888; opacity:0.3; filter:alpha(opacity=30);margin-left:2px; margin-top:2px;}';
ibsGlobal.MainCss += '.GMTipMain {position:absolute; left:0px; top:0px; z-index:262; visibility:hidden; }';
ibsGlobal.MainCss += '.GMTipOuter  {overflow:hidden; cursor:default; font:12px Arial;padding-left:3px; padding-right:3px; background:#E4E5F0; border:1px solid #777;}';
ibsGlobal.MainCss += '.GMTipBody {background:#E4E5F0; white-space:nowrap; }';
ibsGlobal.MainCss += '.GMTipShadow {position:absolute;z-index:261;background:#888; opacity:0.3; filter:alpha(opacity=30);visibility:hidden; margin-left:3px; margin-top:3px}';
ibsGlobal.MainCss += '.GMMouseOrig { background:yellow !important; opacity:0.5; filter:alpha(opacity=50); }';
ibsGlobal.MainCss += '.GMMouseDragObject { position:absolute; z-index:260; background:#000000; opacity:0.5; filter:alpha(opacity=50); }';
ibsGlobal.MainCss += '.GMFocus { border:1px solid #AAF; border-top:1px solid #00F; border-left:1px solid #00F; background-color:#000000; } ';
ibsGlobal.MainCss += '.GridDisabled { position:absolute; z-index:256; background:white; opacity:0.5; filter:alpha(opacity=50); } ';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Do not change, marks the style loaded */';
ibsGlobal.MainCss += '.GMLoaded { border:1px solid #000000 !important;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/*sum*/';
ibsGlobal.MainCss += '.GMSumCell{background:#e9f0ff; color:#4C84FF; text-shadow:0 0 1px rgba(0,0,0,0.2);}/*//text-align: right;font-weight:bold;*/';
ibsGlobal.MainCss += '.GMSubSumCell{background: #fafbff; border-bottom:1px solid #bfd3ff; color:#4C84FF}';
ibsGlobal.MainCss += '.GMCumulateCell{background: #fafbff; border-bottom:1px solid #bfd3ff; color:#4C84FF}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* FindDialog && PivotDialog */';
ibsGlobal.MainCss += '.GMH1Pop,.GMPPop{margin:0; padding:0}';
ibsGlobal.MainCss += '.GMPaddingl10{padding-left:10px}';
ibsGlobal.MainCss += '.GMPaddingT10{padding-top:10px}';
ibsGlobal.MainCss += '.GMPPop{ padding:0 0 10px 0; text-align:center }';
ibsGlobal.MainCss += '.GMPop{overflow:hidden; border:2px solid #4c84ff; padding:0; font-size:12px;background:#EBF2F5; font-family:dotum, Arial, Helvetica, sans-serif}';
ibsGlobal.MainCss += '.GMPopTitle{width:100%; border-bottom:1px solid #4C84FF; font-size:12px; font-weight:bold; display:block; line-height:28px; color:#ffffff; font-weight:500;';
ibsGlobal.MainCss += 'background: #4C84FF; /* Old browsers */';
//ibsGlobal.MainCss += 'background: -moz-linear-gradient(top,  #c9e1f5 0%, #99bce8 100%); /* FF3.6+ */';
//ibsGlobal.MainCss += 'background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#c9e1f5), color-stop(100%,#99bce8)); /* Chrome,Safari4+ */';
//ibsGlobal.MainCss += 'background: -webkit-linear-gradient(top,  #c9e1f5 0%,#99bce8 100%); /* Chrome10+,Safari5.1+ */';
//ibsGlobal.MainCss += 'background: -o-linear-gradient(top,  #c9e1f5 0%,#99bce8 100%); /* Opera 11.10+ */';
//ibsGlobal.MainCss += 'background: -ms-linear-gradient(top,  #c9e1f5 0%,#99bce8 100%); /* IE10+ */';
//ibsGlobal.MainCss += 'background: linear-gradient(top,  #c9e1f5 0%,#99bce8 100%); /* W3C */';
//ibsGlobal.MainCss += 'filter: progid:DXImageTransform.Microsoft.gradient( startColorstr="#c9e1f5", endColorstr="#99bce8",GradientType=0 ); /* IE6-9 */';
ibsGlobal.MainCss += '}';
ibsGlobal.MainCss += '.GMPopSearch{margin:5px; overflow:hidden; }';
ibsGlobal.MainCss += '.GMPopContent{border:1px solid #D0DBE8; background-color:#fff}';
ibsGlobal.MainCss += '.GMPopUl,.GMPopUl2{list-style:none; margin:0; padding:10px;}';
ibsGlobal.MainCss += '.GMPopDiv{overflow:hidden; width:100%}';
ibsGlobal.MainCss += '.GMPopDiv2{overflow:hidden; width:100%}';
ibsGlobal.MainCss += '.GMPopLeft,.GMPopLeft2, .GMPopLeft3 {width:220px; float:left !important; }';
ibsGlobal.MainCss += '.GMPopRight,.GMPopRight2,.GMPopRight3 {width:200px; float:right !important; }';
ibsGlobal.MainCss += '.GMPopUl input {margin:-2px 2px 0px 0px;padding:0 ; width:13px; height:13px; vertical-align:middle;}';
ibsGlobal.MainCss += '.GMPopUl li{ padding-top:4px; padding-bottom:3px; padding-left:5px}';
ibsGlobal.MainCss += '.GMPopUl2 li{ padding-top:4px; padding-bottom:3px;}';
ibsGlobal.MainCss += '.GMBtnArea {margin-top:10px; text-align:center }';
ibsGlobal.MainCss += '.GMPopLeft, .GMPopRight{ }';
ibsGlobal.MainCss += '.GMPopLeft2, .GMPopRight2{ }';
ibsGlobal.MainCss += '.GMPopLabel{line-height:12px; margin:0 0 0 2px}';
ibsGlobal.MainCss += '.GMPopSubtitle{font-weight:bold; color:#000; border-bottom:1px solid  #E0E0E0; background-color:#E7E7E7;padding-left:4px;}';
ibsGlobal.MainCss += '.GMPopBtn {text-align: center;text-decoration: none;color:#fff;position: relative;border:1px solid #316290;';
ibsGlobal.MainCss += '          font-size:12px; width:50px !important; height:22px !important; cursor:pointer;}';
ibsGlobal.MainCss += '.GMPopBtn2 {text-align: center;text-decoration: none;color:#fff;position: relative;border:1px solid #316290;';
ibsGlobal.MainCss += '          font-size:12px; height:22px !important; cursor:pointer;}';
ibsGlobal.MainCss += '.GMPopBtn, .GMPopBtn:hover {color:#fff;}';
ibsGlobal.MainCss += '.GMPopBtnBlue {';
ibsGlobal.MainCss += '    background: #5689b9; /* Old browsers */';
ibsGlobal.MainCss += '    background: -moz-linear-gradient(top,  #5689b9 0%, #3a6ea0 100%); /* FF3.6+ */';
ibsGlobal.MainCss += '    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#5689b9), color-stop(100%,#3a6ea0)); /* Chrome,Safari4+ */';
ibsGlobal.MainCss += '    background: -webkit-linear-gradient(top,  #5689b9 0%,#3a6ea0 100%); /* Chrome10+,Safari5.1+ */';
ibsGlobal.MainCss += '    background: -o-linear-gradient(top,  #5689b9 0%,#3a6ea0 100%); /* Opera 11.10+ */';
ibsGlobal.MainCss += '    background: -ms-linear-gradient(top,  #5689b9 0%,#3a6ea0 100%); /* IE10+ */';
ibsGlobal.MainCss += '    background: linear-gradient(top,  #5689b9 0%,#3a6ea0 100%); /* W3C */';
ibsGlobal.MainCss += '    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr="#5689b9", endColorstr="#3a6ea0",GradientType=0 ); /* IE6-9 */';
ibsGlobal.MainCss += '}';
ibsGlobal.MainCss += '.GMPopBtnBlue:hover {';
ibsGlobal.MainCss += '    background: #3a6ea0; /* Old browsers */';
ibsGlobal.MainCss += '    background: -moz-linear-gradient(top,  #3a6ea0 0%, #5689b9 100%); /* FF3.6+ */';
ibsGlobal.MainCss += '    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#3a6ea0), color-stop(100%,#5689b9)); /* Chrome,Safari4+ */';
ibsGlobal.MainCss += '    background: -webkit-linear-gradient(top,  #3a6ea0 0%,#5689b9 100%); /* Chrome10+,Safari5.1+ */';
ibsGlobal.MainCss += '    background: -o-linear-gradient(top,  #3a6ea0 0%,#5689b9 100%); /* Opera 11.10+ */';
ibsGlobal.MainCss += '    background: -ms-linear-gradient(top,  #3a6ea0 0%,#5689b9 100%); /* IE10+ */';
ibsGlobal.MainCss += '    background: linear-gradient(top,  #3a6ea0 0%,#5689b9 100%); /* W3C */';
ibsGlobal.MainCss += '    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr="#3a6ea0", endColorstr="#5689b9",GradientType=0 ); /* IE6-9 */';
ibsGlobal.MainCss += '}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMPopDisc {margin:0px 8px 8px 8px; background-color:#ebf2f5; border:1px solid #D0DBE8;}';
ibsGlobal.MainCss += '.GMPopDisc ul {padding:0px; margin-left:0; margin-top:10px; margin-bottom:0;}';
ibsGlobal.MainCss += '.GMPopDisc li {list-style:none; background:url(bullet.gif) no-repeat 5px 3px; margin-bottom:8px; padding-left:13px; color:#426b8c; word-break:break-all;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMPopChkArea {margin:8px; height:25px;}';
ibsGlobal.MainCss += '.GMPopChkArea ul {margin:0; padding:0; float:right!important; background-color:#ebf2f5; border:1px solid #D0DBE8;}';
ibsGlobal.MainCss += '.GMPopChkArea li {float:left!important; padding:3px 5px 0px 5px; list-style:none; color:#426b8c; font-weight:bold;}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMPopFilter {width:252px; margin:0 auto;}';
ibsGlobal.MainCss += '.GMPopHelp0, .GMPopHelp1, .GMPopClose {';
ibsGlobal.MainCss += '    cursor:pointer;';
ibsGlobal.MainCss += '    margin-top:4px;padding-right:3px;float:right!important;height:20px;';
ibsGlobal.MainCss += '    border: 0px none; background-repeat: no-repeat; padding-left: 12px; background-image: url(filter_btn.gif);';
ibsGlobal.MainCss += '}';
ibsGlobal.MainCss += '.GMPopHelp0 { background-position:0px 0px; }';
ibsGlobal.MainCss += '.GMPopHelp1 { background-position:-23px 0px; }';
ibsGlobal.MainCss += '.GMPopClose { background-position:-46px 0px; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '/* Paging Icon */';
ibsGlobal.MainCss += '.GMEditPager {margin:0; padding:0; padding-right:1px !important;vertical-align: middle; font-size:/*IBFS*/12px; font-family:"NotoKrR","돋움",Dotum,AppleGothic,sans-serif;} ';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMToolPagerFirst, .GMToolPagerFirst1, .GMToolPagerPrev, .GMToolPagerPrev1, .GMToolPagerNext, .GMToolPagerNext1, .GMToolPagerLast, .GMToolPagerLast1 {';
ibsGlobal.MainCss += '      border: 0px none; background-repeat: no-repeat; padding-left: 16px; padding-right: 3px; background-image: url(pager.png); background-size: 350px;';
ibsGlobal.MainCss += '}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMToolPagerFirst1 { background-position:0px 0px; }';
ibsGlobal.MainCss += '.GMToolPagerFirst { background-position:-30px 0px; }';
ibsGlobal.MainCss += '.GMToolPagerPrev1 { background-position:-120px 0px; }';
ibsGlobal.MainCss += '.GMToolPagerPrev { background-position:-150px 0px; }';
ibsGlobal.MainCss += '.GMToolPagerNext1 { background-position:-180px 0px; }';
ibsGlobal.MainCss += '.GMToolPagerNext { background-position:-210px 0px; }';
ibsGlobal.MainCss += '.GMToolPagerLast1 { background-position:-300px 0px; }';
ibsGlobal.MainCss += '.GMToolPagerLast { background-position:-330px 0px; }';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMToolExpand1, .GMToolCollapse1 {';
ibsGlobal.MainCss += '      border: 0px none; background-repeat: no-repeat; padding-left: 16px; padding-right: 3px; background-image: url(group.png);';
ibsGlobal.MainCss += '}';
ibsGlobal.MainCss += '';
ibsGlobal.MainCss += '.GMToolExpand1 { background-position:2px 2px; background-size: 42px }';
ibsGlobal.MainCss += '.GMToolCollapse1 { background-position:-21px 2px; background-size: 42px }';
ibsGlobal.MainCss += '.GMFocusedSheet{'; //시트전체 포커스 문지환
ibsGlobal.MainCss += '    z-index:0; /*border:1px solid #d7d7d7 !important;*/ outline: 0;';
ibsGlobal.MainCss += '    -webkit-box-shadow: inset 0 0px 0px #d7d7d7, 0 0 0px #d7d7d7;';
ibsGlobal.MainCss += '    -moz-box-shadow: inset 0 0px 0px #d7d7d7, 0 0 0px #d7d7d7;';
ibsGlobal.MainCss += '    box-shadow: 0 0 0px #d7d7d7;';
ibsGlobal.MainCss += '}';