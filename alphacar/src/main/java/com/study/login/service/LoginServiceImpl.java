package com.study.login.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.user.dao.IUserDao;
import com.study.user.vo.UserVO;


@Service
public class LoginServiceImpl implements ILoginService{

	@Inject
	IUserDao userDao;
	
	
	@Override
	public UserVO loginCheck(String id, String pw) throws BizNotFoundException, BizPasswordNotMatchedException {
		
		UserVO user = userDao.getUser(id);
		if(user == null) {
			throw new BizNotFoundException("ID가 맞지않습니다.");
		}else {
			if(user.getUserPassword().equals(pw)) {
				return user;
			}else {
				throw new BizPasswordNotMatchedException();
			}
		}
		
	}

}
