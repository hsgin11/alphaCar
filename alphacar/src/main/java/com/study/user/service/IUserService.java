package com.study.user.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.user.vo.UserCountVO;
import com.study.user.vo.UserVO;

public interface IUserService {

		public List<UserVO> getUserList();
		
		public UserVO getUser(String userId) throws BizNotFoundException ;
		
		public void modifyUser(UserVO user) throws BizNotEffectedException, BizNotFoundException ;
		
		public void removeUser(UserVO user) throws BizNotEffectedException, BizNotFoundException ;
		
		public void registUser(UserVO user) throws BizNotEffectedException, BizDuplicateKeyException ;
		
		public void sendEmail(UserVO user, String div) throws Exception;
		
		public void findPw(HttpServletResponse resp, UserVO user) throws Exception;
		
		public UserCountVO getCountInfo(String userId);

}
