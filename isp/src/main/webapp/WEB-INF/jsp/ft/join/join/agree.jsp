<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>

<style>
.termsArea {padding: 55px;border: 1px solid #cbcbcb;}
.termsArea .termshd {margin-bottom: 20px;color: #000;font-size: 24px;font-weight: 700;}
.termsArea .tlast {margin-bottom: 50px;}
.termsArea .tlast02 {margin-bottom: 20px;}
.termsArea .tlasttop {margin-bottom: 50px;color: #000;font-size: 24px;}
.termsArea ol {margin-bottom: 50px;}
.termsArea ol li {position: relative;padding: 0 0 0 20px;}
.termsArea ol li ol {margin: 10px 0 15px;}
.termsArea ol ul {margin: 10px 0 15px;}
.termsArea ol ul li {padding:0;}
.termsArea ol li span {position: absolute;top: 0;left: 0;}
.termsArea .ostList {margin-bottom: 50px;}
.termsArea .ostList > li {position: relative;padding: 0 0 0 30px;}
.termsArea .ostList > li > span {position: absolute;top: 0;left: 0;}
.tblh2 {width: 100%;margin:10px 0 30px;border-top: 1px solid #005eb7;}
.tblh2 thead tr {background: url(http://opennote.co.kr/template/pc11/images/sub/bg_th.png) repeat-x 0 0;}
.tblh2 thead th {padding: 10px;text-align: center;color: #474747;border-right: 1px solid #e5e5e5;border-bottom: 1px solid #e5e5e5;font-size:16px;font-weight:600;}
.tblh2 tbody td {padding: 10px;text-align: left;border-right: 1px solid #e5e5e5;border-bottom: 1px solid #e5e5e5;}
.tblh2 thead th:last-child {border-right: 0;}
.tblh2 tbody td:last-child {border-right: 0;}
.tblh2 tbody td.last {border-right: 1px solid #e5e5e5;}
.tblh2.cet tbody td {text-align: center;}

* {box-sizing:border-box;}
.btn {display: inline-block;font-weight: normal;text-align: center;vertical-align: middle;cursor: pointer;
border:1px solid transparent;
border-color: rgba(0, 0, 0, 0);
white-space: nowrap;
font-size: 12px;
color:#fff;
line-height: 1;
border-radius: 2px;
-webkit-user-select: none;
-moz-user-select: none;
-ms-user-select: none;
user-select: none;}
.btn_big {width:150px;height:50px;line-height:50px;}
.btn_cancel {color:#000;background:#fff;border-color:#000;}
.btn_join {color:#fff;background:#308cde;}

</style>


<form:form commandName="freeVO" name="defaultFrm" id="defaultFrm" method="post">
	<input type = "hidden" name="agree" id="agree" value="N">

<div class="termsArea">
    <h4 class="termshd">제1조（총칙)</h4>
    <ol>
        <li><span class="pos">①</span> 개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명, 주민등록번호 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함합니다)를 말합니다.</li>
        <li><span class="pos">②</span> 한국전력공사 에너지마켓플레이스(이하 ‘ENTER’)은 고객의 개인정보보호를 매우 중요시하며, 『개인정보보호법』및 『표준개인정보보호지침』을 준수하고 있습니다. ENTER는 개인정보처리방침을 통하여 고객께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</li>
        <li><span class="pos">③</span> ENTER는 개인정보처리방침을 홈페이지 첫 화면에 공개함으로써 고객께서 언제나 용이하게 보실 수 있도록 조치하고 있습니다.</li>
        <li><span class="pos">④</span> ENTER는 개인정보처리방침의 지속적인 개선을 위하여 개인정보처리방침을 개정하는데 필요한 절차를 정하고 있습니다. 그리고 개인정보처리방침을 개정하는 경우 버전번호 등을 부여하여 개정된 사항을 귀하께서 쉽게 알아볼 수 있도록 하고 있습니다.</li>
        <li><span class="pos">⑤</span> 한국전력공사에서 보유중인 개인정보파일은 아래의 사이트에서 검색이 가능합니다.
            <ol>
                <li><span class="pos">-</span> 한국전력공사 개인정보 처리방침<br>
                    <a href="http://home.kepco.co.kr/kepco/CU/G/htmlView/CUGBHP004.do?menuCd=FN120402" target="_blank" title="한국전력공사 개인정보 처리방침 새창열기">(http://home.kepco.co.kr/kepco/CU/G/htmlView/CUGBHP004.do?menuCd=FN120402)</a>
                </li>
            </ol>
        </li>
    </ol>
    </div>
    
    <div class="join_btns c ">
        <a href="#" class="btn btn_big btn_join" onclick="btnSubmit();">약관동의</a>
        <a href="/ft/main.do" class="btn btn_big btn_cancel">메인으로</a>
        </div>
 </form:form>  
      
      
      
<script type="text/javascript">
        
      function btnSubmit(){
    	  $("#agree").val("Y")
    	  fncPageBoard('view','Join.do');
      }
        
        
        </script>