package com.skilldistillery.fomogaming.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fomogaming.data.UserDAO;
import com.skilldistillery.fomogaming.data.VideoGameDAO;
import com.skilldistillery.fomogaming.entities.User;
import com.skilldistillery.fomogaming.entities.GameSeries;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private VideoGameDAO gameDao;
	
	
	@RequestMapping(path = {"/" , "home.do"} )
	public String home(Model model) {
		model.addAttribute("DEBUG" , userDao.findByUsername("admin"));
		List<VideoGame> genreList = gameDao.searchByGenre("action");
		model.addAttribute("games", genreList);
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
	public ModelAndView addNewGame(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User)session.getAttribute("User");
		List<GameSeries> series = new ArrayList<>();
		series = gameDao.getAllSeries();
		mv.addObject("series", series);
		if(user.getRole().equals("User")) {
			mv.setViewName("addGame");
			return mv;
		}else {
			System.out.println("Create an account to add game");
			return mv;
		}
			
	}
	
//	@RequestMapping(path = "AddNewUser.do")
//	public String createAccount() {
//		
//		
//		return "createAccount";
//	}
	@RequestMapping( path = "login.do")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}
	
	

}
