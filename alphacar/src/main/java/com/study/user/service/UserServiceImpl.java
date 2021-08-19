package com.study.user.service;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;

import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.user.dao.IUserDao;
import com.study.user.vo.UserCountVO;
import com.study.user.vo.UserVO;

@Service
public class UserServiceImpl implements IUserService{

	@Inject
	IUserDao userDao;
	
	@Override
	public List<UserVO> getUserList() {
		return userDao.getUserList();
	}

	@Override
	public UserVO getUser(String userId) throws BizNotFoundException {
		UserVO user = userDao.getUser(userId);
		if(user ==null)
			throw new BizNotFoundException();
		return user;
	}

	@Override
	public void modifyUser(UserVO user) throws BizNotEffectedException, BizNotFoundException {
		UserVO vo = userDao.getUser(user.getUserId());
		if(vo == null)
		throw new BizNotFoundException();
		int cnt = userDao.updateUser(user);
		if(cnt < 1)
			throw new BizNotEffectedException(); 
	}

	@Override
	public void removeUser(UserVO user) throws BizNotEffectedException, BizNotFoundException {
		UserVO vo = userDao.getUser(user.getUserId());
		if(vo == null)
			throw new BizNotFoundException();
		int cnt = userDao.deleteUser(user);
		if(cnt < 1)
			throw new BizNotEffectedException(); 
	}

	@Override
	public void registUser(UserVO user) throws BizNotEffectedException, BizDuplicateKeyException {
		UserVO vo = userDao.getUser(user.getUserId());
		if(vo != null)
		throw new BizDuplicateKeyException();
		int cnt = userDao.insertUser(user);
		if(cnt < 1 )
			throw new BizNotEffectedException();
	}
	

	@Override
	public void sendEmail(UserVO user, String div) throws Exception {
		// mail server설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "gu890404@gmail.com";
		String hostSMTPpwd = "1q2w3e4r!!";
		
		// 보내는 사람 Email, 제목, 내용
		String fromEmail = "gu890404@gmail.com";
		String fromName = "알파카";
		String subject ="";
		String msg = "";
		
		if(div.equals("findpw")) {
			subject = "알파카 임시 비밀번호 입니다.";
			msg += "<div align= 'center' style='border:1 solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += user.getUserId() + "님의 임시비밀번호입니다.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += user.getUserPassword() + "</p></div>";
		}
		// 받는 사람 E-mail주소
		String mail = user.getUserEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);
			
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
			
			
			
		}catch(Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	@Override
	public void findPw(HttpServletResponse response, UserVO user) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		UserVO ck = userDao.getUser(user.getUserId());
		System.out.println(ck);
		PrintWriter out = response.getWriter();
		//가입 아이디가 없으면
		if(ck == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		else if(!user.getUserEmail().equals(ck.getUserEmail())) {
			out.print("이메일이 맞지 않습니다.");
			out.close();
		}else {
			//임시 비밀번호 생성
			String pw = "";
			for(int i = 0; i < 4; i++) {
				pw += (char)((Math.random() * 26) +97);
			}
			ck.setUserPassword(pw);
			
			sendEmail(ck, "findpw");
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			userDao.updatePass(ck);
			
			out.close();
		}
	}

	@Override
	public UserCountVO getCountInfo(String userId) {
		
		return userDao.getCountInfo(userId);
	}
}
