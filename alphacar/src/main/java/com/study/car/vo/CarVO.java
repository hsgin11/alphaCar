package com.study.car.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CarVO {
	
	private String carId;                   
	private String carName;                 
	private String carFacturer;             
	private String carType;                 
	private String carImageUrl;
	
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCarFacturer() {
		return carFacturer;
	}
	public void setCarFacturer(String carFacturer) {
		this.carFacturer = carFacturer;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
	}
	public String getCarImageUrl() {
		return carImageUrl;
	}
	public void setCarImageUrl(String carImageUrl) {
		this.carImageUrl = carImageUrl;
	}             
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.SIMPLE_STYLE);
	}
	
}
