package com.open.ft.main;

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
import org.springframework.web.bind.support.SessionStatus;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.model.FileVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.ma.banner.service.BannerVO;
import com.open.ma.free.service.FreeVO;
import com.open.ma.mainMa.service.MainMaVO;
import com.open.ma.notice.service.NoticeVO;
import com.open.ma.port.service.PortVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class MainController {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;
    
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Main";

    /** folderPath **/
    private final static String folderPath = "/ft/main/main/";
    
    // 메인 
    @SuppressWarnings("unchecked")
    @RequestMapping("/ft/main.do")
	public String main(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
    	
    	HttpSession session = request.getSession();
    	
    	// 메인관리 슬라이드 배너 + file VO
			MainMaVO mainMaVO = new MainMaVO();
			mainMaVO = (MainMaVO) cmmnService.selectContents(searchVO, "MainMa" );
			session.setAttribute("mainMaVO", mainMaVO);

			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId(mainMaVO.getMmAtchFileId());
			List<FileVO> mainFileSn = (List<FileVO>) fileMngService.selectFileInfs(fileVO); 
			session.setAttribute("mainFileSn", mainFileSn);
    	// 공지사항
			List<NoticeVO> noticeList = (List<NoticeVO>) cmmnService.selectList(searchVO, "Notice.mainNoticeSelectList");
			model.addAttribute("noticeList", noticeList);
    	// 배너 
			List<BannerVO> bannerList = (List<BannerVO>) cmmnService.selectList(searchVO, "Banner.mainBannerSelectList");
			model.addAttribute("bannerList", bannerList);
    	
		return  folderPath + "main";
	}

	
    @SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, String category,  ModelMap model, HttpServletRequest request) throws Exception {
    	searchVO.setSchEtc02(category);    
    	
		List<PortVO> portList = (List<PortVO>) cmmnService.selectList(searchVO, "Port.userMainSelectList");
		model.addAttribute("portList", portList);
		
		return  folderPath +"addList";
	}
    
    @RequestMapping(value = "/ft/fail.do")
	public String ftFail(@ModelAttribute("searchVO") CmmnDefaultVO searchVO ,ModelMap model) throws Exception {
		model.addAttribute("message", "로그인 후 이용해주세요.");
		model.addAttribute("cmmnScript", "/ft/join/join/loginForm.do");
		
		return "cmmn/execute";
	}	
}



