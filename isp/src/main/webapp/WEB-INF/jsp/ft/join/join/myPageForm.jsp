<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>

<style>
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
 
 
/* join */
.join_wrap {position:relative;width:50%;padding:50px;margin: 0 auto;}
.join_wrap h2 {margin-bottom:15px;text-align:center;font-size:26px;}
.join_form {border-left:0px solid #dfdfdf;}
.join {position:relative;}
.join .input_box {position:relative; margin-top:6px;padding-left:48px;border:1px solid #e3e3e3;}
.join .last .input_box {padding-right:120px;}
.join span {position:absolute;left:-1px;top:-1px;bottom:-1px;width:48px;line-height:48px;text-indent:-9999em;border-right:1px solid #e3e3e3;}
.join .i_em {background:#308cde url(http://opennote.co.kr/guide/images/sample/i_em.png) no-repeat 50% 50%}
.join .i_pw {background:#308cde url(http://opennote.co.kr/guide/images/sample/i_pw.png) no-repeat 50% 50%}
.join .i_pwr {background:#308cde url(http://opennote.co.kr/guide/images/sample/i_pwr.png) no-repeat 50% 50%}
.join .i_nm {background:#308cde url(http://opennote.co.kr/guide/images/sample/i_nm.png) no-repeat 50% 50%}
.join .i_ph {background:#308cde url(http://opennote.co.kr/guide/images/sample/i_ph.png) no-repeat 50% 50%}
.join .i_ph02 {background:#308cde url(http://opennote.co.kr/guide/images/sample/i_ph.png) no-repeat 50% 50%}
.join .text {width:100%;height:48px;border:0;}
.identify_time {position:absolute;right:150px;bottom:15px;}
.join_error p {color: red;display:none;}
.btn_identify {position: absolute;right: -1px;top:-1px;bottom:-1px;display:block;width: 120px;line-height:48px; text-align:center; color:#308cde;border:1px solid #308cde;background:#fff;}
.btn_identify02 {position: absolute;right: -1px;top:-1px;bottom:-1px;display:block;width: 120px;line-height:48px; text-align:center; color:#000;border:1px solid #e8e8e8;background:#e8e8e8;}
 
/*??????*/
.terms_box {margin:15px 0; background: #fff;}
.all_check {border:1px solid #e6e6e6;}
.terms_view {border:1px solid #e6e6e6;border-top:0;}
.terms_view dt {position:relative;}
.terms_view dd {padding:12px 3%;font-size:12px;border-top:1px solid #eee;border-bottom:1px solid #eee;}
.btn_terms {position:absolute; right:20px;top:0; width:40px;height:100%;text-indent:-9999em;background-image: url(http://opennote.co.kr/guide/images/sample/terms_arrow.png); background-repeat: no-repeat; background-position: 100% 50%; background-size:auto 25px;-webkit-transition: all 0.1s ease-out;-moz-transition: all 0.1s ease-out; -ms-transition: all 0.1s ease-out;-o-transition: all 0.1s ease-out;transition: all 0.1s ease-out;}
.expanded .btn_terms {background-position:50% 50%;-webkit-transform: rotateZ(90deg); -ms-transform: rotateZ(90deg); transform: rotateZ(90deg);}
.terms_box .checkboxs {padding:10px 3%;background:#fff;}
.terms_box .checkboxs input[type="checkbox"] {position: absolute;left: -9999em;}
.terms_box .checkboxs label {display: inline-block;line-height: 25px;padding-left:28px;min-width: 25px;min-height: 25px;margin-right: 10px;letter-spacing:-0.06em;background: url(http://opennote.co.kr/guide/images/sample/terms_check_off.png) no-repeat 0 50%;background-size:auto 25px;}
.terms_box .checkboxs input[type="checkbox"]:checked + label {background: url(http://opennote.co.kr/guide/images/sample/terms_check_on.png) no-repeat 0 50%;background-size:auto 25px;}
 
.join_btns {margin-top:25px;text-align:center;}

</style>


<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">


<div class="join_wrap">
    <div class="join_form">
    <h2>???????????????</h2>
        <input type="checkbox" id="pwUpdate" /> ???????????? ?????? 
        
        <ul class="join js-join">
            <li>
                <div class="input_box">
                    <span class="i_em">?????????</span><input type="text" class="text js-text" maxlength="10" name="ftId" id="ftId" value="${ftJoinVO.ftId}" disabled />
               		 <font color="red">???????????? ?????????????????????.</font>
                </div>
            </li>
            
            <li style="display:none;" class="pwArea">
                <div class="input_box" >
                    <span class="i_pw">????????????</span><input type="password" maxlength="10" class="text js-text" name="ftPwd" id="ftPwd"placeholder="????????????" />
                </div>
            </li>
            
            <li  style="display:none;" class="pwArea">
                <div class="input_box">
                    <span class="i_pwr">??????????????????</span><input type="password" maxlength="10" class="text js-text "  id="ftPwdCheck" placeholder="???????????? ??????" />
                </div>
            </li>
            
            <li>
                <div class="input_box">
                    <span class="i_nm">??????</span><input type="text" class="text js-text" maxlength="10" name="ftName" id="ftName" placeholder="??????" value="${ftJoinVO.ftName}"/>
                </div>
            </li>
            <li class="last">
                <div class="input_box">    
                    <span class="i_ph">???????????????</span><input type="text" class="text js-text" maxlength="10" name="ftHp" id="ftHp" placeholder="????????? ??????" value="${ftJoinVO.ftHp}" />
                   
                </div>
            </li>
            
             <li class="last">
                <div class="input_box">
                    <span class="i_em">?????????</span><input type="text" class="text js-text" maxlength="10" name="ftEmail" id="ftEmail" placeholder="?????????" value="${ftJoinVO.ftEmail}"/>
                   
                </div>
            </li>
        </ul>
    </div>
    
    <div class="join_btns">
        <a href="#" class="btn btn_big btn_join" onclick="btnJoin();">????????????</a>
        <a href="/ft/main.do" class="btn btn_big btn_cancel">????????????</a>
    </div>
</div>
    
 </form:form>  
      
      
      
<script type="text/javascript">
  
 $(function(){
	 $(".pwArea").hide();
		$("#ftPwd").val('');
		$("#ftPwdCheck").val('');
		$(".pwArea").attr("disabled",true);
 }) 
  
 $("#pwUpdate").on("change",function(){
	if($("#pwUpdate").is(":checked")){ // ?????? ?????? 
		$(".pwArea").show();
		$(".pwArea").attr("disabled",false);

	}else{
		$(".pwArea").hide();
		$("#ftPwd").val('');
		$("#ftPwdCheck").val('');
		$(".pwArea").attr("disabled",true);
	}
	 
 })


// ?????? 
function btnJoin(){
	var count = 0; 
	var regExp =/^[a-z0-9_]{4,20}$/;
	var testId = regExp.test( $("#ftId").val() );
	var testPw = regExp.test( $("#ftPwd").val() );
	//????????? 
	if(!testId){
		fncMsg("ftId", "???????????? 4?????? ?????? ???????????????.")
		count++;
	}
	if($("#pwUpdate").is(":checked")){ // ?????? ?????? 
		if(!testPw){
			fncMsg("ftPwd", "??????????????? 4?????? ?????? ???????????????.")
			count++;
		}
		if($("#ftPwd").val() != $("#ftPwdCheck").val() ) {
			fncMsg("ftPwdCheck", "??????????????? ???????????? ????????????.")
			count++;
		}
	}
	if($("#ftName").val() == "" || $("#ftName").val() == null) {
		fncMsg("ftName", "????????? ???????????????.")
		count++;
	}
	if($("#ftHp").val() == "" || $("#ftHp").val() == null) {
		fncMsg("ftHp", "????????? ????????? ???????????????.")
		count++;
	}
	if($("#ftEmail").val() == "" || $("#ftEmail").val() == null) {
		fncMsg("ftEmail", "???????????? ???????????????.")
		count++;
	}

	if(count>0){
		count = 0;
		return false; 
	}
	$("#ftId").attr("disabled",false);
	fncPageBoard('view','myPageUpdateProc.do');
	return false;
	
	
}

        
        
 </script>