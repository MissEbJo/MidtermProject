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
	public List<VideoGame> gamesInAction() {
		 List<VideoGame> action = new ArrayList<>();
		
//		String query = "SELECT v.name FROM VideoGame v WHERE v.genre.name = :genre ";
		
		String query = " SELECT v FROM VideoGame v ";
//		 action = em.createQuery(query, VideoGame.class).getResultList();
		List<Object> games = em.createQuery(query, Object.class)
//				.setParameter("genre", genre)
				.getResultList();
//		
//		
//		List<VideoGame> action = new ArrayList<>();
//		
		for (Object object : games) {
			action.add((VideoGame)object);
		}
		return action;
	}

	@Override
	public List<VideoGame> findGameByName(String name) {
		List<VideoGame> games = null;
		
		String query = "SELECT v FROM VideoGame WHERE name LIKE %:name% ";
		
		games = em.createQuery(query, VideoGame.class).setParameter("name", name).getResultList();
		
		return games;
	}

	

}
