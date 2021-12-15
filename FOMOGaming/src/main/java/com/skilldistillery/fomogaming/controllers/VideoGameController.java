package com.skilldistillery.fomogaming.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fomogaming.data.VideoGameDAO;
import com.skilldistillery.fomogaming.entities.User;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Controller
public class VideoGameController {

	@Autowired
	private VideoGameDAO gameDao;

	@RequestMapping(path = "BeginSearch.do", method = RequestMethod.GET)
	public String getGames() {

		return "search";

	}

	@RequestMapping(path = "GetByNameDetails.do", method = RequestMethod.GET)
	public ModelAndView getByNameForSingleGame(String name) {
		ModelAndView mv = new ModelAndView();

		// if one game, redirect to singleGame jsp
		VideoGame vg = gameDao.searchForGame(name);

		mv.addObject("game", vg);
		mv.setViewName("gaming/singleGame");
		return mv;
	}

	@RequestMapping(path = "GetByName.do", method = RequestMethod.GET)
	public ModelAndView getByName(String name) {
		ModelAndView mv = new ModelAndView();

		// if one game, redirect to singleGame jsp
		List<VideoGame> list = gameDao.searchByName(name);
		if (list.size() > 1) {
			mv.addObject("games", list);
			mv.setViewName("gameList");
		} else {
			mv.addObject("game", list.get(0));
			mv.setViewName("gaming/singleGame");
		}
		return mv;
	}

	@RequestMapping(path = "GetByDescription.do", method = RequestMethod.GET)
	public ModelAndView getByDescription(String description) {
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByKeyword(description);
		mv.addObject("games", list);
		mv.setViewName("gameList");
		return mv;

	}

	@RequestMapping(path = "GetByReleaseYear.do", method = RequestMethod.GET)
	public ModelAndView getByReleaseYear(Integer releaseYear) {
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByReleaseYear(releaseYear);
		mv.addObject("games", list);
		mv.setViewName("gameList");
		return mv;

	}

	@RequestMapping(path = "GetByPlatform.do", method = RequestMethod.GET)
	public ModelAndView getByPlatform(String platform) {
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByPlatform(platform);
		mv.addObject("games", list);
		mv.setViewName("gameList");
		return mv;

	}

	@RequestMapping(path = "GetByDeveloper.do", method = RequestMethod.GET)
	public ModelAndView getByDeveloper(String developer) {
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByDeveloper(developer);
		mv.addObject("games", list);
		mv.setViewName("gameList");
		return mv;

	}

	@RequestMapping(path = "GetBySeries.do", method = RequestMethod.GET)
	public ModelAndView getBySeries(String series) {
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByGameSeries(series);
		mv.addObject("games", list);
		mv.setViewName("gameList");
		return mv;

	}

	@RequestMapping(path = "GetGames.do", method = RequestMethod.GET)
	public ModelAndView getGames(String genre) {
		ModelAndView mv = new ModelAndView();
		List<VideoGame> genreList = gameDao.searchByGenre(genre);
		mv.addObject("games", genreList);
		mv.setViewName("gameList");
		return mv;

	}
	
	@RequestMapping(value = "addFavorite.do", method = RequestMethod.POST, params = "favoriteButton")
	public String addToFavorites(HttpSession session, VideoGame vg) { 
		User user = new User();
		user = (User) session.getAttribute("loggedInUser");
		
		List<VideoGame> favoriteGame = new ArrayList<>();
		for (VideoGame videoGame : user.getVideoGames()) {
			favoriteGame.add(videoGame);
		}
		favoriteGame.add(vg);
		user.setVideoGames(favoriteGame);
		return "redirect: singleGame.do";
	
	}

}
