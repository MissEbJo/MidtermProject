package com.skilldistillery.fomogaming.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fomogaming.data.UserDAO;
import com.skilldistillery.fomogaming.data.VideoGameDAO;
import com.skilldistillery.fomogaming.entities.Genre;
import com.skilldistillery.fomogaming.entities.Mode;
import com.skilldistillery.fomogaming.entities.Platform;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Controller
public class AddGameController {
	
	@Autowired
	private UserDAO userDao;
	private VideoGameDAO gameDao;
	
//	@RequestMapping(path = {"/" , "home.do"} )
//	public String home(Model model) {
//		model.addAttribute("DEBUG" , userDao.findByUsername("admin"));
//		return "home";
//	}
//	
//	
//	@RequestMapping(path = "AddNewGame.do")
//	public ModelAndView addNewGame() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("addGame");
//		return mv;
//	}
	
	@RequestMapping(path="NewGameInfo.do")
	public ModelAndView gameInfo(VideoGame vg) {
		ModelAndView mv = new ModelAndView();
		
		
		
		return mv;
	}

}
