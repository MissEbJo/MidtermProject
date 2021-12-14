package com.skilldistillery.fomogaming.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fomogaming.data.UserDAO;
import com.skilldistillery.fomogaming.data.VideoGameDAO;

@Controller
public class AddGameController {
	
	@Autowired
	private UserDAO userDao;
	private VideoGameDAO gameDao;
	
	@RequestMapping(path = {"/" , "home.do"} )
	public String home(Model model) {
		model.addAttribute("DEBUG" , userDao.findByUsername("admin"));
		return "home";
	}
	
	
	@RequestMapping(path = "AddNewGame.do")
	public ModelAndView addNewGame() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addGame");
		return mv;
	}
	
	@RequestMapping(path="NewGameInfo.do")
	public ModelAndView gameInfo() {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}

}
