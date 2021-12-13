package com.skilldistillery.fomogaming.data;

import java.util.List;

import com.skilldistillery.fomogaming.entities.User;
import com.skilldistillery.fomogaming.entities.VideoGame;

public interface MovieDAO {

	public User findByUsername(String username);
	
	public List<VideoGame>  listorSearchGamesByGenre(String genre);
	
	public List<VideoGame> findGameByName(String name);
	
}
