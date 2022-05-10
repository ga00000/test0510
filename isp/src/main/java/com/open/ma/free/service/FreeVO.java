package com.open.ma.free.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;


@Alias("freeVO")
public class FreeVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String feSeq;
	private String feGroupSeq;
	private String feTitle;
	private String feCont;
	private String feRgstDt;
	private String feRgstId;
	private String feRvseDt;
	private String feRvseId;
	private String feUseYn;
	private String feAtchFileId;
	private String feView;
	private String reCont;
	private String reRgstDt;
	private String reRgstId;
	
	
	
	public String getFeGroupSeq() {
		return feGroupSeq;
	}
	public void setFeGroupSeq(String feGroupSeq) {
		this.feGroupSeq = feGroupSeq;
	}
	public String getReCont() {
		return reCont;
	}
	public void setReCont(String reCont) {
		this.reCont = reCont;
	}
	public String getReRgstDt() {
		return reRgstDt;
	}
	public void setReRgstDt(String reRgstDt) {
		this.reRgstDt = reRgstDt;
	}
	public String getReRgstId() {
		return reRgstId;
	}
	public void setReRgstId(String reRgstId) {
		this.reRgstId = reRgstId;
	}
	public String getFeSeq() {
		return feSeq;
	}
	public void setFeSeq(String feSeq) {
		this.feSeq = feSeq;
	}
	public String getFeTitle() {
		return feTitle;
	}
	public void setFeTitle(String feTitle) {
		this.feTitle = feTitle;
	}
	public String getFeCont() {
		return feCont;
	}
	public void setFeCont(String feCont) {
		this.feCont = feCont;
	}
	public String getFeRgstDt() {
		return feRgstDt;
	}
	public void setFeRgstDt(String feRgstDt) {
		this.feRgstDt = feRgstDt;
	}
	public String getFeRgstId() {
		return feRgstId;
	}
	public void setFeRgstId(String feRgstId) {
		this.feRgstId = feRgstId;
	}
	public String getFeRvseDt() {
		return feRvseDt;
	}
	public void setFeRvseDt(String feRvseDt) {
		this.feRvseDt = feRvseDt;
	}
	public String getFeRvseId() {
		return feRvseId;
	}
	public void setFeRvseId(String feRvseId) {
		this.feRvseId = feRvseId;
	}
	public String getFeUseYn() {
		return feUseYn;
	}
	public void setFeUseYn(String feUseYn) {
		this.feUseYn = feUseYn;
	}
	public String getFeAtchFileId() {
		return feAtchFileId;
	}
	public void setFeAtchFileId(String feAtchFileId) {
		this.feAtchFileId = feAtchFileId;
	}
	public String getFeView() {
		return feView;
	}
	public void setFeView(String feView) {
		this.feView = feView;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}