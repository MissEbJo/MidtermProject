package com.skilldistillery.fomogaming.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.http.HttpStatus.Series;
import org.springframework.stereotype.Repository;

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
		
		String query = "SELECT v FROM VideoGame v WHERE mode = :mode ";
		
		modeList = em.createQuery(query, VideoGame.class).setParameter("mode", mode).getResultList();
		
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
		List<VideoGame> modeList = new ArrayList<>();

		String query = "SELECT v FROM VideoGame v JOIN v.platforms p WHERE p.systemName = :platform";

		modeList = em.createQuery(query, VideoGame.class).setParameter("platform", platform).getResultList();
		
		return modeList;
	}

	@Override
	public List<VideoGame> searchByDeveloper(String developer) {
		
		List<VideoGame> developerList = new ArrayList<>();

		String query = "SELECT v FROM VideoGame v JOIN v.developer d WHERE d.name = :developer";

		developerList = em.createQuery(query, VideoGame.class).setParameter("developer", developer).getResultList();
		
		return developerList;
	}
	
	@Override
	public List<VideoGame> searchByGameSeries(String gameSeries) {
		
		List<VideoGame> seriesList = new ArrayList<>();
		
		String query = "SELECT v FROM VideoGame v JOIN v.gameSeries g WHERE g.name = :series";
		
		seriesList = em.createQuery(query, VideoGame.class).setParameter("series", gameSeries).getResultList();
		
		return seriesList;
	}
	
	@Override
	public VideoGame addVideoGame(VideoGame vg) {
		VideoGame videogame = new VideoGame();
		videogame = vg;
//		em.getTransaction().begin();
		em.persist(videogame);
		em.flush();
//		em.getTransaction().commit();
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

	@Override
	public List<Series> getAllSeries() {
		List<Series> series = new ArrayList<>();
		String query = "SELECT s FROM GameSeries s";
		series = em.createQuery(query, Series.class).getResultList();
		
		return series;
	}

}
