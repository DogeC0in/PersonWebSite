package com.xxxxf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xxxxf.dao.UserDao;
import com.xxxxf.pojo.User;
import com.xxxxf.service.UserService;

/**
*@author xxxxf 
*2018年7月10日
*/
@Service
public class UserServiceImpl implements UserService{
	//依赖注入
	@Autowired
	private UserDao userDao=null;

	@Override
	//读写提交
	@Transactional(isolation=Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	public void regist(User user) {
		// TODO Auto-generated method stub
		userDao.addUser(user);
		
	}

	@Override
	//读写提交
	@Transactional(isolation=Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	public void login(String userName, String passWord) {
		// TODO Auto-generated method stub
		userDao.getUser(userName, passWord);
	}

	@Override
	//读写提交
	@Transactional(isolation=Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	public String checkUser(String userName) {
		// TODO Auto-generated method stub
		return userDao.getUserByUserName(userName);
	}



}
