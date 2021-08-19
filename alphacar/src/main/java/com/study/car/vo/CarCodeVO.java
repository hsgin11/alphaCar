package com.study.car.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CarCodeVO {
	private String carFacturerCd;      
	private String carFacturerNm;
	public String getCarFacturerCd() {
		return carFacturerCd;
	}
	public void setCarFacturerCd(String carFacturerCd) {
		this.carFacturerCd = carFacturerCd;
	}
	public String getCarFacturerNm() {
		return carFacturerNm;
	}
	public void setCarFacturerNm(String carFacturerNm) {
		this.carFacturerNm = carFacturerNm;
	}      
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
	}
}
