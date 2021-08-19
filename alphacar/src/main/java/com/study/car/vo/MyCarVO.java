package com.study.car.vo;

public class MyCarVO {
	
	private String carId;                   
	private String myCarName;               
	private String userId;
	private int myCarDistanceDriven;        /* 주행 거리 */
	
	
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public String getMyCarName() {
		return myCarName;
	}
	public void setMyCarName(String myCarName) {
		this.myCarName = myCarName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getMyCarDistanceDriven() {
		return myCarDistanceDriven;
	}
	public void setMyCarDistanceDriven(int myCarDistanceDriven) {
		this.myCarDistanceDriven = myCarDistanceDriven;
	}
	
	
	
}
