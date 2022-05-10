<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">



		<ul class="clear">
			<c:if test="${fn:length(portList) gt 0 }">
				<c:forEach var="port" items="${portList}" > 
						<c:choose>
							<c:when test="${not empty port.ptAtchFileId }">
								<li>
									<img src="/atch/getImage.do?atchFileId=${port.ptAtchFileId}&fileSn=0" alt="" >
									<a href="/ft/port/${port.ptSelect}/view.do?ptSeq=${port.ptSeq}"><span class="hover_txt"><strong>${port.ptTitle }</strong>${port.ptRgstDt}</span><span class="more">상세보기 +</span></a>
								</li>
							</c:when>
						<c:otherwise>
								<li>
									<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMIAAAEDCAMAAABQ/CumAAAAflBMVEX///+4uLi7u7v7+/vAwMD09PTFxcXp6enc3Nz4+PjIyMi6uro8PDw/Pz/w8PCzs7PPz8/l5eXV1dU4ODinp6dTU1NFRUVZWVlOTk7T09OIiIiXl5eurq50dHRKSkpmZmaUlJR4eHienp6Li4t+fn4sLCxoaGgWFhYmJiYyMjIE2RVEAAAE80lEQVR4nO3b6XqqOhQGYAiBhCHMBEQZHOo53v8NniTYVt2t7dkDyn6+90eLKO1aMWsBbbQsAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIBFclj26BB+iZOlYUgfHcXP87MgSWie2vGjI/k5LvdI4nHXcknIHx3MT4g5DSlV8StpSJY2k5w4pzZJc5KbhzEhZFEzyWG5F5I0860V8fXjWJdzsJgUVPshNEyZjt21VQGwFZ3yWQYVv52Q3CNTwClV7TSxV8x5cFzfZdoP5bEVJ6YC/IxS1U4XM3981X7Iuf0EocnHJt70eCFim3pkav0sXKl8wmBR8WuUEqqnvBMHlJAgW1r8Sk5JptrpSmWynPZzjYVBtiLqdMaWGb9G1el4Oe3nQ1zNH99373l0iF/h5EL40ab97FOME+8LC0iBhvYdhC4hBS9mn7MXkUJw7/nlp+AghTkghWeAFJ4BUngGSOEZ/P0pLOQaybtzocrCRaRA7twuhMu4X/jC86eQ3Ltn05JnT8FyvvToCAEAAACe3YadN1jTWuzuS5+Sw8uiPW8fxLgrHpBD9gu/Mw72tRT9OQXe1ywtyO8J63/wh/r2ypmVP9wN8ORmRxpbvoo/ksN+J9fTvo3YW/vi7l33HxHX1e2/Z73TFLDDN/vtymweXq6XRZanMTwW8lhy1wqi3bRzLbtWDH864B+xprr9D+xGjPpb2gnRy87saqKrF7G+KkW1mxZqeNFm2ruSUtQPKAVW6RTSNraCTTBNqVKU6usoRL05TpMkjuTVQaNYB+J1kaEXvc6yfEfmvJ1zd9Pbn0mdwrrY1EUhajPWpY5pjGRi2WIqlFzUVwdLqer2ddIH0XrGuN+5gxhMdFzoFHbC3pRpI1K9y6Sw7phqMf001KnYXh6cRZ1lv6XATxcpsDwcu6qbI4VW1v3uIoVI98JGmqI1KVgqwYM8F6otDpcH86hVz6XnR347lbwV52VX90KIppwhg0zWvOt16WWN7kgmhVwO7xNJSeXAWlOeyVTgr+LouOunRhabI1yVL29rVc5yOJTzrEDZiZ21Fnr0WNVk5xTWOlCfvaWwFTR7MQOaRNfjehBCmtc4Rz3DskFNpUL09SHhsy2g2Yogqxv96+LhLYVK5FZad68pZM3gx8VhSmFzdbhfjip9XSednob7Qj3tlatZ18cc5LaPQhPNUa50jInqLNv8EKmNchrzoFCVUDcfpWDwf1Q1tGoAsr4+j3024yImXhXHcznudV2mRWl1TaNOTYEO2LSYbBvrAdazLfwohaSg6u2TuXoLz9PMHSpVUclmnr9Wvv9JsTypSLgs86iXzU7PheA0vr0uLfQ2//f2GsnSZ45cVYEIrErytVmJHg9VqWt67vMEG/Sc3pb+dptM88AdvfenTcOy6AcD26oUtpUMmOjiwXQ3VVdCqsY0R0+9YqL7dKlaePI+eaaNeFaXEUnVZR6JRv1Djs2a86Z5tk/KfNrl1UTiRxKVRNfEVl8yOZ06m7ey/eSA55NEYXbcRDR50YvqG30VtZe5K1VrtvzVo6P7Fla0bl2LwDXXUbGu4fIUeKoyvLZ4eXBw3zSe1ClEXn6wh4/+2Fcyio5L+bhPZjmlfbMvLeSwzh8Szm/DF7xMGgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACM/wDCj0dZezasYAAAAABJRU5ErkJggg==" alt="" >
									<a href="/ft/port/${port.ptSelect}/view.do?ptSeq=${port.ptSeq}"><span class="hover_txt"><strong>${port.ptTitle }</strong>${port.ptRgstDt}</span><span class="more">상세보기 +</span></a>
								</li>
						</c:otherwise>
						</c:choose>
				</c:forEach>
			</c:if>
		</ul>
						
					



</form:form>

<script type="text/javascript">


  

</script>