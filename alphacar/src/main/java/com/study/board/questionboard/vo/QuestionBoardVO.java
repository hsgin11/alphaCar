package com.study.board.questionboard.vo;

public class QuestionBoardVO {
	private String questionBoardNo;    
	private String questionBoardTitle; 
	private String questionBoardWriter;
	private String questionBoardContent;
	private String questionBoardRegDate;
	private String questionBoardWriterId;
	private int questionBoardHit;
	private String questionNoticeYn;
	
	
	public String getQuestionBoardWriterId() {
		return questionBoardWriterId;
	}
	public void setQuestionBoardWriterId(String questionBoardWriterId) {
		this.questionBoardWriterId = questionBoardWriterId;
	}
	public int getQuestionBoardHit() {
		return questionBoardHit;
	}
	public void setQuestionBoardHit(int questionBoardHit) {
		this.questionBoardHit = questionBoardHit;
	}
	public String getQuestionBoardNo() {
		return questionBoardNo;
	}
	public void setQuestionBoardNo(String questionBoardNo) {
		this.questionBoardNo = questionBoardNo;
	}
	public String getQuestionBoardTitle() {
		return questionBoardTitle;
	}
	public void setQuestionBoardTitle(String questionBoardTitle) {
		this.questionBoardTitle = questionBoardTitle;
	}
	public String getQuestionBoardWriter() {
		return questionBoardWriter;
	}
	public void setQuestionBoardWriter(String questionBoardWriter) {
		this.questionBoardWriter = questionBoardWriter;
	}
	public String getQuestionBoardContent() {
		return questionBoardContent;
	}
	public void setQuestionBoardContent(String questionBoardContent) {
		this.questionBoardContent = questionBoardContent;
	}
	public String getQuestionBoardRegDate() {
		return questionBoardRegDate;
	}
	public void setQuestionBoardRegDate(String questionBoardRegDate) {
		this.questionBoardRegDate = questionBoardRegDate;
	}
	public String getQuestionNoticeYn() {
		return questionNoticeYn;
	}
	public void setQuestionNoticeYn(String questionNoticeYn) {
		this.questionNoticeYn = questionNoticeYn;
	}
	
	
	
}
