package com.xxxxf.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.xxxxf.pojo.User;

/**
*@author xxxxf 
*2018年7月10日
*/
@Repository
public interface UserDao {
	/**
	 * 查询用户信息	
	 */
   public User getUser(@Param("userName") String userName,@Param("passWord") String passWord);
   /**
    * 增加用户  
    */
   public int addUser(User user);
   /**
    * 按主键查询用户   
    */
   public String getUserByUserName(String userName);
}
