package com.study.user.vo;

import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.study.common.valid.Modify;
import com.study.common.valid.Step1;
import com.study.common.valid.Step2;

public class UserVO {
	
	@NotBlank(message = "id를 입력해주세요",groups = {Modify.class,Step2.class})
	private String userId; 
	@NotBlank(message = "비밀번호를 입력해주세요",groups = {Modify.class,Step2.class})
	private String userPassword;            
	private String userName;                
	private String userRole;                
	private String userRegDate;             
	private int userAge;                    
	private String userGender;
	private String userEmail;
	
	
	//join
	@NotBlank(message = "이용약관에 대한 안내 모두 동의해주세요",groups = Step1.class)
	private String agreeYn;				 /* 이용약관동의         필수*/
	@NotBlank(message = "개인정보 수집에 대한 안내 모두 동의해주세요",groups = Step1.class)
	private String privacyYn;				 /*	 개인정보 동의        필수*/
	private String eventYn;				 /* 이벤트알람수신동의   선택 */
	private String userPassConfirm;     /* userPass랑 같은지      */
	

	@Override
	public String toString() {
		return ToStringBuilder
				.reflectionToString
				(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public String getUserRegDate() {
		return userRegDate;
	}
	public void setUserRegDate(String userRegDate) {
		this.userRegDate = userRegDate;
	}
	public int getUserAge() {
		return userAge;
	}
	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}


	public String getAgreeYn() {
		return agreeYn;
	}


	public void setAgreeYn(String agreeYn) {
		this.agreeYn = agreeYn;
	}


	public String getPrivacyYn() {
		return privacyYn;
	}


	public void setPrivacyYn(String privacyYn) {
		this.privacyYn = privacyYn;
	}


	public String getEventYn() {
		return eventYn;
	}


	public void setEventYn(String eventYn) {
		this.eventYn = eventYn;
	}


	public String getUserPassConfirm() {
		return userPassConfirm;
	}


	public void setUserPassConfirm(String userPassConfirm) {
		this.userPassConfirm = userPassConfirm;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	
		
	
}
