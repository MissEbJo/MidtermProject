package com.skilldistillery.fomogaming.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.fomogaming.entities.Genre;

@Repository
@Transactional
public class GenreDAOImpl implements GenreDAO{

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Genre> getAllGenres() {
		String query = "SELECT s FROM Genre s";
		List<Genre> genres = em.createQuery(query, Genre.class).getResultList();

		return genres;
	}

	@Override
	public List<Genre> findGenreByName(String [] names) {
		List<Genre> genres = new ArrayList<>();
		if (names != null && names.length > 0) {
		for (String name: names) {
			String query = "SELECT g FROM Genre g WHERE name = :name";
			Genre g = em.createQuery(query, Genre.class).setParameter("name", name).getSingleResult();
			genres.add(g);
		}
		}
		return genres;
	}

}
