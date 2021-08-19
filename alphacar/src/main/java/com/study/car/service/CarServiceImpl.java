package com.study.car.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.car.dao.ICarDao;
import com.study.car.vo.CarCodeVO;
import com.study.car.vo.CarVO;
import com.study.car.vo.MyCarVO;
@Service
public class CarServiceImpl implements ICarService {
	@Inject
	ICarDao carDao;
	@Override
	public List<CarVO> getCarList(String carFacCd) {
		return carDao.getCarList(carFacCd);
	}
	@Override
	public List<CarCodeVO> getCarFacList() {
		return carDao.getCarFacList();
	}
	@Override
	public void myCarRegist(Map<String, String> myCar) {
		carDao.insertMyCar(myCar);
	}
	@Override
	public CarVO getCar(String carId) {
		return carDao.getCar(carId);
	}
	@Override
	public MyCarVO getMyCar(String userId) {
		return carDao.getMyCar(userId);
	}
	@Override
	public void myCarUpdate(MyCarVO myCar) {
		carDao.updateMyCar(myCar);
		
	}
	@Override
	public CarVO getCarByName(String carName) {
		return carDao.getCarByName(carName);
	}

}
