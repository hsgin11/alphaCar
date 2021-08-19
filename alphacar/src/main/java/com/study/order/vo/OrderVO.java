package com.study.order.vo;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.study.prod.vo.OptionVO;

public class OrderVO {
	private int orderNo;
	private String userId;
	private String userMail;
	private String sellerId;
	private String orderAddress;
	private String orderAddressDetail;
	private String orderZipCode;
	private String orderDate;
	private int prodNo;
	private String prodName;
	private int prodQty;
	List<OptionVO> options;
	private int orderPrice;
	
	private String reviewY; //리뷰여부

	public String getReviewY() {
		return reviewY;
	}

	public void setReviewY(String reviewY) {
		this.reviewY = reviewY;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public String getOrderAddressDetail() {
		return orderAddressDetail;
	}

	public void setOrderAddressDetail(String orderAddressDetail) {
		this.orderAddressDetail = orderAddressDetail;
	}

	public String getOrderZipCode() {
		return orderZipCode;
	}

	public void setOrderZipCode(String orderZipCode) {
		this.orderZipCode = orderZipCode;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getProdQty() {
		return prodQty;
	}

	public void setProdQty(int prodQty) {
		this.prodQty = prodQty;
	}

	public List<OptionVO> getOptions() {
		return options;
	}

	public void setOptions(List<OptionVO> options) {
		this.options = options;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
	}

}
