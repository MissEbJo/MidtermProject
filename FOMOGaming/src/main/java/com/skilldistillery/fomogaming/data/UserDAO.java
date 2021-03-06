package com.skilldistillery.fomogaming.data;

import java.util.List;

import com.skilldistillery.fomogaming.entities.User;
import com.skilldistillery.fomogaming.entities.VideoGame;

public interface UserDAO {

	public User findByUsername(String username);
	
	public User createUser(User user);
	
	public List<VideoGame> findGameByName(String name);

	User getUserByUserNameAndPassword(String userName, String password);

	List<User> getAllUsers();

	User removeUser(User user);

	User updateUser(User u);
	
	public VideoGame addFavoriteVideoGame(int Id, int UserId);

	List<VideoGame> getAllGamesByUserId(int userId);
}
