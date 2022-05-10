package com.open.ma.port.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;


@Alias("portVO")
public class PortVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	private String ptSeq;
	private String ptTitle;
	private String ptCont;
	private String ptRgstDt;
	private String ptRgstId;
	private String ptRvseDt;
	private String ptRvseId;
	private String ptUseYn;
	private String ptAtchFileId;
	private String ptView;
	private String ptSelect;


	public String getPtSeq() {
		return ptSeq;
	}
	public void setPtSeq(String ptSeq) {
		this.ptSeq = ptSeq;
	}
	public String getPtTitle() {
		return ptTitle;
	}
	public void setPtTitle(String ptTitle) {
		this.ptTitle = ptTitle;
	}
	public String getPtCont() {
		return ptCont;
	}
	public void setPtCont(String ptCont) {
		this.ptCont = ptCont;
	}
	public String getPtRgstDt() {
		return ptRgstDt;
	}
	public void setPtRgstDt(String ptRgstDt) {
		this.ptRgstDt = ptRgstDt;
	}
	public String getPtRgstId() {
		return ptRgstId;
	}
	public void setPtRgstId(String ptRgstId) {
		this.ptRgstId = ptRgstId;
	}
	public String getPtRvseDt() {
		return ptRvseDt;
	}
	public void setPtRvseDt(String ptRvseDt) {
		this.ptRvseDt = ptRvseDt;
	}
	public String getPtRvseId() {
		return ptRvseId;
	}
	public void setPtRvseId(String ptRvseId) {
		this.ptRvseId = ptRvseId;
	}
	public String getPtUseYn() {
		return ptUseYn;
	}
	public void setPtUseYn(String ptUseYn) {
		this.ptUseYn = ptUseYn;
	}
	public String getPtAtchFileId() {
		return ptAtchFileId;
	}
	public void setPtAtchFileId(String ptAtchFileId) {
		this.ptAtchFileId = ptAtchFileId;
	}
	public String getPtView() {
		return ptView;
	}
	public void setPtView(String ptView) {
		this.ptView = ptView;
	}
	public String getPtSelect() {
		return ptSelect;
	}
	public void setPtSelect(String ptSelect) {
		this.ptSelect = ptSelect;
	}
	
	
	
	
}