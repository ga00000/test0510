<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>

<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<input type="text" name="reSeq" value="${requireVO.reSeq }">
		<input type = "text" name="reRgstId" value="${loginFtSeq}">
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
							<input type="text" name="reTitle" id="reTitle" class="text w95p"   maxlength="30" value="${requireVO.reTitle}" />
						</td>
					</tr>
					
					
					<tr>
						<th scope="row"><strong >비밀글여부</strong></th>
							<td colspan="3"> 
								비밀 시 체크<input type = "checkbox" onclick="check_box();"  id="reSecret_Y"  ${requireVO.reSecretYn eq 'Y' ? 'checked' : ''} > 
								<input type="hidden" name="reSecretYn" id="reSecretYn">
							</td> 
					</tr>  
					       
					<tr id="tr_set_pw" style="display:none;">
						<th scope="row"><strong >비밀번호 수정</strong></th>
							<td colspan="3" >
								수정 <input type = "checkbox" onclick="check_modify();" name="updateCheck" id="updateCheck" > 
							</td> 
					</tr>
					
					<tr id="tr_pw"  style="display:none;">
						<th scope="row"><strong >비밀번호</strong></th>
							<td colspan="3" >
								<input type = "password" name="rePwd" id="rePwd" > 
							</td> 
					</tr>
					
					
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="reCont" id="reCont" class="txt_area w_100p" >${requireVO.reCont}</textarea>
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
		
		<div class="tbl_btns  r">
			<a href="#" class="btn btn_middle btn_purple" onclick="btnSubmit(${requireVO.reSeq});">${empty requireVO.reSeq ? "등록" : "수정" }</a>
			<a href="#" class="btn btn_middle btn_gray" onclick="fncPageBoard('view','/ft/user/board/list.do');">목록</a>
		</div>
		
	</form:form>
</div>

<script type="text/javascript">
$(function(){ // 페이지 열리지마자 실행 
	check_box();
	check_modify();
})   
  
function check_box(){ 
	if("${searchVO.procType}" == "update" && "${requireVO.reSecretYn}" == "Y" ){  // 비밀글 + 수정 
		if($("#reSecret_Y").prop("checked") ){ // 비밀 시 체크 Y 
			$("#reSecretYn").val("Y");  // 비밀글여부 변수 Y 
			$("#tr_set_pw").show(); // 비밀번호 수정 체크박스 
			$("#rePwd").attr("disabled", false);
		}else{     
			$("#reSecretYn").val("N");  // 비밀글여부 변수 N 
			$("#tr_set_pw").hide();
			$("#tr_pw").hide();
			$("#rePwd").attr("disabled", true);
			$("#rePwd").val("");
		} 
	}else{ // 등록 / 일반글 + 수정 
		if($("#reSecret_Y").prop("checked") ){ 
			$("#reSecretYn").val("Y");
			$("#tr_pw").show(); // 비밀번호 입력 
			$("#rePwd").attr("disabled", false);
		}else{
			$("#reSecretYn").val("N");
			$("#tr_pw").hide();
			$("#rePwd").attr("disabled", true);
			$("#rePwd").val("");
		}
	}
} 
 
function check_modify(){  // 비밀번호 수정 체크박스
	if($("#updateCheck").is(":checked")){ // 체크박스 check 
		$("#tr_pw").show(); 
		$("#rePwd").attr("disabled", false);
	}else{
		$("#tr_pw").hide();
		$("#rePwd").attr("disabled", true);
		$("#rePwd").val("");
	}
}




// 등록버튼 
function btnSubmit(feSeq){
	var count = 0; 
	if($("#reTitle").val() == "" || $("#reTitle").val() == null) {
		fncMsg("reTitle", "제목을 입력해주세요.")
		count++;
	}
	
	if($("#reCont").val() == "" || $("#reCont").val() == null) {
		fncMsg("reCont", "내용을 입력해주세요.")
		count++;
	}
	
	// 비밀글 택  
	if($("#reSecret_Y").prop("checked")){
		if($("#rePwd").val() == "" || $("#rePwd").val() == null) {
			fncMsg("rePwd", "비밀번호를")
			count++;
		} 
	}

	if(count>0){
		count=0;
		return false; 
	}
	
	if(feSeq != null){ // 수정 
		fncPageBoard('view', 'updateProc.do');
		return false;
	}else{ // 등록 
		fncPageBoard('view','insertProc.do');
		return false;
	}
}

// 수정버튼
function btnList(){
	fncPageBoard('view','view.do');
}


$(document).ready(function(){	
	
});
</script>