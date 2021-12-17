package com.skilldistillery.fomogaming.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fomogaming.data.BoardGameDAO;
import com.skilldistillery.fomogaming.data.GenreDAO;
import com.skilldistillery.fomogaming.data.MovieDAO;
import com.skilldistillery.fomogaming.data.PlatformDAO;
import com.skilldistillery.fomogaming.data.VideoGameDAO;
import com.skilldistillery.fomogaming.entities.BoardGame;
import com.skilldistillery.fomogaming.entities.GameSeries;
import com.skilldistillery.fomogaming.entities.Movie;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Controller
public class AddMediaController {

	@Autowired
	private VideoGameDAO gameDao;
	@Autowired
	private MovieDAO movieDao;
	@Autowired
	private PlatformDAO platDao;
	@Autowired
	private GenreDAO genreDao;
	@Autowired
	private BoardGameDAO bgDao;

	
	@RequestMapping(path = "AddMovie.do", method = RequestMethod.GET)
	public String addNewMovie(Movie movie, int seriesId) {
		movieDao.addMovie(movie, seriesId);
		
		return "SuccessfulAdd";
	}
	@RequestMapping(path = "AddBoardGame.do", method = RequestMethod.GET)
	public String addNewBoardGame(BoardGame boardgame, int gameId) {
		bgDao.addBoardGame(boardgame, gameId);
		
		return "SuccessfulAdd";
	}
	
	@RequestMapping(path="gameSeries.do")
	public ModelAndView goToGameSeries(int gameId) {
		ModelAndView mv = new ModelAndView();
		VideoGame videoGame = gameDao.searchForGameById(gameId);
		GameSeries gameSeries = videoGame.getGameSeries();
		mv.addObject("gameSeries", gameSeries);
		mv.setViewName("gameSeries");
		return mv;
	}
}
