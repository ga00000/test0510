package com.open.ma.banner.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;


@Alias("bannerVO")
public class BannerVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String baSeq;
	private String baTitle;
	private String baCont;
	private String baRgstDt;
	private String baRgstId;
	private String baRvseDt;
	private String baRvseId;
	private String baUseYn;
	private String baAtchFileId;
	private String baView;
	private String baWindowYn;
	
	
	public String getBaSeq() {
		return baSeq;
	}


	public void setBaSeq(String baSeq) {
		this.baSeq = baSeq;
	}


	public String getBaTitle() {
		return baTitle;
	}


	public void setBaTitle(String baTitle) {
		this.baTitle = baTitle;
	}


	public String getBaCont() {
		return baCont;
	}


	public void setBaCont(String baCont) {
		this.baCont = baCont;
	}


	public String getBaRgstDt() {
		return baRgstDt;
	}


	public void setBaRgstDt(String baRgstDt) {
		this.baRgstDt = baRgstDt;
	}


	public String getBaRgstId() {
		return baRgstId;
	}


	public void setBaRgstId(String baRgstId) {
		this.baRgstId = baRgstId;
	}


	public String getBaRvseDt() {
		return baRvseDt;
	}


	public void setBaRvseDt(String baRvseDt) {
		this.baRvseDt = baRvseDt;
	}


	public String getBaRvseId() {
		return baRvseId;
	}


	public void setBaRvseId(String baRvseId) {
		this.baRvseId = baRvseId;
	}


	public String getBaUseYn() {
		return baUseYn;
	}


	public void setBaUseYn(String baUseYn) {
		this.baUseYn = baUseYn;
	}


	public String getBaAtchFileId() {
		return baAtchFileId;
	}


	public void setBaAtchFileId(String baAtchFileId) {
		this.baAtchFileId = baAtchFileId;
	}


	public String getBaView() {
		return baView;
	}


	public void setBaView(String baView) {
		this.baView = baView;
	}


	public String getBaWindowYn() {
		return baWindowYn;
	}


	public void setBaWindowYn(String baWindowYn) {
		this.baWindowYn = baWindowYn;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}