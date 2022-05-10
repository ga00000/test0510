<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="freeVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="feSeq" id="feSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="feAtchFileId" id="feAtchFileId"/>
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
							<input type="text" name="feTitle" id="feTitle" class="text w100p"   maxlength="30" value="${freeVO.feTitle}" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="feCont" id="feCont" class="txt_area w_100p" >${util:unEscape(freeVO.feCont)}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="feAtchFileIdFrame" id="feAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${freeVO.feAtchFileId }&fileCnt=5&atchFileIdNm=feAtchFileId&updateType=upload" style="width: 100%;"  frameborder="0" feTitle="파일 업로드 폼"></iframe>
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
	var msgHtml = '<strong><font color="red">'+msg+' 입력하세요 </strong>'
	$("#"+id).parent().children('strong').remove();
	$("#"+id).parent().append(msgHtml);
	
	if($("#"+id).val()!=null && $("#"+id).val !=''){
		$("#"+id).on("change paste keyup", function(){
			$("#"+id).parent().children('strong').remove();
		})
	}
}

// 등록버튼 
function btnSubmit(){
	var count = 0; 
	if($("#feTitle").val() == "" || $("#feTitle").val() == null) {
		fncMsg("feTitle", "제목을")
		count++;
	}
	oEditors.getById["feCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
	if($("#feCont").val()=='<p>&nbsp;</p>') {
		alert("내용을 입력해주세요");
		oEditors.getById["feCont"].exec("FOCUS"); /* 에디터 */
		count++;
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
	    elPlaceHolder: "feCont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	}); 
	
});
</script>