package com.study.car.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.study.car.service.ICarService;
import com.study.car.vo.CarVO;
import com.study.car.vo.MyCarVO;
import com.study.user.vo.UserVO;

@RestController
public class CarController {

	@Inject
	ICarService carService;
	
	
	// 상위차량에 따른 하위차량 목록 리스트 반환  
	@RequestMapping(value = "/carlist", produces = "application/json;charset=UTF-8")
	public Map<String, Object> getCarList(String carFacCd, HttpServletRequest req, HttpSession session){
		List<CarVO> carList = carService.getCarList(carFacCd);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", carList);
		map.put("count", carList.size());
		return map;
	}
	
	// 사용자가 차량변경을 선택한 경우 정보 저장 
	@RequestMapping(value = "/carUpdate", produces = "application/json;charset=UTF-8")
	public Map<String, Object> updateCarList(MyCarVO myCar, HttpSession session){
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			UserVO user = (UserVO)session.getAttribute("USER_INFO");		
			myCar.setUserId(user.getUserId());
			carService.myCarUpdate(myCar);
			map.put("result", true);
			session.setAttribute("CAR_INFO", carService.getCar(myCar.getCarId()));
			return map;
		} catch (Exception e) {			
			e.printStackTrace();
			map.put("result", false);
			return map;
		}
	}
	
}
