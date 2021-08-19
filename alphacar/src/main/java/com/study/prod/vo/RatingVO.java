package com.study.prod.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class RatingVO {
	private int prodNo;                
	private int rating;                
	private String prodComment;        
	private String userId;
	
	@Override
	public String toString() {

		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getProdComment() {
		return prodComment;
	}
	public void setProdComment(String prodComment) {
		this.prodComment = prodComment;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}    
	
}
