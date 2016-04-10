package com.hun.social.controllers;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.hun.social.models.User;
import com.hun.social.repositories.UserDaoImpl;
import com.hun.social.services.UserService;

@Controller
public class UserController {
	private final static Logger LOG = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserService userService;

	@RequestMapping("/logins")
	@ResponseBody
	public String login(User u) {

		LOG.info("登录用户注入信息"+u.toString());
		User user = userService.login(u);
	    if(user!=null){
	    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
	    	request.getSession().setAttribute("user", user);
	    	LOG.info("用户登录成功");
	    	return "true";
	    }
	    LOG.info("用户登录失败");
	    return "false"; 
	}
	@RequestMapping("toindex")
	public String toindex(){
		return "index";
	}
	@RequestMapping("/register")
	@ResponseBody
	public String register(User u) {
		LOG.info("注册用户注入信息"+u.toString());
		if (u.getPassword()!=""&&u.getUserId() != null && u.getPassword() != null && u.getPassword().equals(u.getPassword1()) && userService.register(u)) {
			LOG.info("注册成功");
			return "true";
		}
		LOG.info("注册失败");
		return "false";

	}
	
	/**
	 * 返回true为已存在
	 * @param username
	 * @return
	 */
	@RequestMapping("/check")
	@ResponseBody
	public String check(String email){
		//System.out.println(email);
		if(email!=null&&userService.check(email)){
			LOG.info("用户已存在");
			return "true";
		}else{
			LOG.info("用户不存在，继续注册");
			return "false";
		}
		
	}
	
	

	@RequestMapping("/socket")
	public String Social() {
		return "socket/chat";
	}

	@RequestMapping("/notes")
	public String Person() {
		return "person/notes";
	}
	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	@RequestMapping("/clouds")
	public String cloud() {
		return "storage/cloud";
	}

	@RequestMapping("/myclouds")
	public String mycloud() {
		return "storage/cloud_1";
	}

}
