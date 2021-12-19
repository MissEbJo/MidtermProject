package com.skilldistillery.fomogaming.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fomogaming.data.GameSeriesDAO;
import com.skilldistillery.fomogaming.data.GenreDAO;
import com.skilldistillery.fomogaming.data.PlatformDAO;
import com.skilldistillery.fomogaming.data.VideoGameDAO;
import com.skilldistillery.fomogaming.entities.GameSeries;
import com.skilldistillery.fomogaming.entities.Genre;
import com.skilldistillery.fomogaming.entities.Platform;
import com.skilldistillery.fomogaming.entities.User;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Controller
public class AddGameController {

	@Autowired
	private VideoGameDAO gameDao;
	@Autowired
	private PlatformDAO platDao;
	@Autowired
	private GenreDAO genreDao;
	@Autowired
	private GameSeriesDAO seriesDao;

	@RequestMapping(path = "NewGameInfo.do", method = RequestMethod.GET)
	public ModelAndView gameInfo(int sID, VideoGame vg, String[] genreNames, HttpSession session,
			String... platformNames) {
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
		}
		return mv;
	}

	@RequestMapping(path = "editGameInfo.do", method = RequestMethod.GET)
	public ModelAndView editGameInfo(int sID, VideoGame vg, String[] genreNames, HttpSession session,
			String... platformNames) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			List<Platform> platforms = platDao.findPlatformByName(platformNames);
			List<Genre> genres = genreDao.findGenreByName(genreNames);
			GameSeries gs = seriesDao.findSeriesById(sID);
			VideoGame v = gameDao.updateVideoGame(vg, gs, platforms, genres);
			if (v == null) {
				mv.setViewName("error");
			} else {
				mv.addObject("game", v);
				mv.setViewName("gaming/singleGame");
			}
		}
		return mv;
	}

	@RequestMapping(path = "editGame.do", method = RequestMethod.POST)
	public ModelAndView editGame(int gameId) {
		ModelAndView mv = new ModelAndView();
		VideoGame videoGame = gameDao.searchForGameById(gameId);
		mv.addObject("series", gameDao.getAllSeries());
		mv.addObject("allPlatforms", platDao.getAllPlatforms());
		mv.addObject("genres", genreDao.getAllGenres());
		mv.addObject("game", videoGame);
		mv.setViewName("editGame");
		return mv;
	}
	
	@RequestMapping(path="deleteGame.do", method = RequestMethod.POST)
	public ModelAndView deleteGame(int deleteId) {
		ModelAndView mv = new ModelAndView();
		VideoGame videoGame = gameDao.searchForGameById(deleteId);
		gameDao.deleteGame(videoGame);
		mv.setViewName("successfulDelete");
		return mv;
	}

	@RequestMapping(path="enableGame.do", method = RequestMethod.POST)
	public ModelAndView enableGame(int enableId) {
		ModelAndView mv = new ModelAndView();
		VideoGame videoGame = gameDao.searchForGameById(enableId);
		gameDao.reEnableGame(videoGame);
		mv.setViewName("/gaming/singleGame");
		mv.addObject("game", videoGame);
		return mv;
	}
}
