package com.xxxxf.pojo;

import java.io.Serializable;

/**
*@author xxxxf 
*2018年7月10日
*/
public class User implements Serializable{
	
	private static final long serialVersionUID = 89448952;
	private String userName;
	private String passWord;
	/**
	 * getter && setter方法	
	 */
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	/**
	 * toString方法	
	 */
	@Override
	public String toString() {
		return "user [userName=" + userName + ", passWord=" + passWord + "]";
	}
	
	
	
}
