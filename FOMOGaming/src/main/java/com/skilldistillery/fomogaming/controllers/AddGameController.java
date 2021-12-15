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
	public ModelAndView gameInfo(int gameSeries, VideoGame vg, HttpSession session) {
		ModelAndView mv = new ModelAndView();
//		User user = (User) session.getAttribute("loggedInUser");
//		if (user != null) {
//			vg.setUserWhoAdded(user);
//			List<GameSeries> series = new ArrayList<>();
//			series = gameDao.getAllSeries();
//			mv.addObject("series", series);
		gameDao.addVideoGame(vg, gameSeries);
		mv.addObject("game", vg);
		
		if(gameSeries == 0) {
			mv.setViewName("createGameSeries"); //CREATE game series
		}
		else {
			
			mv.setViewName("gaming/singleGame");
		}
//		} else {
//			mv.setViewName("redirect:login.do");
//		}
		
		return mv;
	}
	
//	@RequestMapping(path="AddSeriesToGame.do")
//	public ModelAndView commitSeriesToGame(int gameId, GameSeries gs, HttpSession session) {
//		ModelAndView mv = new ModelAndView();
////		create new game series in DAO and assign it to game attached to gameId
//		if (s != null && GameSeries.class == s.getClass()) {
//			vg.setGameSeries(s);
//			gameDao.updateVideoGame(vg);
//			mv.setViewName;
//		}
//		else if (s == "newSeries") {
//		mv.setViewName("addNewSeries");
//		}
//		
//		return mv;
//	}

}
