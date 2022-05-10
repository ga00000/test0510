<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<style>
/* button{ position:absolute; top:50%; left:50%; */
/*   width:120px; height:30px; margin-top:-15px; margin-left:-60px; */
/*   line-height:15px; cursor:pointer; */
/* } */

.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none; z-index:999;
}

.modal_content{
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:50%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}

</style>
<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"></div>
</div>

<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup> 
			<col style="width:5%">
			<col style="width:10%">
			<col style="width:10%">
			<col>
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:5%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">글구분</th>
				<th scope="col">진행상황</th>
				<th scope="col" class="subject">제목</th>
				<th scope="col">첨부파일</th>
				<th scope="col">등록자</th>
				<th scope="col">등록일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor" onclick="checkSecret('${result.reSecretYn}','${result.reSeq}');">
							<td >${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)} </td>
							<td >${result.reSecretYn eq "Y" ? "비밀글" : "일반글" }</td>
							<td >
								${result.reSelect eq 'submit' ? '신청' : '' }
								${result.reSelect eq 'agree' ? '승인' : '' }
								${result.reSelect eq 'deny' ? '반려' : '' }
								${result.reSelect eq 'reSubmit' ? '재신청' : '' }
							</td>
							<td class="subject cutLength" >${result.reTitle }</td>
							<td >${empty result.reAtchFileId ? "없음" : "있음" }</td>
							<td >${result.reRgstId }</td>
							<td >${result.reRgstDt }</td>
							<td >${result.reView }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="8" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<%-- //tbl end --%>


<div class="modal">
  <div class="modal_content"  title="클릭하면 창이 닫힙니다.">
    비밀번호
    <input type = "password" name="rePwd" id="rePwd" > 
    <input type = "hidden" name="deliverSeq" id="deliverSeq" > 
    <input type = "button"   onclick="modalSubmit();" value="확인">
    <input type = "button"  onclick="modalCancel();" value="취소" >  
  </div>
</div>
<%-- paging start --%>
<div class="paging_wrap">
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" />
	</div>
	<div class="tbl_btns  r">
			<a href="#" class="btn btn_middle btn_purple" onclick="fncPageBoard('view','/ft/user/require/form.do');">${empty noticeVO.ntSeq ? "등록" : "수정" }</a>
		</div>
</div>
<%-- //paging end--%>
</form:form>

<script type="text/javascript">
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

// 비밀글-모달 / 일반글-view 
function checkSecret(Yn, reSeq){
	if(Yn=="Y"){ // 비밀글 + 모달에 seq 담기
		$("#deliverSeq").val(reSeq);
		 $(".modal").fadeIn();
	}
	if(Yn=="N"){ // 일반글
		fncPageBoard('view','view.do',reSeq,'reSeq');
		return false; 
	}
}

// 비밀번호 일치 확인 - seq, pw 
function modalSubmit(){
	 $.ajax({  
		   method: "POST",  
		   url: "checkModalPw.do",  
		   data : {"reSeq":$("#deliverSeq").val(), "rePwd":$("#rePwd").val() }, 
		   dataType: "JSON",
		   success: function(data) {
			   if(data){
				   $(".modal").fadeOut();
				   fncPageBoard('view','view.do',$("#deliverSeq").val(),'reSeq');
			   }else{
				   fncMsg("rePwd", "비밀번호가 일치하지 않습니다.")
			   }
		  }
	 });
}


function modalCancel(){
	 $(".modal").fadeOut();
}


  

</script>