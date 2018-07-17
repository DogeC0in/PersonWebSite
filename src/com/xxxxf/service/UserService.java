package com.xxxxf.service;

import com.xxxxf.pojo.User;

/**
*@author xxxxf 
*2018年7月10日
*/
public interface UserService {
	/**
	 * 用户注册
	 */
   public void  regist(User user);
  /**
   * 用户登录 
   */
   public void login(String userName,String passWord);
   /**
    * 检测用户是否存在
    */
   public String checkUser(String userName);
}
