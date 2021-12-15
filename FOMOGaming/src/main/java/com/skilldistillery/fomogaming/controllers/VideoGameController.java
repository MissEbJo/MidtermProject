package com.skilldistillery.fomogaming.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fomogaming.data.VideoGameDAO;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Controller
public class VideoGameController {
	
	@Autowired
	private VideoGameDAO gameDao;
	

	
	@RequestMapping(path="BeginSearch.do", method= RequestMethod.GET)
	public String getGames(){
		
		return "search";
		
	}
	
	@RequestMapping(path="GetByName.do", method= RequestMethod.GET)
	public ModelAndView getByName(String name){
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByName(name);
		if(list.size() > 1) {
			mv.addObject("games", list);
			mv.setViewName("gameList");
		}else {
		mv.addObject("game", list);
		mv.setViewName("singleGame");
		}
		return mv;
	}
	@RequestMapping(path="GetByDescription.do", method= RequestMethod.GET)
	public ModelAndView getByDescription(String description){
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByKeyword(description);
		mv.addObject("games", list);
		mv.setViewName("gameList");
		return mv;
		
	}
	@RequestMapping(path="GetByReleaseYear.do", method= RequestMethod.GET)
	public ModelAndView getByReleaseYear(Integer releaseYear){
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByReleaseYear(releaseYear);
		mv.addObject("games", list);
		mv.setViewName("gameList");
		return mv;
		
	}
	@RequestMapping(path="GetByPlatform.do", method= RequestMethod.GET)
	public ModelAndView getByPlatform(String platform){
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByPlatform(platform);
		mv.addObject("games", list);
		mv.setViewName("gameList");
		return mv;
		
	}
	@RequestMapping(path="GetByDeveloper.do", method= RequestMethod.GET)
	public ModelAndView getByDeveloper(String developer){
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByDeveloper(developer);
		mv.addObject("games", list);
		mv.setViewName("gameList");
		return mv;
		
	}
	@RequestMapping(path="GetBySeries.do", method= RequestMethod.GET)
	public ModelAndView getBySeries(String series){
		ModelAndView mv = new ModelAndView();
		List<VideoGame> list = gameDao.searchByGameSeries(series);
		mv.addObject("games", list);
		mv.setViewName("gameList");
		return mv;
		
	}
	
	
	@RequestMapping(path="GetGames.do", method= RequestMethod.GET)
	public ModelAndView getGames(String genre){
		ModelAndView mv = new ModelAndView();
		List<VideoGame> genreList = gameDao.searchByGenre(genre);
		mv.addObject("games", genreList);
		mv.setViewName("gameList");
		return mv;
		
	}

}
