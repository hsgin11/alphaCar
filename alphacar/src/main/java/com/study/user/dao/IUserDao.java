package com.study.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.user.vo.UserCountVO;
import com.study.user.vo.UserVO;
@Mapper
public interface IUserDao {

	public List<UserVO> getUserList();
	public UserVO getUser(String userId);
	public int updateUser(UserVO user);
	public int deleteUser(UserVO user);
	public int insertUser(UserVO user);
	public int idChk(UserVO user);
	public String getUserRoleByUserId(String userId);
	public int updatePass (UserVO user);
	public UserCountVO getCountInfo(String userId);
}
