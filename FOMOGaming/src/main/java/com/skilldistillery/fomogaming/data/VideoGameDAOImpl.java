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
public class VideoGameDAOImpl implements VideoGameDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<VideoGame> searchByName(String name) {
		List<VideoGame> titleList = new ArrayList<>();
		
		String query = "SELECT v FROM VideoGame v WHERE name = :name";
		
		titleList = em.createQuery(query, VideoGame.class).setParameter("name", name).getResultList();
		return titleList;
	}

	@Override
	public List<VideoGame> searchByKeyword(String keyword) {
		List<VideoGame> keywordList = new ArrayList<>();
		
		String query = "SELECT v FROM VideoGame v WHERE description LIKE :keyword";
		
		keywordList = em.createQuery(query, VideoGame.class).setParameter("keyword", keyword).getResultList();

		return keywordList;
	}

	@Override
	public List<VideoGame> searchByReleaseYear(int year) {
		List<VideoGame> yearList = new ArrayList<>();
		
		String query = "SELECT v from VideoGame v WHERE releaseYear = :year ";
		
		yearList = em.createQuery(query, VideoGame.class).setParameter("year", year).getResultList();
		
		return yearList;
	}

	@Override
	public List<VideoGame> searchByMode(String mode) {
		List<VideoGame> modeList = new ArrayList<>();
		
		return modeList;
	}

	@Override
	public List<VideoGame> searchByGenre(String genre) {
		
		List<VideoGame> genreList = new ArrayList<>();

		String query = "SELECT v FROM VideoGame v JOIN v.genres g WHERE g.name = :genre";

		genreList = em.createQuery(query, VideoGame.class).setParameter("genre", genre).getResultList();

		return genreList;
		
	}

	@Override
	public List<VideoGame> searchByPlatform(String platform) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public VideoGame addVideoGame(VideoGame vg) {
		VideoGame videogame = new VideoGame();
		videogame = vg;
		em.getTransaction().begin();
		em.persist(videogame);
		em.flush();
		em.getTransaction().commit();
		return videogame;
	}
	
	@Override
	public VideoGame updateVideoGame(VideoGame vg) {
		em.getTransaction().begin();
		VideoGame videogame = em.find(VideoGame.class, vg.getId());
		videogame = vg;
		em.persist(videogame);
		em.flush();
		em.getTransaction().commit();
		return videogame;
	}
	
	@Override
	public void removeVideoGame(VideoGame vg) {
		em.getTransaction().begin();
		VideoGame videogame = new VideoGame();
		videogame = em.find(VideoGame.class, vg.getId());
		em.remove(videogame);
		em.getTransaction().commit();
	}

}
