<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>

<style>
input [type="text"], input.text {height: 40px;padding-left: 10px;}
.login_wrap {width:765px;margin: 0 auto;position: relative;}
.login_tit {font-size:22px; font-weight:bold;margin-bottom: 5px;}
.login_box {position:relative;border:1px solid #cdcdcd;border-top:3px solid #308cde;background:#fff;}
.login {background:url(http://opennote.co.kr/guide/images/sample/bg_licensee_1.png) no-repeat 66px 50%;padding:40px 25px 40px 365px;}
.login_input {position:relative;padding-right:81px;}
.login_input li {position:relative; margin-bottom:-1px;}
.login_input .text {width:100%;box-sizing:border-box;}
.btn_login {display:block;position:absolute;right:1px;top:0;width:81px;height:79px;border:0;background:#308cde;color:#fff;font-size:14px;}
.id_save {font-size:14px;margin-top:10px;text-align:right;}
.sns_login {margin-top:10px;}
.sns_login a {display:block;width:48%;height:32px; line-height:30px;text-align:center;}
.sns_login a.naver {font-size: 14px;float:left;border:1px solid #46ce19;color: #484848;background:#46ce19 url(http://opennote.co.kr/guide/images/sample/btn_nv_login.png) no-repeat 0 50%;background-size: 30px;text-align: left;padding-left: 50px;color:#fff;}
.sns_login a.cacao {font-size: 14px;float:right;border:1px solid #ffd93d;color: #fff;background:#ffd93d url(http://opennote.co.kr/guide/images/sample/btn_kk_login.png) no-repeat 0 50%;background-size: 30px;text-align: left;padding-left: 50px;}
.login_link {border-top:1px dashed #ccc;margin-top:15px; padding-top:15px;}
.login_link li {position:relative;margin-bottom:8px;font-size:14px;}
.login_link .btn_link {position:absolute; right:0; bottom:0;color:#000;font-size:14px;text-decoration: underline;}

</style>


<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">

<div class="login_wrap">
    <div class="login_box">
        <div class="login">
            <fieldset>
                <legend>로그인폼</legend>
                <div class="login_input">
                    <ul>
                        <li><input type="text" title="아이디를 입력하세요" placeholder="ID" maxlength="10" name="ftId" id="ftId" class="text" /></li>
                        <li><input type="password" title="비밀번호를 입력하세요" placeholder="PW" maxlength="10" name="ftPwd" id="ftPwd" class="text" /></li>
                    </ul>
                    <button type="button" class="btn_login" onclick="btnLogin();">ok</button>
                </div>
            </fieldset>
            <div class="login_link">
                <ul>
                    <li>아직 회원이 아니신가요? <a href="/ft/join/join/agree.do" class="btn_link"\">회원가입</a></li>
                    <li>아이디 또는 비밀번호를 분실하셨나요? <a href="/ft/join/join/find.do" class="btn_link">아이디/비밀번호 찾기</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
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

// 로그인
function btnLogin(){
	var count = 0; 
	var regExp =/^[a-z0-9_]{4,20}$/;
	var testId = regExp.test( $("#ftId").val() );
	var testPw = regExp.test( $("#ftPwd").val() );
	//유효성 
	if(!testId){
		fncMsg("ftId", "아이디를 4글자 이상 입력하세요.")
		count++;
	}
	if(!testPw){
		fncMsg("ftPwd", "비밀번호를 4글자 이상 입력하세요.")
		count++;
	}
	if(count>0){
		count = 0;
		return false; 
	}
	fncPageBoard('view','loginCheck.do');
	return false;
	
	
}

        
        
 </script>