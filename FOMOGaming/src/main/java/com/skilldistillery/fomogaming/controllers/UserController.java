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
	public ModelAndView newUser(User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();	
		try {
			userDao.createUser(user);
			
		} catch (Exception e) {
			System.out.println("Error creating account");
		} 
		


		
		
		return mv;
	}

}
