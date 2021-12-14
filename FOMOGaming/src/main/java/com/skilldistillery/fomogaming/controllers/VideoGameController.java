package com.skilldistillery.fomogaming.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fomogaming.data.VideoGameDAO;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Controller
public class VideoGameController {
	
	@Autowired
	private VideoGameDAO gameDao;
	
	// add a search at the top 
	
	@RequestMapping("GetGames.do")
	public ModelAndView getGames(){
		ModelAndView mv = new ModelAndView();
		List<VideoGame> genreList = gameDao.searchByGenre("action");
		mv.addObject("games", genreList);
		mv.setViewName("gameList");
		return mv;
		
	}
}
