<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="bannerVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="baSeq" id="baSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="baAtchFileId" id="baAtchFileId"/>
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
							<input type="text" name="baTitle" id="baTitle" class="text w100p"   maxlength="30" value="${bannerVO.baTitle}" />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">링크</strong></th>
						<td colspan="3">
							<input type="text" name="baCont" id="baCont" class="text w100p"   maxlength="30" value="${bannerVO.baCont}" />
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">창구분</strong></th>
						<td colspan="3">
							새 창<input type = "radio" name="baWindowYn" id="baWindow_Y" value="Y" ${bannerVO.baWindowYn eq 'Y' ? 'checked' : ''}> 
							기존창<input type = "radio" name="baWindowYn" id="baWindow_N" value="N" ${bannerVO.baWindowYn eq 'N' ? 'checked' : ''} ${empty bannerVO.baWindowYn ? 'checked' : ''}> 
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="baAtchFileIdFrame" id="baAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${bannerVO.baAtchFileId }&fileCnt=5&atchFileIdNm=baAtchFileId&updateType=upload" style="width: 100%;"  frameborder="0" baTitle="파일 업로드 폼"></iframe>
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
	if($("#baTitle").val() == "" || $("#baTitle").val() == null) {
		fncMsg("baTitle", "제목을")
		count++;
	}
	
	if($("#baCont").val() == "" || $("#baCont").val() == null) {
		fncMsg("baCont", "내용을")
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
	
	
});
</script>