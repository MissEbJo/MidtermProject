package com.skilldistillery.fomogaming.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.fomogaming.entities.GameSeries;
import com.skilldistillery.fomogaming.entities.Genre;
import com.skilldistillery.fomogaming.entities.Platform;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Repository
@Transactional
public class VideoGameDAOImpl implements VideoGameDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public VideoGame searchForGameById(int id) {
		VideoGame singleGame = new VideoGame();

		String query = "SELECT v FROM VideoGame v WHERE id = :id";

		singleGame = em.createQuery(query, VideoGame.class).setParameter("id", id).getSingleResult();

		return singleGame;
	}

	@Override
	public VideoGame searchForGame(String name) {
		VideoGame singleGame = new VideoGame();

		String query = "SELECT v FROM VideoGame v WHERE name = :name";

		singleGame = em.createQuery(query, VideoGame.class).setParameter("name", name).getSingleResult();

		return singleGame;
	}

	@Override
	public List<VideoGame> searchByName(String name) {
		List<VideoGame> titleList = new ArrayList<>();

		String query = "SELECT v FROM VideoGame v WHERE name LIKE '%" + name + "%'";
		titleList = em.createQuery(query, VideoGame.class).getResultList();
		return titleList;
	}

	@Override
	public List<VideoGame> searchByKeyword(String keyword) {
		List<VideoGame> keywordList = new ArrayList<>();

		String query = "SELECT v FROM VideoGame v WHERE description LIKE '%" + keyword + "%'";

		keywordList = em.createQuery(query, VideoGame.class).getResultList();

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

		String query = "SELECT v FROM VideoGame v JOIN v.genres g WHERE g.name LIKE '%" + genre + "%'";

		genreList = em.createQuery(query, VideoGame.class).getResultList();

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

		String query = "SELECT v FROM VideoGame v JOIN v.developer d WHERE d.name LIKE '%" + developer + "%'";

		developerList = em.createQuery(query, VideoGame.class).getResultList();

		return developerList;
	}

	@Override
	public List<VideoGame> searchByGameSeries(String gameSeries) {

		List<VideoGame> seriesList = new ArrayList<>();

		String query = "SELECT v FROM VideoGame v JOIN v.gameSeries g WHERE g.name LIKE '%" + gameSeries + "%'";

		seriesList = em.createQuery(query, VideoGame.class).getResultList();

		return seriesList;
	}

	@Override
	public VideoGame addVideoGame(VideoGame vg, int seriesId, List<Platform> platformsList, List<Genre> genres) {
		// check to make sure there is no other game with the same name
		String query = "SELECT g FROM VideoGame g";
		List<VideoGame> allGames = em.createQuery(query, VideoGame.class).getResultList();
		for (VideoGame videoGame : allGames) {
			if (vg.getName().equals(videoGame.getName())) {
				vg = null;
				return vg;
			}
		}
		
		if (genres != null && genres.size() > 0) {
			for (Genre genre : genres) {
				genre.getVideoGames().add(vg);
			}
			vg.setGenres(genres);
		}
		if (platformsList != null && platformsList.size() > 0) {
			for (Platform platform : platformsList) {
				platform.getVideoGames().add(vg);
			}
			vg.setPlatforms(platformsList);
		}
		if (seriesId > 0) {
			GameSeries gs = em.find(GameSeries.class, seriesId);
			vg.setGameSeries(gs);
//			String query = "SELECT g FROM VideoGame g";
//			List<VideoGame> allGames = em.createQuery(query, VideoGame.class).getResultList();
//			for (VideoGame videoGame : allGames) {
//				if (vg.getName().equals(videoGame.getName())) {
//					vg = null;
//				}
//			}
			em.persist(vg);
		} else {
				em.persist(vg);
			}
		return vg;
		}
	

	@Override
	public VideoGame updateVideoGame(VideoGame vg) {
		VideoGame videogame = em.find(VideoGame.class, vg.getId());
//		videogame = vg; //call setters (not id)
		videogame.setName(vg.getName());
		videogame.setDescription(vg.getDescription());
		videogame.setCrossPlatform(vg.isCrossPlatform());
		videogame.setReleaseYear(vg.getReleaseYear());
		videogame.setSinglePlayer(vg.getSinglePlayer());
		videogame.setMultiPlayer(vg.getMultiPlayer());
		videogame.setImageUrl(vg.getImageUrl());
		videogame.setNumberInSeries(vg.getNumberInSeries());
		videogame.setGameSeries(vg.getGameSeries());
		videogame.setDeveloper(vg.getDeveloper());

		return videogame;
	}

	@Override
	public void removeVideoGame(VideoGame vg) {
		VideoGame videogame = new VideoGame();
		videogame = em.find(VideoGame.class, vg.getId());
		em.remove(videogame);
	}

	@Override
	public List<GameSeries> getAllSeries() {
		List<GameSeries> series = new ArrayList<>();
		String query = "SELECT s FROM GameSeries s";
		series = em.createQuery(query, GameSeries.class).getResultList();

		return series;
	}

	@Override
	public List<VideoGame> randomGames(int n) {
		List<VideoGame> r = new ArrayList<>();
		List<VideoGame> allGames = new ArrayList<>();
		String query = "SELECT g FROM VideoGame g";
		allGames = em.createQuery(query, VideoGame.class).getResultList();
		int random;
		while (r.size() < n) {
			random = (int) (Math.random() * allGames.size());
			VideoGame vg = em.find(VideoGame.class, random);
			if ((!r.contains(vg)) && (vg != null)) {
				r.add(vg);
			}
		}
		return r;
	}
	
	@Override
	public List<VideoGame> getAllGames() {
		String query = "SELECT g FROM VideoGame g";
		List<VideoGame> allGames = em.createQuery(query, VideoGame.class).getResultList();
		return allGames;
	}

}
