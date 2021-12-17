package com.skilldistillery.fomogaming.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fomogaming.data.GenreDAO;
import com.skilldistillery.fomogaming.data.PlatformDAO;
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
	@Autowired
	private PlatformDAO platformDao;
	@Autowired
	private GenreDAO genreDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("DEBUG", userDao.findByUsername("admin"));
		List<VideoGame> randomList = gameDao.randomGames(5);
		model.addAttribute("games", randomList);
		return "home";
	}

	@RequestMapping(path = "AddNewGame.do")
	public ModelAndView addNewGame(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("loggedInUser");
		mv.addObject("vg", new VideoGame());
		if (user != null) {
			mv.addObject("genres", genreDao.getAllGenres());
			mv.addObject("series", gameDao.getAllSeries());
			mv.addObject("allPlatforms", platformDao.getAllPlatforms());
			mv.setViewName("addGame");
		}else {
		mv.setViewName("redirect:home.do"); 
		}
		return mv;
	}
	
	@RequestMapping(path="AddNewMedia.do")
	public ModelAndView addNewMedia(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("series", gameDao.getAllSeries());
		mv.addObject("allGames", gameDao.getAllGames());
		mv.setViewName("addOtherMedia");
		return mv;
	}

	@RequestMapping(path = "login.do")
	public String login() {
		return "login";
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
