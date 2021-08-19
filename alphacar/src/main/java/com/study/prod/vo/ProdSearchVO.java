package com.study.prod.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.study.common.vo.ProdPagingVO;

public class ProdSearchVO extends ProdPagingVO{

	
	private String searchCategory;
	private String searchWord;
	
	
	//판매자조회전용
	             
	private String prodSeller;              
	
	

	public String getProdSeller() {
		return prodSeller;
	}
	public void setProdSeller(String prodSeller) {
		this.prodSeller = prodSeller;
	}
	public String getSearchCategory() {
		return searchCategory;
	}
	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}
	
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
}
