package com.study.board.infoboard.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class InfoBoardVO {
	
	private String infoBoardNo;             
	private String infoBoardTitle;          
	private String infoBoardWriter;         
	private String infoBoardContent;        
	private String infoBoardRegDate;
	private String infoBoardWriterId;
	private String infoNoticeYn;
	private String infoBoardHit; // 조회수
	
	public String getInfoBoardWriterId() {
		return infoBoardWriterId;
	}
	public void setInfoBoardWriterId(String infoBoardWriterId) {
		this.infoBoardWriterId = infoBoardWriterId;
	}
	public String getInfoBoardHit() {
		return infoBoardHit;
	}
	public void setInfoBoardHit(String infoBoardHit) {
		this.infoBoardHit = infoBoardHit;
	}
	public String getInfoBoardNo() {
		return infoBoardNo;
	}
	public void setInfoBoardNo(String infoBoardNo) {
		this.infoBoardNo = infoBoardNo;
	}
	public String getInfoBoardTitle() {
		return infoBoardTitle;
	}
	public void setInfoBoardTitle(String infoBoardTitle) {
		this.infoBoardTitle = infoBoardTitle;
	}
	public String getInfoBoardWriter() {
		return infoBoardWriter;
	}
	public void setInfoBoardWriter(String infoBoardWriter) {
		this.infoBoardWriter = infoBoardWriter;
	}
	public String getInfoBoardContent() {
		return infoBoardContent;
	}
	public void setInfoBoardContent(String infoBoardContent) {
		this.infoBoardContent = infoBoardContent;
	}
	public String getInfoBoardRegDate() {
		return infoBoardRegDate;
	}
	public void setInfoBoardRegDate(String infoBoardRegDate) {
		this.infoBoardRegDate = infoBoardRegDate;
	}
	public String getInfoNoticeYn() {
		return infoNoticeYn;
	}
	public void setInfoNoticeYn(String infoNoticeYn) {
		this.infoNoticeYn = infoNoticeYn;
	}
	      
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
	
	
}
