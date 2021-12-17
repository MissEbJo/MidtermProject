package com.skilldistillery.fomogaming.controllers;

import java.sql.Array;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fomogaming.data.GenreDAO;
import com.skilldistillery.fomogaming.data.PlatformDAO;
import com.skilldistillery.fomogaming.data.VideoGameDAO;
import com.skilldistillery.fomogaming.entities.Genre;
import com.skilldistillery.fomogaming.entities.Platform;
import com.skilldistillery.fomogaming.entities.User;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Controller
public class AddGameController {

	@Autowired
	private VideoGameDAO gameDao;
//	private GameSeriesDAO gsd;
	@Autowired
	private PlatformDAO platDao;
	@Autowired
	private GenreDAO genreDao;

	@RequestMapping(path = "NewGameInfo.do", method = RequestMethod.GET)
	public ModelAndView gameInfo(int sID, VideoGame vg, String[] genreNames, HttpSession session, String... platformNames) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			vg.setUserWhoAdded(user);
			List<Platform> platforms = platDao.findPlatformByName(platformNames);
			List<Genre> genres = genreDao.findGenreByName(genreNames);
			VideoGame v = new VideoGame();
			v = gameDao.addVideoGame(vg, sID, platforms, genres);
			if (v == null) {
				mv.setViewName("error");
			} else {
			mv.addObject("game", v);
			mv.setViewName("gaming/singleGame");
			}
		}return mv;

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

}}
