package com.open.ft.port;

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
import com.open.cmmn.model.FileVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.ma.port.service.PortVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class FtPortController {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;
    
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Port";

    /** folderPath **/
    private final static String folderPath = "/ft/port/";

	
	@RequestMapping(folderPath + "{procType}/list.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, @PathVariable String procType, ModelMap model, HttpServletRequest request) throws Exception {

		return ".fLayout:"+ folderPath + "port/list";
	}
	
	
	@SuppressWarnings("deprecation")
	@RequestMapping("/ft/port/{procType}/addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, @PathVariable String procType, ModelMap model, HttpServletRequest request) throws Exception {
		
		if(procType.equals("case")){
			searchVO.setSchEtc02("case");
		}if(procType.equals("design")){
			searchVO.setSchEtc02("design");
		}if(procType.equals("place")){
			searchVO.setSchEtc02("place");
		}if(procType.equals("interior")){
			searchVO.setSchEtc02("interior");
		}
		searchVO.setPageSize(10);
		searchVO.setPageUnit(10);

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID+".userSelectCount");
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		

		@SuppressWarnings("unchecked")
		List<PortVO> resultList = (List<PortVO>) cmmnService.selectList(searchVO, PROGRAM_ID+".userSelectList");
		model.addAttribute("resultList", resultList);
		
		return  "/ft/port/port/addList";
	}


	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"{procType}/view.do")
	public String view(@ModelAttribute("searchVO") PortVO searchVO, Model model, @PathVariable String procType, HttpServletRequest request) throws Exception {
		
		if(procType.equals("case")){
			searchVO.setSchEtc02("case");
		}if(procType.equals("design")){
			searchVO.setSchEtc02("design");
		}if(procType.equals("place")){
			searchVO.setSchEtc02("place");
		}if(procType.equals("interior")){
			searchVO.setSchEtc02("interior");
		}
		/* 게시판 상세정보 */
		PortVO portVO = new PortVO();
		portVO = (PortVO) cmmnService.selectContents(searchVO, PROGRAM_ID +".userSelectContents");
		model.addAttribute("portVO", portVO);
		
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(portVO.getPtAtchFileId());
		List<FileVO> fileSn = (List<FileVO>) fileMngService.selectFileInfs(fileVO); 
		model.addAttribute("fileSn", fileSn);
		
		
		return ".fLayout:"+ folderPath + "port/view";
		
	}


	
	@RequestMapping(folderPath + "{procType}Form.do")
	public String form(@ModelAttribute("searchVO") PortVO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		PortVO portVO = new PortVO();
		if (procType.equals("update")) {
			portVO = (PortVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		}
		model.addAttribute("portVO", portVO);

		return ".fLayout:"+ folderPath + "form";
	}

	
	@RequestMapping(value = folderPath + "{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") PortVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		
		if(procType != null){
			
			if (procType.equals("insert")) {
				cmmnService.insertContents(searchVO, PROGRAM_ID);
				model.addAttribute("message", "등록되었습니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
				
			} else if (procType.equals("update") ) {				
				cmmnService.updateContents(searchVO, PROGRAM_ID);		
				model.addAttribute("message", "수정되었습니다.");
				model.addAttribute("pName", "ptSeq");	
				model.addAttribute("pValue", searchVO.getPtSeq());
				model.addAttribute("cmmnScript", "view.do");
				return "cmmn/execute";
				
			} else if (procType.equals("delete")) {				
				cmmnService.deleteContents(searchVO, PROGRAM_ID);
				model.addAttribute("message", "삭제되었습니다..");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
				
			}else{
				return "redirect:list.do";
			}
		}
		return "redirect:list.do";

	}

	

	
		

}
