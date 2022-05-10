package com.open.ft.join;

import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.EncryptUtil;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ft.join.service.FtJoinVO;
import com.open.ma.login.service.LoginVO;
import com.open.ma.sys.mn.service.MnVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class FtJoinController {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
    
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Join";

    /** folderPath **/
    private final static String folderPath = "/ft/join/join/";

    
	//약관동의 
	@RequestMapping(folderPath + "agree.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

		return ".fLayout:"+ folderPath + "agree";
	}
	
	// 회원가입 폼 
	@RequestMapping(folderPath + "Join.do")
	public String loginForm(@ModelAttribute("searchVO") FtJoinVO searchVO, String agree, ModelMap model, HttpServletRequest request) throws Exception {
	
		if(agree.equals("Y")){ // 약관동의 
			return ".fLayout:"+ folderPath + "Join";
		}else{
			model.addAttribute("message", "잘못된 접근입니다.");
			model.addAttribute("cmmnScript", "/ft/join/join/agree.do");
		}
		return "cmmn/execute";
	}
	
	
	// 아이디 중복체크 
	@ResponseBody
	@RequestMapping(folderPath + "checkIdDup.do")
	public boolean checkIdDup(@ModelAttribute("searchVO") FtJoinVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		// 아이디 없음 
		if(cmmnService.selectContents(searchVO, PROGRAM_ID +".checkIdDup2" ) == null ){
			return true;
		// 아이디 있음  
		}else{
			return false;
		}
	}
	
	// 로그인 폼 
	@RequestMapping(folderPath + "loginForm.do")
	public String loginForm(@ModelAttribute("searchVO") FtJoinVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

		return ".fLayout:"+ folderPath + "loginForm";
	}
	
	// 로그인체크 
	@SuppressWarnings("unchecked")
	@RequestMapping(value = folderPath+ "loginCheck.do", method = RequestMethod.POST)
	public String loginProcess(@ModelAttribute("searchVO") FtJoinVO searchVO	, HttpServletRequest request	, ModelMap model	, SessionStatus status) throws Exception {
		
		if(searchVO.getFtId() != null && searchVO.getFtPwd() != null && !"".equals(searchVO.getFtId()) && !"".equals(searchVO.getFtPwd())){
			searchVO.setFtPwd(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getFtPwd().getBytes("UTF-8"))));
			
			 // 일치하는 아이디, 비번 확인 
			FtJoinVO userFtLoginVO  = (FtJoinVO)cmmnService.selectContents(searchVO, PROGRAM_ID);
			// 일치 회원 x 로그인 불가 
	    	if(userFtLoginVO == null || userFtLoginVO.getFtId() == null || "".equals(userFtLoginVO.getFtId())){ 
	    		
	    		model.addAttribute("message", "아이디 또는 패스워드를 확인하시기 바랍니다.");
	    		model.addAttribute("cmmnScript", "/ft/join/join/loginForm.do");
	    		return "cmmn/execute";
	    		
	    	}else{ // 로그인 
	    		 	/** 세션 정보 입력 */
					HttpSession session = request.getSession();					
					session.setAttribute(SessionUtil.SESSION_FRONT_KEY, userFtLoginVO);
					session.setAttribute("loginFtId", userFtLoginVO.getFtId());		 //사용자 아이디
					session.setAttribute("loginFtNm", userFtLoginVO.getFtName());	//사용자 이름
					session.setAttribute("loginFtSeq", userFtLoginVO.getFtSeq());	//사용자 일련번호
					model.addAttribute("message", "로그인합니다.");
					model.addAttribute("cmmnScript", "/ft/main.do");
					return "cmmn/execute";
		    }    	
	    	
		}else{
			model.addAttribute("message", "로그인정보가 넘어오지 않았습니다.");
			model.addAttribute("cmmnScript", "login");
			return "cmmn/execute";
		}
	}

	// 로그아웃 
		@RequestMapping(folderPath + "loginout.do")
		public String loginout(@ModelAttribute("searchVO") FtJoinVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
			
			HttpSession session = request.getSession();
			session.removeAttribute(SessionUtil.SESSION_FRONT_KEY);
			session.removeAttribute("loginFtId");
			session.removeAttribute("loginFtNm");
			session.removeAttribute("loginFtSeq");
			
			model.addAttribute("message", "로그아웃 되었습니다.");
    		model.addAttribute("cmmnScript", "/ft/main.do");
    		return "cmmn/execute";
		}
	
		// 아이디,비밀번호 찾기 폼  
		@RequestMapping(folderPath + "find.do")
		public String findForm(@ModelAttribute("searchVO") FtJoinVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

			return ".fLayout:"+ folderPath + "find";
		}
		
		// 아이디 찾기 
		@ResponseBody
		@RequestMapping(folderPath + "btnFindId.do")
		public String btnFindId(@ModelAttribute("searchVO") FtJoinVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
			// 아이디 있음
			if(cmmnService.selectContents(searchVO, PROGRAM_ID +".btnFindId2" ) != null ){
				FtJoinVO ftJoinVO = new FtJoinVO(); 
				ftJoinVO = (FtJoinVO) cmmnService.selectContents(searchVO, PROGRAM_ID +".btnFindId2");
				System.out.println(">>>>>>>>>>>>>>>::::::::::" + ftJoinVO.getFtId());
				return ftJoinVO.getFtId();
			// 아이디 없음  
			}else{
				return "";
			}
		}
	
		// 비밀번호 찾기 
		@ResponseBody
		@RequestMapping(folderPath + "btnFindPw.do")
		public Boolean btnFindPw(@ModelAttribute("searchVO") FtJoinVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
				// 회원정보 일치 - 비밀번호 입력 폼 
				if(cmmnService.selectContents(searchVO, PROGRAM_ID +".btnFindPw2" ) != null ){
					return true;
				// 불일치 
				}else{
					return false;
				}
		}
		
		// 비밀번호 수정 폼 
		@RequestMapping(folderPath + "pwUpdateForm.do")
		public String pwUpdateForm(@ModelAttribute("searchVO") FtJoinVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

			return ".fLayout:"+ folderPath + "pwUpdateForm";
		}
		// 마이페이지 - 비밀번호 확인 
		@RequestMapping(folderPath + "pwCheckForm.do")
		public String pwCheckForm(@ModelAttribute("searchVO") FtJoinVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

			return ".fLayout:"+ folderPath + "pwCheckForm";
		}
		
		
		// 마이페이지 폼 
		@RequestMapping(folderPath + "myPageForm.do")
		public String myPageForm(@ModelAttribute("searchVO") FtJoinVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("loginFtId");
			searchVO.setFtId(id);
			
			System.out.println(">>>>>>>>>>>>>" + searchVO.getFtId());
			FtJoinVO ftJoinVO = (FtJoinVO) cmmnService.selectContents(searchVO, PROGRAM_ID+".checkIdDup2");
			model.addAttribute("ftJoinVO", ftJoinVO);
			
			return ".fLayout:"+ folderPath + "myPageForm";
		}
		
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"view.do")
	public String view(@ModelAttribute("searchVO") FtJoinVO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		/* 게시판 상세정보 */
		FtJoinVO ftJoinVO = new FtJoinVO();
		ftJoinVO = (FtJoinVO) cmmnService.selectContents(searchVO, PROGRAM_ID );
		cmmnService.selectContents(searchVO, PROGRAM_ID +".viewCount");
		model.addAttribute("ftJoinVO", ftJoinVO);
		
		return ".mLayout:"+ folderPath + "view";
	}


	
	@RequestMapping(folderPath + "{procType}Form.do")
	public String form(@ModelAttribute("searchVO") FtJoinVO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		FtJoinVO ftJoinVO = new FtJoinVO();
		if (procType.equals("update")) {
			ftJoinVO = (FtJoinVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		}
		model.addAttribute("ftJoinVO", ftJoinVO);

		return ".mLayout:"+ folderPath + "form";
	}

	// 회원가입 
	@RequestMapping(value = folderPath + "{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") FtJoinVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		if(searchVO.getFtPwd() != null && !"".equals(searchVO.getFtPwd())){
			searchVO.setFtPwd(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getFtPwd().getBytes("UTF-8"))));
		}
		
		if(procType != null){
			
			if (procType.equals("insert")) {
				cmmnService.insertContents(searchVO, PROGRAM_ID);
				model.addAttribute("message", "회원가입 되었습니다.");
				model.addAttribute("cmmnScript", "loginForm.do");
				return "cmmn/execute";
				
			} else if (procType.equals("update") ) {		
				cmmnService.updateContents(searchVO, PROGRAM_ID);		
				model.addAttribute("message", "수정되었습니다.");
				model.addAttribute("pName", "ftSeq");	
				model.addAttribute("pValue", searchVO.getFtSeq());
				model.addAttribute("cmmnScript", "view.do");
				return "cmmn/execute";
				
			} else if (procType.equals("pwUpdate") ) {		
				cmmnService.updateContents(searchVO, PROGRAM_ID+".btnUpdatePw2");		
				model.addAttribute("message", "비밀번호가 수정되었습니다.");
				model.addAttribute("cmmnScript", "/ft/join/join/loginForm.do");
				return "cmmn/execute";
				
			} else if (procType.equals("pwCheck") ) {		
				if(cmmnService.selectContents(searchVO, PROGRAM_ID+".pwCheck2")!=null){		
					model.addAttribute("message", "비밀번호가 일치합니다.");
					model.addAttribute("cmmnScript", "/ft/join/join/myPageForm.do");
					return "cmmn/execute";
				}else{
					model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
					model.addAttribute("cmmnScript", "/ft/join/join/pwCheckForm.do");
					return "cmmn/execute";
				}
			} else if (procType.equals("myPageUpdate") ) {		
				System.out.println(">>>>>>>>>>"+ searchVO.getFtPwd());
				cmmnService.updateContents(searchVO, PROGRAM_ID+".myPageUpdate2");		
				model.addAttribute("message", "정보가 수정되었습니다.");
				model.addAttribute("cmmnScript", "/ft/main.do");
				return "cmmn/execute";
				
			}else{
				return "redirect:list.do";
			}
		}
		return "redirect:list.do";

	}

	

	
		

}
