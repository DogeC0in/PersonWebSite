package com.xxxxf.controller;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	/**
	 * 注册功能实现
	 * */
	@RequestMapping(value="/register.do")
	@ResponseBody
	public ModelAndView regist(User user,Model model,HttpServletResponse response) throws IOException {
		System.out.println("#################################################");
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
	/**
	 * 登录功能实现
	 * */
	@RequestMapping(value="/login.do")
	@ResponseBody
	public  ModelAndView login( @RequestBody User user,HttpServletRequest request,HttpServletResponse response) {
		/*Model model,HttpServletRequest request,HttpServletResponse response*/
		System.out.println("***********************************");
		String username=user.getUserName();
		//request.getParameter(username);
		String password=user.getPassWord();
		System.out.println("用户登录:"+"账号:"+username+" "+"密码:"+password);
		String result=userService.login(username, password);
		System.out.println("从数据查询结果:"+result);
		/*response.getWriter().write(username);*/
		if (result != null) {
			try {
				response.getWriter().write("true");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				response.getWriter().write("false");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//model.addAttribute("msg", "登陆成功");
		return null;
		
	}
}
