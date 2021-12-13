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
	public List<VideoGame> searchByTitle(String title) {
		List<VideoGame> titleList = new ArrayList<>();
		
		String query = "SELECT v FROM VideoGame v WHERE title = :title";
		
		titleList = em.createQuery(query, VideoGame.class).setParameter("title", title).getResultList();
		return titleList;
	}

	@Override
	public List<VideoGame> searchByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<VideoGame> searchByReleaseYear(int year) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<VideoGame> searchByMode(String mode) {
		// TODO Auto-generated method stub
		return null;
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
	public VideoGame addGame(VideoGame newGame) {
		// TODO Auto-generated method stub
		return null;
	}


}
