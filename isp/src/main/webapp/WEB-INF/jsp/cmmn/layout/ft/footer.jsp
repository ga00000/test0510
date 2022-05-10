<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>


<!-- footer -->
		<footer id="footer">
			<ul class="footer_link clear">
				<li> 김건축에 오신것을 환영합니다. </li>
			</ul>
			
			<div class="footer_area">
				<div class="footer_box">
					<div class="customer_center">
						<table>
							<thead>
								<tr>
									<th colspan="2">고객센터</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>평일</th>
									<td class="r" > 09:00 ~ 18:00</td>
								</tr>
								<tr>
									<th>토요일</th>
									<td class="r" >09:00 ~ 12:00</td>
								</tr>
								<tr>
									<td class="last" colspan="2">061.123.4567</td>
								</tr>
								<tr>
									<td class="last" colspan="2">010.1234.5678</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<p class="address">${mainMaVO.mmAddress} </p>
					<ul class="clear">
						<li>대표 : ${mainMaVO.mmRepresent}  ㅣ  사업자등록번호 : ${mainMaVO.mmOpNum} </li>
						<li><i class="fa fa-phone"></i>${mainMaVO.mmNum} </li>
						<li><i class="fa fa-fax"></i>FAX : ${mainMaVO.mmFax} </li>
						<li><i class="fa fa-envelope"></i> ${mainMaVO.mmEmail} </li>
					</ul>
					<p class="copy">2017 Copyright by 김건축 사무소 &copy; all right reserved.</p>
				</div>
			</div>
		</footer>
		<!-- //footer -->