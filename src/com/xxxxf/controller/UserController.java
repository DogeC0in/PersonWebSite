package com.xxxxf.controller;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.java.swing.plaf.windows.resources.windows;
import com.xxxxf.dao.UserDao;
import com.xxxxf.pojo.User;
import com.xxxxf.service.UserService;

/**
*@author xxxxf 
*2018年7月10日
*/
@Controller
public class UserController {
	//依赖注入
	@Autowired
	private UserService userService=null;
	
	/*public Map<String, Object> checkUser(String userName) {
		//检查用户是否存在
		User result=userService.checkUser(userName);
		Map<String, Object> retMap = new HashMap<String, Object>();
		boolean flag=(result==null);
	    retMap.put("success",flag);
	    retMap.put("message", flag?"注册成功":"用户名已存在");
		return retMap;
		
	}*/
	@RequestMapping(value="/register.do")
	@ResponseBody
	public ModelAndView regist(User user,Model model,HttpServletResponse response) throws IOException {
		System.out.println("用户注册:"+"账号:"+user.getUserName()+" "+"密码:"+user.getPassWord());
		String userName=user.getUserName();
		String result=userService.checkUser(userName);
			if (result==null) {
			userService.regist(user);
			response.setContentType("text/html;charset=utf-8");
		    PrintWriter out = response.getWriter();
		    out.print("<script language=\"javascript\">alert('注册成功！前往登录页面');window.location.href='/PersonWebSite/login.jsp'</script>");
			//model.addAttribute("msg","注册成功");
			//return new ModelAndView("redirect:/login.jsp");
			}else {
				response.setContentType("text/html;charset=utf-8");
			    PrintWriter out = response.getWriter();
			    out.print("<script language=\"javascript\">alert('注册失败!账号已存在!');window.location.href='/PersonWebSite/register.jsp'</script>");
				//model.addAttribute("msg","账号存在,请重新注册");
				//return new ModelAndView("redirect:/register.jsp");     
			}
			return null;
			
	}
	
	public ModelAndView login(User user,Model model,HttpServletRequest request,HttpServletResponse response) {
		System.out.println("用户登录:"+"账号:"+user.getUserName()+" "+"密码:"+user.getPassWord());
		String userName=user.getUserName();
		String passWord=user.getPassWord();
		userService.login(userName, passWord);
		model.addAttribute("msg", "登陆成功");
		return null;
		
	}
}
