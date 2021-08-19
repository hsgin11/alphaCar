package com.study.prod.vo;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ProdVO {
	
	private String prodFileName;            
	private String prodName;                
	private int prodPrice;                  
	private String prodSeller;              
	private int prodNo;                     
	private String prodCategory;
	
	private List<OptionVO> options;
	
	//별점관련
	private String userId;
	private int rating;
	private String prodComment;
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public List<OptionVO> getOptions() {
		return options;
	}
	public void setOptions(List<OptionVO> options) {
		this.options = options;
	}
	public String getProdFileName() {
		return prodFileName;
	}
	public void setProdFileName(String prodFileName) {
		this.prodFileName = prodFileName;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}
	public String getProdSeller() {
		return prodSeller;
	}
	public void setProdSeller(String prodSeller) {
		this.prodSeller = prodSeller;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public String getProdCategory() {
		return prodCategory;
	}
	public void setProdCategory(String prodCategory) {
		this.prodCategory = prodCategory;
	}            
	
	
	
}
