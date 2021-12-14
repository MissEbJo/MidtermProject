package com.skilldistillery.fomogaming.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.fomogaming.entities.TvShow;

@Repository
@Transactional
public class TvShowDAOImpl implements TvShowDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public TvShow addTvShow(TvShow tvs) {
		TvShow tvShow = new TvShow();
		tvShow = tvs;
		em.getTransaction().begin();
		em.persist(tvShow);
		em.flush();
		em.getTransaction().commit();
		return tvShow;
	}

	@Override
	public TvShow updateTvShow(TvShow tvs) {
		em.getTransaction().begin();
		TvShow tvShow = em.find(TvShow.class, tvs.getId());
		tvShow = tvs;
		em.persist(tvShow);
		em.flush();
		em.getTransaction().commit();
		return tvShow;
	}

	@Override
	public void removeTvShow(TvShow tvs) {
		em.getTransaction().begin();
		TvShow tvShow = new TvShow();
		tvShow = em.find(TvShow.class, tvs.getId());
		em.remove(tvShow);
		em.getTransaction().commit();
	}
}
