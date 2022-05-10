package com.open.cmmn.interceptor;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ft.join.service.FtJoinVO;
import com.open.ma.login.service.LoginVO;
import com.open.ma.mainMa.service.MainMaVO;
import com.open.ma.sys.mn.service.MnVO;
//<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
//<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>

public class FrontInterceptor extends HandlerInterceptorAdapter implements HandlerInterceptor {

	
	@Autowired
	private CmmnService cmmnService;
	
	/**
	 * Log4j Logger.
	 */
	private static final Logger LOGGER = LogManager.getLogger(ManageInterceptor.class.getName());


	@SuppressWarnings("unchecked")
	@Override
	public boolean preHandle(final HttpServletRequest request, final HttpServletResponse response, final Object handler) throws Exception {
		//  대 소 리스트  
		CmmnDefaultVO searchVO = new CmmnDefaultVO();
		List<MnVO> menuList = (List<MnVO>) cmmnService.selectList(searchVO, "Mn.daeSelectList" ); // 대
		for (MnVO mnVO : menuList) {
			List<MnVO> soMenuList = (List<MnVO>) cmmnService.selectList(mnVO, "Mn.soSelectList" );  // 소 
			mnVO.setMenuList(soMenuList); // 대+소
		}
		HttpSession session = request.getSession();
		session.setAttribute("ftMenuList", menuList);
		
		// footer 
		MainMaVO mainMaVO = new MainMaVO();
		mainMaVO = (MainMaVO) cmmnService.selectContents(searchVO, "MainMa" );
		session.setAttribute("mainMaVO", mainMaVO);
		
		
		/** 비로그인시 form & Form 튕겨내기 ======================*/
		if (!SessionUtil.isFrtLogined(request)) { // 사용자 로그인 시 true --> 비로그인시 form/Form 경로 막기  
			if(!request.getRequestURI().contains("loginForm.do")){ // 로그인폼에선 contain 조회x -- 없으면 무한루프 
				// form 포함 or Form 포함 = true
				if (request.getRequestURI().contains("form.do")  || request.getRequestURI().contains("Form.do")) {
					response.sendRedirect("/ft/fail.do");
					return false;
				}
			}
		}
		return true;
	}


	
	
	@Override
	public void afterCompletion(final HttpServletRequest request, final HttpServletResponse response, final Object handler, final Exception ex) throws Exception {
		long endTime = System.currentTimeMillis();
	}
}