package com.skilldistillery.fomogaming.controllers;

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
import com.skilldistillery.fomogaming.entities.VideoGame;

@Controller
public class HomeController {

	@Autowired
	private UserDAO userDao;

	@Autowired
	private VideoGameDAO gameDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("DEBUG", userDao.findByUsername("admin"));
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
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			mv.setViewName("addGame");
		}
		mv.setViewName("redirect:home.do"); // TODO FIX THIS ISH
		return mv;
	}

//	@RequestMapping(path = "AddNewUser.do")
//	public String createAccount() {
//		
//		
//		return "createAccount";
//	}
	@RequestMapping(path = "login.do")
	public String login() {
		return "login"; //TODO find if user created an acct... keep them logged in ;)
	}

	@RequestMapping(path = "AdvancedSearch.do")
	public String advSearch() {
		return "advancedSearch";
	}
	
	@RequestMapping(path="about.do")
	public String about() {
		return "about";
	}

}
