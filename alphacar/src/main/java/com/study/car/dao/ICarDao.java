package com.study.car.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.study.car.vo.CarCodeVO;
import com.study.car.vo.CarVO;
import com.study.car.vo.MyCarVO;

@Mapper
public interface ICarDao {
	
	public int getCarCount();
	public List<CarVO> getCarList(String carFacCd); 
	public CarVO getCar(String carId);
	public List<CarCodeVO> getCarFacList();
	public int insertMyCar(Map<String, String>myCar);
	public int updateMyCar(MyCarVO myCar);
	public MyCarVO getMyCar(String userId);
	public CarVO getCarByName(String carName);
}
