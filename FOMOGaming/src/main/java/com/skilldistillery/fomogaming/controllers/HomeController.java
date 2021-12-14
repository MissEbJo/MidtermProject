package com.skilldistillery.fomogaming.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fomogaming.data.UserDAO;

@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDao;
	
	
	@RequestMapping(path = {"/" , "home.do"} )
	public String home(Model model) {
		model.addAttribute("DEBUG" , userDao.findByUsername("admin"));
		return "home";
	}
	
//	@RequestMapping(path = "home.do")
//	public ModelAndView someGamesByGenre() {
//		ModelAndView mv = new ModelAndView();
//		List<VideoGame> genreList = gameDao.searchByGenre("action");
//		mv.addObject("games", genreList);
//		mv.setViewName("gameList");
//		return mv;
//		
//	}
	
	@RequestMapping(path = "AddNewGame.do")
	public ModelAndView addNewGame() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addGame");
		return mv;
	}
	
	

}
