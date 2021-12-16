package com.skilldistillery.fomogaming.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.fomogaming.entities.User;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findByUsername(String username) {
		String jpql = "SELECT u FROM User u WHERE u.username = :n";

		try {
			return em.createQuery(jpql, User.class).setParameter("n", username).getSingleResult();
		} catch (Exception e) {
			System.err.println("Invalid user name:  " + username);
			return null;
		}
	}

	@Override
	public User getUserByUserNameAndPassword(String userName, String password) {
		User u = null;
		List<User> users = getAllUsers();
		for (User user : users) {
			if (user.getUsername().equals(userName) && user.getPassword().equals(password)) {
				u = user;
				break;
			}
		}
		return u;
	}

	@Override
	public List<User> getAllUsers() {
		List<User> users = new ArrayList<>();
		String query = "SELECT u FROM User u";
		users = em.createQuery(query, User.class).getResultList();

		return users;
	}

	@Override
	public List<VideoGame> findGameByName(String name) {
		List<VideoGame> games = null;

		String query = "SELECT v FROM VideoGame WHERE name LIKE %:name% ";

		games = em.createQuery(query, VideoGame.class).setParameter("name", name).getResultList();

		return games;
	}

	@Override
	public User createUser(User user) {
		User newUser = new User();
		newUser = user;
		newUser.setRole("User");
		em.persist(newUser);
		em.getProperties();
		return newUser;
	}

	@Override
	public User removeUser(User user) {
		User u = new User();
		u = em.find(User.class, user.getId());
		em.remove(u);
		u = null;
		return u;
	}

	@Override
	public User updateUser(User u) {
		User user = em.find(User.class, u.getId());
		user.setUsername(u.getUsername());
		user.setPassword(u.getPassword());
		user.setProfilePicture(u.getProfilePicture());
		user.setEmail(u.getEmail());
		return user;
	}
	
	public VideoGame addFavoriteVideoGame(int Id, int UserId) {
		VideoGame videogame = new VideoGame();
		videogame = em.find(VideoGame.class, Id);
		User user = new User();
		user = em.find(User.class, UserId);
		user.addVideoGame(videogame);
		
		
		
		return videogame;
	}
}