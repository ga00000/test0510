<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>



<!-- header  -->
		<div class="gnb_bg"></div>
		<header id="header">
			<div class="header_box">
				<h1 class="logo"><a href="/ft/main.do"><img src="/publish/ft/images/common/logo.png" alt="김건축사무소"/></a></h1>
				<div class="util_box">
					<ul class=" clear">
						<c:choose>
							<c:when test="${not empty loginFtId }">
								<li><a href="/ft/join/join/pwCheckForm.do">${loginFtId}님 환영합니다. </a></li>
								<li><a href="/ft/join/join/loginout.do">로그아웃</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/ft/main.do">HOME</a></li>
								<li><a href="/ft/join/join/loginForm.do">로그인</a></li>
								<li><a href="/ft/join/join/agree.do">회원가입</a></li>
							</c:otherwise>
						</c:choose>
						
						
						<li><a href="/login.do"><i class="fa fa-star"></i>즐겨찾기</a></li>
					</ul>
				</div>
			</div>
			<!-- GNB -->
			<h2 class="hidden">주메뉴</h2>
			<div id="gnb_area">
				<nav id="gnb">
					<ul class="depth2 clear">
						<c:forEach var="result" items="${ftMenuList }" varStatus="status" >
							<li class="depth1_1">
								<a href="${result.url }" >${result.menuNm }</a>
								<ul class="depthBox">
									<c:forEach var="sub" items="${result.menuList }" varStatus="status" >
										<li><a href="${sub.url }">${sub.menuNm }</a></li>
									</c:forEach>
								</ul>
							</li>
						</c:forEach>
					</ul>
				</nav>
			</div>
			<!-- //GNB -->
		</header>
		<!-- // header   -->
		
	<script type="text/javascript">
	$(document).ready(function() {
		$('.slider').bxSlider({
			controls:false,
			auto: true,
			autoControls: true,
			autoControlsCombine:true,
			pager:true,
			pause: 4000
		});
	});
</script>