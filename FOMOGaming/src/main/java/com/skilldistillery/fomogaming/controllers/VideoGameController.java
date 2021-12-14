package com.skilldistillery.fomogaming.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.fomogaming.data.VideoGameDAO;

@Controller
public class VideoGameController {
	
	@Autowired
	private VideoGameDAO gameDao;
}
