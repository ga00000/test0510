<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="noticeVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="ntSeq" id="ntSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="ntAtchFileId" id="ntAtchFileId"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		
		<div class="tbl_wrap">
			<table class="tbl_row_type01"> 
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:20%;">
					<col style="width:30%;">
					<col style="width:20%;">
					<col style="width:30%;">
				</colgroup> 
				<tbody>
					<tr>
						<th scope="row"><strong class="th_tit">제목</strong></th>
						<td colspan="3">
							<input type="text" name="ntTitle" id="ntTitle" class="text w100p"   maxlength="30" value="${noticeVO.ntTitle}" />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong >공지글여부</strong></th>
							<td colspan="3">
								공지글<input type = "radio" name="ntNoticeYn" id="ntNotice_Y" value="Y" ${noticeVO.ntNoticeYn eq 'Y' ? 'checked' : ''} ${empty noticeVO.ntNoticeYn ? 'checked' : ''}> 
								일반글<input type = "radio" name="ntNoticeYn" id="ntNotice_N" value="N" ${noticeVO.ntNoticeYn eq 'N' ? 'checked' : ''} > 
							</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong >공지시작일</strong></th>
							<td >
								<input type = "date" name="ntStart" id="ntStart" value="${noticeVO.ntStart}"> 
							</td> 
						<th scope="row"><strong >공지종료일</strong></th>
							<td >
								<input type = "date" name="ntEnd" id="ntEnd" value="${noticeVO.ntEnd}"> 
							</td>	
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="ntCont" id="ntCont" class="txt_area w_100p" >${util:unEscape(noticeVO.ntCont)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="ntAtchFileIdFrame" id="ntAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${noticeVO.ntAtchFileId }&fileCnt=5&atchFileIdNm=ntAtchFileId&updateType=upload" style="width: 100%;"  frameborder="0" ntTitle="파일 업로드 폼"></iframe>
						</td>
					</tr> 
					
				</tbody>
			</table>
		</div>
		
		<div class="btn_area">
			<a href="#" class="btn btn_mdl btn_rewrite" onclick="btnSubmit();">${searchVO.procType eq  'update' ? '수정' : '등록'}</a>
			<a href="#" class="btn btn_mdl btn_cancel" onclick="btnList();">취소</a>
		</div>
		
	</form:form>
</div>

<script type="text/javascript">
var oEditors = [];
function fncMsg(id,msg){
	var msgHtml = '<strong><font color="red">'+msg+' </strong>'
	$("#"+id).parent().children('strong').remove();
	$("#"+id).parent().append(msgHtml);
	
	if($("#"+id).val()!=null && $("#"+id).val !=''){
		$("#"+id).on("change paste keyup", function(){
			$("#"+id).parent().children('strong').remove();
		})
	}
}

// 공지글-일반글 
$("[name='ntNoticeYn']").click(function(){
	var thisVal = $(this).val();
	if(thisVal =="Y"){ // 공지글
		$("#ntStart").attr("disabled",false);
		$("#ntEnd").attr("disabled",false);
	}if(thisVal == "N"){ //일반글
		$("#ntStart").val('');
		$("#ntEnd").val('');
		$("#ntStart").attr("disabled",true);
		$("#ntEnd").attr("disabled",true);
	}
	
})


// 등록버튼 
function btnSubmit(){
	var count = 0; 
	if($("#ntTitle").val() == "" || $("#ntTitle").val() == null) {
		fncMsg("ntTitle", "제목을 입력하세요")
		count++;
	} 
	
	oEditors.getById["ntCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
	if($("#ntCont").val()=='<p>&nbsp;</p>') {
		alert("내용을 입력해주세요");
		oEditors.getById["ntCont"].exec("FOCUS"); /* 에디터 */
		count++;
	}		
	// 공지글 - 날짜 유효성 
	if($("#ntNotice_Y").prop("checked")){
		if($("#ntStart").val() == "" || $("#ntStart").val() == null) {
			fncMsg("ntStart", "공지시작일을 입력하세요")
			count++;
		} 
		if($("#ntEnd").val() == "" || $("#ntEnd").val() == null) {
			fncMsg("ntEnd", "공지종료일을 입력하세요")
			count++;
		} 
		if($("#ntStart").val() >  $("#ntEnd").val() ) {
			fncMsg("ntEnd", "공지시작일은 종료일보다 늦을 수 없습니다")
			count++;
		} 
	}
	
	if(count>0){
		count=0;
		return false; 
	}
	
	fncPageBoard('submit','${searchVO.procType}Proc.do');
	return false;
}

// 수정버튼
function btnList(){
	fncPageBoard('view','view.do');
}


$(document).ready(function(){	
	
	<%-- 에디터 --%>
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "ntCont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	}); 
	
});
</script>