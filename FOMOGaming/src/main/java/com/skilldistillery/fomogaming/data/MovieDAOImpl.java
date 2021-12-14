package com.skilldistillery.fomogaming.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.fomogaming.entities.Movie;
import com.skilldistillery.fomogaming.entities.User;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Repository
@Transactional
public class MovieDAOImpl  implements MovieDAO{

	@PersistenceContext
	private EntityManager em;

@Override
public Movie addMovie(Movie movie) {
	Movie mv = new Movie();
	mv = movie;
	em.getTransaction().begin();
	em.persist(mv);
	em.flush();
	em.getTransaction().commit();
	return mv;
}

@Override
public Movie updateMovie(Movie mv) {
	em.getTransaction().begin();
	Movie movie = em.find(Movie.class, mv.getId());
	movie = mv;
	em.persist(movie);
	em.flush();
	em.getTransaction().commit();
	return movie;
}

@Override
public void removeMovie(Movie mv) {
	em.getTransaction().begin();
	Movie movie = new Movie();
	movie = em.find(Movie.class, mv.getId());
	em.remove(movie);
	em.getTransaction().commit();
}


}
