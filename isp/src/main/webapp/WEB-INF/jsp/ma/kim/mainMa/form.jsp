<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<input type ="text" name="mmSeq" id="mmSeq" value="${mainMaVO.mmSeq}"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="mmAtchFileId" id="mmAtchFileId"/>
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
						<th scope="row"><strong class="th_tit">대표자</strong></th>
						<td >
							<input type="text" name="mmRepresent" id="mmRepresent" class="text w100p"   maxlength="15" value="${mainMaVO.mmRepresent}" />
						</td>
						<th scope="row"><strong class="th_tit">주소</strong></th>
						<td >
							<input type="text" name="mmAddress" id="mmAddress" class="text w100p"   maxlength="15" value="${mainMaVO.mmAddress}" />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">사업자번호</strong></th>
						<td >
							<input type="text" name="mmOpNum" id="mmOpNum" class="text w100p"   maxlength="15" value="${mainMaVO.mmOpNum}" />
						</td>
						<th scope="row"><strong >회사번호</strong></th>
						<td >
							<input type="text" name="mmNum" id="mmNum" class="text w100p"   maxlength="15" value="${mainMaVO.mmNum}" />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong >팩스번호</strong></th>
						<td >
							<input type="text" name="mmFax" id="mmFax" class="text w100p"   maxlength="15" value="${mainMaVO.mmFax}" />
						</td>
						<th scope="row"><strong >메일</strong></th>
						<td >
							<input type="text" name="mmEmail" id="mmEmail" class="text w100p"   maxlength="15" value="${mainMaVO.mmEmail}" />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="mmCont" id="mmCont" class="txt_area w_100p" >${util:unEscape(mainMaVO.mmCont)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="mmAtchFileIdFrame" id="mmAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${mainMaVO.mmAtchFileId }&fileCnt=5&atchFileIdNm=mmAtchFileId&updateType=upload" style="width: 100%;"  frameborder="0" mmTitle="파일 업로드 폼"></iframe>
						</td>
					</tr> 
					
				</tbody>
			</table>
		</div>
		
		<div class="btn_area">
			<a href="#" class="btn btn_mdl btn_rewrite" onclick="btnSubmit('${mainMaVO.mmSeq}');">${empty mainMaVO.mmSeq ? '등록' : '수정'}</a>
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
function btnSubmit(mmSeq){
	var count = 0; 
	if($("#mmRepresent").val() == "" || $("#mmRepresent").val() == null) {
		fncMsg("mmRepresent", "대표자를")
		count++;
	}
	if($("#mmAddress").val() == "" || $("#mmAddress").val() == null) {
		fncMsg("mmAddress", "주소를")
		count++;
	}
	if($("#mmOpNum").val() == "" || $("#mmOpNum").val() == null) {
		fncMsg("mmOpNum", "사업자번호를")
		count++;
	}
	oEditors.getById["mmCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
	if($("#mmCont").val()=='<p>&nbsp;</p>') {
		alert("내용을 입력해주세요");
		oEditors.getById["mmCont"].exec("FOCUS"); /* 에디터 */
		count++;
	}		
	if(count>0){
		count=0;
		return false; 
	}
	
	if(mmSeq == null || mmSeq ==''){ // 등록 
		fncPageBoard('write','insertProc.do');
		return false;
	}else{ // 수정 
		fncPageBoard('update','updateProc.do');
		return false;
	}
	
}



$(document).ready(function(){	
	
	<%-- 에디터 --%>
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "mmCont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	}); 
	
});
</script>