<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>

<!-- layout  -->
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<title>김건축사무소</title>
	<link rel="stylesheet" type="text/css" href="/publish/ft/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="/publish/ft/css/style.css">
	<script type="text/javascript" src="/publish/ft/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="/publish/ft/js/common.js"></script>
	<script type="text/javascript" src="/publish/ft/js/jquery.bxslider.js"></script>
	
	<style>
	
	</style>
	
 </head>
 <body>
	<div id="skipnavi">
		<a href="#container">▶본문 바로가기</a>
		<a href="#gnb_area">▶주메뉴 바로가기</a>
	</div>
	<div id="wrapper">
        <!-- header --> 
		<tiles:insertAttribute name="header"/>
        <!--// header -->     
        
            <!-- container -->
      <div id="container">
      	<div class="sub_top sub_visual01">
				<p class="txt_visual"><strong>고객의 행복을 건설하는 김건축 사무소</strong>고객님의 만족을 위해 최선을 다하겠습니다.</p>
		</div>
      	<div id="content">
	        <!-- header --> 
	        <c:if test="${url.split('/')[2] ne 'join' }">
					<tiles:insertAttribute name="aside"/>
			</c:if>
	        <!--// header -->     
			<!-- contents -->			
			
			<tiles:insertAttribute name="body"/>
		</div>
		
		<!--// contents e -->      
        </div><!-- //container -->
	<tiles:insertAttribute name="footer"/>  
	</div>
    <!-- //wrap -->
 </body>
</html>
			
		 