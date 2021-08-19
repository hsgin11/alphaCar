package com.study.car.service;

import java.util.List;
import java.util.Map;


import com.study.car.vo.CarCodeVO;
import com.study.car.vo.CarVO;
import com.study.car.vo.MyCarVO;

public interface ICarService {
	public List<CarVO> getCarList(String carFacCd);
	public CarVO getCar(String carId);
	public MyCarVO getMyCar(String userId);
	public List<CarCodeVO> getCarFacList();
	public void myCarRegist(Map<String, String> myCar); 
	public void myCarUpdate(MyCarVO myCar);
	public CarVO getCarByName(String carName);
	
	
}
