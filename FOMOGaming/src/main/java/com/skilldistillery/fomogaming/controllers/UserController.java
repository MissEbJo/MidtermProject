package com.skilldistillery.fomogaming.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fomogaming.data.UserDAO;
import com.skilldistillery.fomogaming.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDao;
	
	
	@RequestMapping(path="AddNewUser.do")
	public String newUser() {
		
		return "createAccount";
	}
	
	@RequestMapping(path="addUserInfo.do")
	public ModelAndView addUser(User user) {
		ModelAndView mv = new ModelAndView();
		User user1 = new User();
		user1 =	userDao.createUser(user);
		mv.addObject("user", user1);
		mv.setViewName("newUserAdded");
		
		return mv;
		
		
	}

}
