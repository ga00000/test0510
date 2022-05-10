package com.open.ma.mainMa.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;


@Alias("mainMaVO")
public class MainMaVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	private String mmSeq;
	private String mmTitle;
	private String mmCont;
	private String mmRgstDt;
	private String mmRgstId;
	private String mmRvseDt;
	private String mmRvseId;
	private String mmUseYn;
	private String mmAtchFileId;
	private String mmRepresent;
	private String mmAddress;
	private String mmOpNum;
	private String mmNum;
	private String mmFax;
	private String mmEmail;


	public String getMmSeq() {
		return mmSeq;
	}
	public void setMmSeq(String mmSeq) {
		this.mmSeq = mmSeq;
	}
	public String getMmTitle() {
		return mmTitle;
	}
	public void setMmTitle(String mmTitle) {
		this.mmTitle = mmTitle;
	}
	public String getMmCont() {
		return mmCont;
	}
	public void setMmCont(String mmCont) {
		this.mmCont = mmCont;
	}
	public String getMmRgstDt() {
		return mmRgstDt;
	}
	public void setMmRgstDt(String mmRgstDt) {
		this.mmRgstDt = mmRgstDt;
	}
	public String getMmRgstId() {
		return mmRgstId;
	}
	public void setMmRgstId(String mmRgstId) {
		this.mmRgstId = mmRgstId;
	}
	public String getMmRvseDt() {
		return mmRvseDt;
	}
	public void setMmRvseDt(String mmRvseDt) {
		this.mmRvseDt = mmRvseDt;
	}
	public String getMmRvseId() {
		return mmRvseId;
	}
	public void setMmRvseId(String mmRvseId) {
		this.mmRvseId = mmRvseId;
	}
	public String getMmUseYn() {
		return mmUseYn;
	}
	public void setMmUseYn(String mmUseYn) {
		this.mmUseYn = mmUseYn;
	}
	public String getMmAtchFileId() {
		return mmAtchFileId;
	}
	public void setMmAtchFileId(String mmAtchFileId) {
		this.mmAtchFileId = mmAtchFileId;
	}
	public String getMmRepresent() {
		return mmRepresent;
	}
	public void setMmRepresent(String mmRepresent) {
		this.mmRepresent = mmRepresent;
	}
	public String getMmAddress() {
		return mmAddress;
	}
	public void setMmAddress(String mmAddress) {
		this.mmAddress = mmAddress;
	}
	public String getMmOpNum() {
		return mmOpNum;
	}
	public void setMmOpNum(String mmOpNum) {
		this.mmOpNum = mmOpNum;
	}
	public String getMmNum() {
		return mmNum;
	}
	public void setMmNum(String mmNum) {
		this.mmNum = mmNum;
	}
	public String getMmFax() {
		return mmFax;
	}
	public void setMmFax(String mmFax) {
		this.mmFax = mmFax;
	}
	public String getMmEmail() {
		return mmEmail;
	}
	public void setMmEmail(String mmEmail) {
		this.mmEmail = mmEmail;
	}
	
	
	
	
	
	
	
}