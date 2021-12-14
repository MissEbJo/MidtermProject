package com.skilldistillery.fomogaming.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fomogaming.data.VideoGameDAO;
import com.skilldistillery.fomogaming.entities.GameSeries;
import com.skilldistillery.fomogaming.entities.VideoGame;



@Controller
public class AddGameController {
	
	@Autowired
	private VideoGameDAO gameDao;
	
	@RequestMapping(path="NewGameInfo.do", method=RequestMethod.GET)
	public ModelAndView gameInfo(VideoGame vg, HttpSession session) {
		ModelAndView mv = new ModelAndView();
//		User user = (User) session.getAttribute("loggedInUser");
//		if (user != null) {
//			vg.setUserWhoAdded(user);
			List<GameSeries> series = new ArrayList<>();
			series = gameDao.getAllSeries();
			gameDao.addVideoGame(vg);
			mv.addObject("series", series);
			mv.addObject("videoGame", vg);
			mv.setViewName("addSeriesToGame");
//		} else {
//			mv.setViewName("redirect:login.do");
//		}
		
		return mv;
	}
	
	@RequestMapping(path="AddSeriesToGame.do")
	public ModelAndView commitSeriesToGame(GameSeries s, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		
		return mv;
	}

}
