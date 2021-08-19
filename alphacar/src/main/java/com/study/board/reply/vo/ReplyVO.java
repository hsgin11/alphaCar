package com.study.board.reply.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@SuppressWarnings("serial")
public class ReplyVO implements Serializable{
	private int reNo;                  
	private String reCategory;         
	private String reParentNo;         
	private String reMemId;            
	private String reMemName;            
	private String reContent;          
	private String reRegDate;
	public int getReNo() {
		return reNo;
	}
	public void setReNo(int reNo) {
		this.reNo = reNo;
	}
	public String getReCategory() {
		return reCategory;
	}
	public void setReCategory(String reCategory) {
		this.reCategory = reCategory;
	}
	public String getReParentNo() {
		return reParentNo;
	}
	public void setReParentNo(String reParentNo) {
		this.reParentNo = reParentNo;
	}
	public String getReMemId() {
		return reMemId;
	}
	public void setReMemId(String reMemId) {
		this.reMemId = reMemId;
	}
	
	public String getReMemName() {
		return reMemName;
	}
	public void setReMemName(String reMemName) {
		this.reMemName = reMemName;
	}
	public String getReContent() {
		return reContent;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	public String getReRegDate() {
		return reRegDate;
	}
	public void setReRegDate(String reRegDate) {
		this.reRegDate = reRegDate;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
}
