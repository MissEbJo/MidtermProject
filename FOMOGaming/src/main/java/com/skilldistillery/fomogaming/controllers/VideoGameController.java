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
import com.skilldistillery.fomogaming.entities.Comment;
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
		VideoGame vg = gameDao.searchForGame(name);
		if (vg.isEnabled()) {
			mv.addObject("game", vg);
			mv.setViewName("gaming/singleGame");
		}
		return mv;
	}

	@RequestMapping(path = "GetById.do", method = RequestMethod.GET)
	public ModelAndView getById(Integer gameId) {
		ModelAndView mv = new ModelAndView();
		VideoGame vg = gameDao.searchForGameById(gameId);
		if (vg.isEnabled()) {
			mv.addObject("game", vg);
			mv.setViewName("gaming/singleGame");
		}
		return mv;
	}

	@RequestMapping(path = "GetByName.do", method = RequestMethod.GET)
	public ModelAndView getByName(String name) {
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByName(name);
		List<VideoGame> enabledList = new ArrayList<>();
		for (VideoGame videoGame : list) {
			if (videoGame.isEnabled()) {
				enabledList.add(videoGame);
			}
		}
		if (enabledList.size() > 1) {
			mv.addObject("games", enabledList);
			mv.setViewName("gameList");
		} else if (enabledList.size() == 1) {
			mv.addObject("game", enabledList.get(0));
			mv.setViewName("gaming/singleGame");
		} else {
			mv.setViewName("error");
		}
		return mv;
	}

	@RequestMapping(path = "GetByDescription.do", method = RequestMethod.GET)
	public ModelAndView getByDescription(String description) {
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByKeyword(description);
		List<VideoGame> enabledList = new ArrayList<>();
		for (VideoGame videoGame : list) {
			if (videoGame.isEnabled()) {
				enabledList.add(videoGame);
			}
		}
		if (enabledList.size() > 1) {
			mv.addObject("games", enabledList);
			mv.setViewName("gameList");
		} else if (enabledList.size() == 1) {
			mv.addObject("game", enabledList.get(0));
			mv.setViewName("gaming/singleGame");
		} else {
			mv.setViewName("error");
		}
		return mv;

	}

	@RequestMapping(path = "GetByReleaseYear.do", method = RequestMethod.GET)
	public ModelAndView getByReleaseYear(Integer releaseYear) {
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByReleaseYear(releaseYear);
		List<VideoGame> enabledList = new ArrayList<>();
		for (VideoGame videoGame : list) {
			if (videoGame.isEnabled()) {
				enabledList.add(videoGame);
			}
		}
		if (enabledList.size() > 1) {
			mv.addObject("games", enabledList);
			mv.setViewName("gameList");
		} else if (enabledList.size() == 1) {
			mv.addObject("game", enabledList.get(0));
			mv.setViewName("gaming/singleGame");
		} else {
			mv.setViewName("error");
		}
		return mv;

	}

	@RequestMapping(path = "GetByPlatform.do", method = RequestMethod.GET)
	public ModelAndView getByPlatform(String platform) {
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByPlatform(platform);
		List<VideoGame> enabledList = new ArrayList<>();
		for (VideoGame videoGame : list) {
			if (videoGame.isEnabled()) {
				enabledList.add(videoGame);
			}
		}
		if (enabledList.size() > 1) {
			mv.addObject("games", enabledList);
			mv.setViewName("gameList");
		} else if (enabledList.size() == 1) {
			mv.addObject("game", enabledList.get(0));
			mv.setViewName("gaming/singleGame");
		} else {
			mv.setViewName("error");
		}
		return mv;

	}

	@RequestMapping(path = "GetByDeveloper.do", method = RequestMethod.GET)
	public ModelAndView getByDeveloper(String developer) {
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByDeveloper(developer);
		List<VideoGame> enabledList = new ArrayList<>();
		for (VideoGame videoGame : list) {
			if (videoGame.isEnabled()) {
				enabledList.add(videoGame);
			}
		}
		if (enabledList.size() > 1) {
			mv.addObject("games", enabledList);
			mv.setViewName("gameList");
		} else if (enabledList.size() == 1) {
			mv.addObject("game", enabledList.get(0));
			mv.setViewName("gaming/singleGame");
		} else {
			mv.setViewName("error");
		}
		return mv;

	}

	@RequestMapping(path = "GetBySeries.do", method = RequestMethod.GET)
	public ModelAndView getBySeries(String series) {
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByGameSeries(series);
		List<VideoGame> enabledList = new ArrayList<>();
		for (VideoGame videoGame : list) {
			if (videoGame.isEnabled()) {
				enabledList.add(videoGame);
			}
		}
		if (enabledList.size() > 1) {
			mv.addObject("games", enabledList);
			mv.setViewName("gameList");
		} else if (enabledList.size() == 1) {
			mv.addObject("game", enabledList.get(0));
			mv.setViewName("gaming/singleGame");
		} else {
			mv.setViewName("error");
		}
		return mv;
	}

	@RequestMapping(path = "GetGames.do", method = RequestMethod.GET)
	public ModelAndView getGamesByGenre(String genre) {
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByGenre(genre);
		List<VideoGame> enabledList = new ArrayList<>();
		for (VideoGame videoGame : list) {
			if (videoGame.isEnabled()) {
				enabledList.add(videoGame);
			}
		}
		if (enabledList.size() > 1) {
			mv.addObject("games", enabledList);
			mv.setViewName("gameList");
		} else if (enabledList.size() == 1) {
			mv.addObject("game", enabledList.get(0));
			mv.setViewName("gaming/singleGame");
		} else {
			mv.setViewName("error");
		}
		return mv;
	}

	@RequestMapping(path = "addComment.do", method = RequestMethod.POST)
	public ModelAndView addComment(String comment, Integer gameId, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		Comment newComment = new Comment();
		newComment.setText(comment);
		newComment.setUser(user);
		ModelAndView mv = new ModelAndView();
		gameDao.addComment(newComment, gameId);
		mv.setViewName("redirect:GetById.do?gameId=" + gameId);

		return mv;
	}

}
