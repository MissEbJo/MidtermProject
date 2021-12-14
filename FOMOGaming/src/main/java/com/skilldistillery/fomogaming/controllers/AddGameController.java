package com.skilldistillery.fomogaming.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fomogaming.data.UserDAO;
import com.skilldistillery.fomogaming.data.VideoGameDAO;
import com.skilldistillery.fomogaming.entities.User;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Controller
public class AddGameController {
	
	@Autowired
	private UserDAO userDao;
	private VideoGameDAO gameDao;
	
	
	@RequestMapping(path="NewGameInfo.do")
	public ModelAndView gameInfo(VideoGame vg, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			vg.setUserWhoAdded(user);
			gameDao.addVideoGame(vg);
			mv.setViewName("SOMEWHERE");
		} else {
			mv.setViewName("redirect:login.do");
		}
		
		return mv;
	}

}
