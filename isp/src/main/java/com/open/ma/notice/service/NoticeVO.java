package com.open.ma.notice.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;


@Alias("noticeVO")
public class NoticeVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	private String ntSeq;
	private String ntTitle;
	private String ntCont;
	private String ntRgstDt;
	private String ntRgstId;
	private String ntRvseDt;
	private String ntRvseId;
	private String ntUseYn;
	private String ntAtchFileId;
	private String ntView;
	private String ntNoticeYn;
	private String ntStart;
	private String ntEnd;
	private String noticeNormal;


	public String getNoticeNormal() {
		return noticeNormal;
	}
	public void setNoticeNormal(String noticeNormal) {
		this.noticeNormal = noticeNormal;
	}
	public String getNtSeq() {
		return ntSeq;
	}
	public void setNtSeq(String ntSeq) {
		this.ntSeq = ntSeq;
	}
	public String getNtTitle() {
		return ntTitle;
	}
	public void setNtTitle(String ntTitle) {
		this.ntTitle = ntTitle;
	}
	public String getNtCont() {
		return ntCont;
	}
	public void setNtCont(String ntCont) {
		this.ntCont = ntCont;
	}
	public String getNtRgstDt() {
		return ntRgstDt;
	}
	public void setNtRgstDt(String ntRgstDt) {
		this.ntRgstDt = ntRgstDt;
	}
	public String getNtRgstId() {
		return ntRgstId;
	}
	public void setNtRgstId(String ntRgstId) {
		this.ntRgstId = ntRgstId;
	}
	public String getNtRvseDt() {
		return ntRvseDt;
	}
	public void setNtRvseDt(String ntRvseDt) {
		this.ntRvseDt = ntRvseDt;
	}
	public String getNtRvseId() {
		return ntRvseId;
	}
	public void setNtRvseId(String ntRvseId) {
		this.ntRvseId = ntRvseId;
	}
	public String getNtUseYn() {
		return ntUseYn;
	}
	public void setNtUseYn(String ntUseYn) {
		this.ntUseYn = ntUseYn;
	}
	public String getNtAtchFileId() {
		return ntAtchFileId;
	}
	public void setNtAtchFileId(String ntAtchFileId) {
		this.ntAtchFileId = ntAtchFileId;
	}
	public String getNtView() {
		return ntView;
	}
	public void setNtView(String ntView) {
		this.ntView = ntView;
	}
	public String getNtNoticeYn() {
		return ntNoticeYn;
	}
	public void setNtNoticeYn(String ntNoticeYn) {
		this.ntNoticeYn = ntNoticeYn;
	}
	public String getNtStart() {
		return ntStart;
	}
	public void setNtStart(String ntStart) {
		this.ntStart = ntStart;
	}
	public String getNtEnd() {
		return ntEnd;
	}
	public void setNtEnd(String ntEnd) {
		this.ntEnd = ntEnd;
	}
	
	
	
	
	
}