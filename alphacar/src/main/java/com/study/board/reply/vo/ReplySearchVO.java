package com.study.board.reply.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.study.common.vo.PagingVO;

public class ReplySearchVO extends PagingVO{
	// 검색을 하지 않고, 10개씩 페이징해서 보여주기만 한다.
	
	
	private String reCategory;
	private String reParentNo;
	
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
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
	}
	

}
