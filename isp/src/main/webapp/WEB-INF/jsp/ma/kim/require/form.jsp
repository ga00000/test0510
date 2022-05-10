<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="requireVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="reSeq" id="reSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="reAtchFileId" id="reAtchFileId"/>
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
							<input type="text" name="reTitle" id="reTitle" class="text w100p"   maxlength="30" value="${requireVO.reTitle}" />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">진행상황</strong></th>
						<td colspan="3">
							<select id="reSelect" name="reSelect">
								<option value="submit"  ${requireVO.reSelect eq "submit" ? "selected" : "" }> 신청 </option>
								<option value="agree"  ${requireVO.reSelect eq "agree" ? "selected" : "" }> 승인 </option>
								<option value="deny"  ${requireVO.reSelect eq "deny" ? "selected" : "" }> 반려 </option>
								<option value="reSubmit"  ${requireVO.reSelect eq "reSubmit" ? "selected" : "" }> 재신청 </option>
							</select>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong >비밀글여부</strong></th>
							<td colspan="3">
								비밀글<input type = "radio" name="reSecretYn" id="reSecret_Y" value="Y" ${requireVO.reSecretYn eq 'Y' ? 'checked' : ''} ${empty requireVO.reSecretYn ? 'checked' : ''}> 
								일반글<input type = "radio" name="reSecretYn" id="reSecret_N" value="N" ${requireVO.reSecretYn eq 'N' ? 'checked' : ''} > 
							</td> 
					</tr>
					
					
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="reCont" id="reCont" class="txt_area w_100p" >${util:unEscape(requireVO.reCont)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="reAtchFileIdFrame" id="reAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${requireVO.reAtchFileId }&fileCnt=5&atchFileIdNm=reAtchFileId&updateType=upload" style="width: 100%;"  frameborder="0" reTitle="파일 업로드 폼"></iframe>
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
	if($("#reTitle").val() == "" || $("#reTitle").val() == null) {
		fncMsg("reTitle", "제목을")
		count++;
	}
	oEditors.getById["reCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
	if($("#reCont").val()=='<p>&nbsp;</p>') {
		alert("내용을 입력해주세요");
		oEditors.getById["reCont"].exec("FOCUS"); /* 에디터 */
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
	    elPlaceHolder: "reCont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	}); 
	
});
</script>