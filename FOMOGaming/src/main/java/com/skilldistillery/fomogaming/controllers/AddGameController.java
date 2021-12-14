package com.skilldistillery.fomogaming.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus.Series;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fomogaming.data.VideoGameDAO;
import com.skilldistillery.fomogaming.data.VideoGameDAOImpl;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Controller
public class AddGameController {
	
	@Autowired
	private VideoGameDAO gameDao = new VideoGameDAOImpl();
	
	@RequestMapping(path="NewGameInfo.do", method=RequestMethod.GET)
	public ModelAndView gameInfo(VideoGame vg, HttpSession session) {
		ModelAndView mv = new ModelAndView();
//		User user = (User) session.getAttribute("loggedInUser");
//		if (user != null) {
//			vg.setUserWhoAdded(user);
			List<Series> series = new ArrayList<>();
			series = gameDao.getAllSeries();
			gameDao.addVideoGame(vg);
			for (Series series2 : series) {
				mv.addObject("gameSeries", series2);
			}
			mv.setViewName("addTieIn");
//		} else {
//			mv.setViewName("redirect:login.do");
//		}
		
		return mv;
	}

}
