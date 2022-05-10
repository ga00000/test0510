<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>

<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="reSeq" id="reSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="reAtchFileId" id="reAtchFileId"/>
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
							${requireVO.reRgstId }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${requireVO.reRgstDt }</td>
					</tr> 
					
					<tr>
						<th scope="row"><strong>제목</strong></th>
						<td colspan="3">
								${requireVO.reTitle }
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>진행상황</strong></th>
						<td colspan="3">
								${requireVO.reSelect eq 'submit' ? '신청' : '' }
								${requireVO.reSelect eq 'agree' ? '승인' : '' }
								${requireVO.reSelect eq 'deny' ? '반려' : '' }
								${requireVO.reSelect eq 'reSubmit' ? '재신청' : '' }
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>글구분</strong></th>
						<td colspan="3">
								${requireVO.reSecretYn eq 'Y' ? '비밀글' : '일반글'}
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(requireVO.reCont)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="reAtchFileIdFrame" id="reAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${requireVO.reAtchFileId }&fileCnt=5&atchFileIdNm=reAtchFileId&updateType=view" style="width: 100%;"  frameborder="0" title="파일 업로드 폼"></iframe>
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
						<th scope="row"><strong class="th_tit">답글</strong></th>
						<td colspan="3">
							<input type="text" name="maCont" id="maCont" class="text w100p"   maxlength="30" value="${requireVO.maCont}" />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">진행상황</strong></th>
						<td colspan="3">
							<select id="reSelect" name="reSelect">
								<option value="submit" ${requireVO.reSelect eq "submit" ? "selected" : "" }> 신청 </option>
								<option value="agree" ${requireVO.reSelect eq "agree" ? "selected" : "" }> 승인 </option>
								<option value="deny" ${requireVO.reSelect eq "deny" ? "selected" : "" }> 반려 </option>
								<option value="reSubmit" ${requireVO.reSelect eq "reSubmit" ? "selected" : "" }> 재신청 </option>
							</select>
						</td>
					</tr>
					</tr>
				</tbody>
			</table>
			<div class="btn_area">
			<a href="#" class="btn btn_mdl btn_rewrite" onclick="fncPageBoard('view','maUpdateProc.do');">등록</a> 
		</div>	
		
		
	
	</form:form>
</div>
