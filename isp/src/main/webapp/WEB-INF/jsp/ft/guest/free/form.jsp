<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>

<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="feAtchFileId" id="feAtchFileId"/>
		<input type = "hidden" name="feRgstId" value="${loginFtSeq }">
		<input type = "text" name="feSeq" value="${freeVO.feSeq}">
		<input type = "text" name="feGroupSeq" value="${freeVO.feGroupSeq}">
		<input type = "text" name="proc" value="${searchVO.procType}">
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
							<input type="text" name="feTitle" id="feTitle" class="text w95p"   maxlength="30" value="${freeVO.feTitle}" />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="feCont" id="feCont" class="txt_area w_100p" >${freeVO.feCont}</textarea>
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
			
		<div class="tbl_btns  r">
			<c:choose>
				<c:when test="${freeVO.feSeq eq freeVO.feGroupSeq}"> 
					<a href="javascript:void(0);"  class="btn btn_middle btn_purple" onclick="btnSubmit('${searchVO.procType}');">${searchVO.procType  eq 'update' ? '수정' : '등록'}</a>
					<a href="javascript:void(0);"  class="btn btn_middle btn_gray" onclick="fncPageBoard('view','list.do');">목록</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:void(0);"  class="btn btn_middle btn_purple" onclick="btnReply('${searchVO.procType}');">답글수정</a>
					<a href="javascript:void(0);"  class="btn btn_middle btn_gray" onclick="fncPageBoard('view','list.do');">목록</a>
				</c:otherwise>
			</c:choose>
			
		</div>
		
		
	</div>
	</form:form>
</div>

<script type="text/javascript">


// 등록버튼 
function btnSubmit(procType){
	var count = 0; 
	if($("#feTitle").val() == "" || $("#feTitle").val() == null) {
		fncMsg("feTitle", "제목을 입력하세요. ")
		count++;
	}
	if($("#feCont").val() == "" || $("#feCont").val() == null) {
		fncMsg("feCont", "내용을 입력하세요.")
		count++;
	}
	if(count>0){
		count=0;
		return false; 
	}
	// 게시글 procType 
	if(procType =="update"){ // 수정 
		fncPageBoard('write', 'updateProc.do');
		return false;
	}else if(procType =="insert"){ // 등록 
		fncPageBoard('write','insertProc.do');
		return false;
	}else if(procType=="reInsert"){ // 답글등록 
		fncPageBoard('write','reInsertProc.do');
		return false;
	}
}

//답글 등록버튼 
function btnReply(procType){
	var count = 0; 
	if($("#feTitle").val() == "" || $("#feTitle").val() == null) {
		fncMsg("feTitle", "제목을 입력하세요.")
		count++;
	}
	if($("#feCont").val() == "" || $("#feCont").val() == null) {
		fncMsg("feCont", "내용을 입력하세요. ")
		count++;
	}
	if(count>0){
		count=0;
		return false; 
	}
	// 답글 procType 
	 if(procType=="reUpdate"){ // 답글수정 
		fncPageBoard('write','reUpdateProc.do');
		return false;
	}
}








</script>