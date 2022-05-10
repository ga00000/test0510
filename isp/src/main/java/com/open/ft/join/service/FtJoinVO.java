package com.open.ft.join.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;


@Alias("ftJoinVO")
public class FtJoinVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	private String ftSeq;
	private String ftId;
	private String ftPwd;
	private String ftName;
	private String ftUseYn;
	private String ftRgstId;
	private String ftRgstDt;
	private String ftEmail;
	private String ftTel;
	private String ftHp;
	private String ftAtchFileId;
	private String ftRvseId;
	private String ftRvseDt;


	public String getFtSeq() {
		return ftSeq;
	}
	public void setFtSeq(String ftSeq) {
		this.ftSeq = ftSeq;
	}
	public String getFtId() {
		return ftId;
	}
	public void setFtId(String ftId) {
		this.ftId = ftId;
	}
	public String getFtPwd() {
		return ftPwd;
	}
	public void setFtPwd(String ftPwd) {
		this.ftPwd = ftPwd;
	}
	public String getFtName() {
		return ftName;
	}
	public void setFtName(String ftName) {
		this.ftName = ftName;
	}
	public String getFtUseYn() {
		return ftUseYn;
	}
	public void setFtUseYn(String ftUseYn) {
		this.ftUseYn = ftUseYn;
	}
	public String getFtRgstId() {
		return ftRgstId;
	}
	public void setFtRgstId(String ftRgstId) {
		this.ftRgstId = ftRgstId;
	}
	public String getFtRgstDt() {
		return ftRgstDt;
	}
	public void setFtRgstDt(String ftRgstDt) {
		this.ftRgstDt = ftRgstDt;
	}
	public String getFtEmail() {
		return ftEmail;
	}
	public void setFtEmail(String ftEmail) {
		this.ftEmail = ftEmail;
	}
	public String getFtTel() {
		return ftTel;
	}
	public void setFtTel(String ftTel) {
		this.ftTel = ftTel;
	}
	public String getFtHp() {
		return ftHp;
	}
	public void setFtHp(String ftHp) {
		this.ftHp = ftHp;
	}
	public String getFtAtchFileId() {
		return ftAtchFileId;
	}
	public void setFtAtchFileId(String ftAtchFileId) {
		this.ftAtchFileId = ftAtchFileId;
	}
	public String getFtRvseId() {
		return ftRvseId;
	}
	public void setFtRvseId(String ftRvseId) {
		this.ftRvseId = ftRvseId;
	}
	public String getFtRvseDt() {
		return ftRvseDt;
	}
	public void setFtRvseDt(String ftRvseDt) {
		this.ftRvseDt = ftRvseDt;
	}
	
	
	
}