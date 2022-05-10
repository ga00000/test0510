<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>

<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="baSeq" id="baSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="baAtchFileId" id="baAtchFileId"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<!-- tbl -->
		<div class="tbl_wrap">
			<table class="tbl_row_type01">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:15%;">
					<col style="width:35%;">
					<col style="width:15%;">
					<col style="width:35%;">
				</colgroup>
				<tbody>
				
					<tr>
						<th scope="row"><strong>등록자</strong></th>
						<td>
							${bannerVO.baRgstId }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${bannerVO.baRgstDt }</td>
					</tr> 
					
					<tr>
						<th scope="row"><strong>제목</strong></th>
						<td colspan="3">
								${bannerVO.baTitle }
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>창구분</strong></th>
						<td colspan="3">
								${bannerVO.baWindowYn eq "Y" ? "새 창" : "기존창"}
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>링크</strong></th>
						<td colspan="3">
								${bannerVO.baCont }
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="baAtchFileIdFrame" id="baAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${bannerVO.baAtchFileId }&fileCnt=5&atchFileIdNm=baAtchFileId&updateType=view" style="width: 100%;"  frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	<div class="btn_area">
		<a href="#" id="btn_update" class="btn btn_mdl btn_rewrite" >수정</a> 
		<a href="#" id="btn_del" class="btn btn_mdl btn_del" >삭제</a>
		<a href="#" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
	</div>	
	</form:form>
</div>
