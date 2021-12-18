package com.skilldistillery.fomogaming.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fomogaming.data.UserDAO;
import com.skilldistillery.fomogaming.data.VideoGameDAO;
import com.skilldistillery.fomogaming.entities.User;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private VideoGameDAO videoGameDao;

	@RequestMapping(path = "AddNewUser.do")
	public String newUser() {

		return "createAccount";
	}

	@RequestMapping(path = "addUserInfo.do")
	public ModelAndView addUser(User user) {
		ModelAndView mv = new ModelAndView();
		User user1 = new User();
		user1 = userDao.createUser(user);
		mv.addObject("user", user1);
		mv.setViewName("newUserAdded");

		return mv;
	}

	@RequestMapping(path = "deleteProfile.do")
	public String deleteProfile(HttpSession session) {
		User user1 = new User();
		user1 = (User) session.getAttribute("loggedInUser");
		user1 = userDao.removeUser(user1);
		if (user1 == null) {
			session.removeAttribute("loggedInUser");
			return "redirect:home.do";
		} else {

			return "redirect:profile.do";
		}
	}

	@RequestMapping(path = "userLogin.do")
	public String loggingIn(String username, String password, HttpSession session) {
		User user = new User();
		user = userDao.getUserByUserNameAndPassword(username, password);
		if (user != null) {
			session.setAttribute("loggedInUser", user);
			return "redirect:home.do";
		} else {
			return "redirect:login.do";
		}
	}

	@RequestMapping(path = "profile.do")
	public String profile() {
		return "userProfile";
	}

	@RequestMapping(path = "userLogout.do")
	public String logout(HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			session.removeAttribute("loggedInUser");
			return "logout";
		} else {
			return "redirect:login.do";
		}
	}
	@RequestMapping(path = "EditProfile.do", method=RequestMethod.POST)
	public String editProfile (User user, HttpSession session) {
		user = userDao.updateUser(user);
		session.setAttribute("loggedInUser", user);
		return "redirect:profile.do";
	}
	
	@RequestMapping(path="beginEditProfile.do")
	public ModelAndView beginEditProfile(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = new User();
		user = (User) session.getAttribute("loggedInUser");
		mv.addObject("user", user);
		mv.setViewName("editProfile");
		return mv;
	}
	
	@RequestMapping(value = "addFavorite.do", method = RequestMethod.POST)
	public ModelAndView addToFavorites(HttpSession session, Integer gameId) { 
		ModelAndView mv = new ModelAndView();
		User user = new User();
		user = (User) session.getAttribute("loggedInUser");
		int userId;
		userId = user.getId();
		
		if(user != null) {
			userDao.addFavoriteVideoGame(gameId, userId);
			
		}
		VideoGame videoGame = videoGameDao.searchForGameById(gameId);
		mv.addObject("game", videoGame);
		mv.setViewName("gaming/singleGame");
		user.getVideoGames().add(videoGame);
		session.setAttribute("loggedInUser", user);
		return mv;
	
	}
	
	@RequestMapping(value = "getGamesAdded.do", method = RequestMethod.GET)
	public ModelAndView getGamesAdded(HttpSession session, Integer gameId) { 
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("loggedInUser");
		int userId = user.getId();
		
		if(user != null) {
			List<VideoGame> videoGames = userDao.getAllGamesByUserId(userId);
			mv.addObject("videoGamesAdded", videoGames);
		}
		mv.setViewName("gamesAddedByUser");
		return mv;
		
	}
	
}
