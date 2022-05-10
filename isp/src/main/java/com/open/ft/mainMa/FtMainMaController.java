package com.open.ft.mainMa;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.ma.mainMa.service.MainMaVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class FtMainMaController {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;
    
	
    /** Program ID **/
    private final static String PROGRAM_ID = "MainMa";

    /** folderPath **/
    private final static String folderPath = "/ft/main/mai/";

	

	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"form.do")
	public String view(@ModelAttribute("searchVO") MainMaVO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		/* 게시판 상세정보 */
		MainMaVO mainMaVO = new MainMaVO();
		mainMaVO = (MainMaVO) cmmnService.selectContents(searchVO, PROGRAM_ID );
		model.addAttribute("mainMaVO", mainMaVO);
		
		return ".mLayout:"+ folderPath + "form";
	}


	
	@RequestMapping(folderPath + "{procType}Form.do")
	public String form(@ModelAttribute("searchVO") MainMaVO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		MainMaVO mainMaVO = new MainMaVO();
		if (procType.equals("update")) {
			mainMaVO = (MainMaVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		}
		model.addAttribute("mainMaVO", mainMaVO);

		return ".mLayout:"+ folderPath + "form";
	}

	
	@RequestMapping(value = folderPath + "{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") MainMaVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		
		if(procType != null){
			
			if (procType.equals("insert")) {
				cmmnService.insertContents(searchVO, PROGRAM_ID);
				model.addAttribute("message", "등록되었습니다.");
				model.addAttribute("cmmnScript", "form.do");
				return "cmmn/execute";
				
			} else if (procType.equals("update") ) {				
				cmmnService.updateContents(searchVO, PROGRAM_ID);		
				model.addAttribute("message", "수정되었습니다.");
				model.addAttribute("pName", "mmSeq");	
				model.addAttribute("pValue", searchVO.getMmSeq());
				model.addAttribute("cmmnScript", "form.do");
				return "cmmn/execute";
				
			}else{
				return "redirect:list.do";
			}
		}
		return "redirect:list.do";

	}

	

	
		

}
