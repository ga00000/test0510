package com.open.ma.require.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;


@Alias("requireVO")
public class RequireVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	private String reSeq;
	private String reTitle;
	private String reCont;
	private String reRgstDt;
	private String reRgstId;
	private String reRvseDt;
	private String reRvseId;
	private String reUseYn;
	private String reAtchFileId;
	private String reView;
	private String maCont;
	private String maRgstDt;
	private String maRgstId;
	private String reSelect;
	private String reSecretYn;
	private String rePwd;


	public String getReSeq() {
		return reSeq;
	}
	public void setReSeq(String reSeq) {
		this.reSeq = reSeq;
	}
	public String getReTitle() {
		return reTitle;
	}
	public void setReTitle(String reTitle) {
		this.reTitle = reTitle;
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
	public String getReRvseDt() {
		return reRvseDt;
	}
	public void setReRvseDt(String reRvseDt) {
		this.reRvseDt = reRvseDt;
	}
	public String getReRvseId() {
		return reRvseId;
	}
	public void setReRvseId(String reRvseId) {
		this.reRvseId = reRvseId;
	}
	public String getReUseYn() {
		return reUseYn;
	}
	public void setReUseYn(String reUseYn) {
		this.reUseYn = reUseYn;
	}
	public String getReAtchFileId() {
		return reAtchFileId;
	}
	public void setReAtchFileId(String reAtchFileId) {
		this.reAtchFileId = reAtchFileId;
	}
	public String getReView() {
		return reView;
	}
	public void setReView(String reView) {
		this.reView = reView;
	}
	public String getMaCont() {
		return maCont;
	}
	public void setMaCont(String maCont) {
		this.maCont = maCont;
	}
	public String getMaRgstDt() {
		return maRgstDt;
	}
	public void setMaRgstDt(String maRgstDt) {
		this.maRgstDt = maRgstDt;
	}
	public String getMaRgstId() {
		return maRgstId;
	}
	public void setMaRgstId(String maRgstId) {
		this.maRgstId = maRgstId;
	}
	public String getReSelect() {
		return reSelect;
	}
	public void setReSelect(String reSelect) {
		this.reSelect = reSelect;
	}
	public String getReSecretYn() {
		return reSecretYn;
	}
	public void setReSecretYn(String reSecretYn) {
		this.reSecretYn = reSecretYn;
	}
	public String getRePwd() {
		return rePwd;
	}
	public void setRePwd(String rePwd) {
		this.rePwd = rePwd;
	}
	
	
	
	
}