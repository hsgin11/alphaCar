package com.study.login.service;

import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.login.vo.LoginVO;
import com.study.user.vo.UserVO;

public interface ILoginService {
	
	
	public UserVO loginCheck(String id, String pw)
			throws BizNotFoundException,BizPasswordNotMatchedException;

}
