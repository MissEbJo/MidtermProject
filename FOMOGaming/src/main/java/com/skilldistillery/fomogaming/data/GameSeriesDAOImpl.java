package com.skilldistillery.fomogaming.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.fomogaming.entities.GameSeries;

@Repository
@Transactional
public class GameSeriesDAOImpl implements GameSeriesDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public GameSeries findSeriesById(int Id) {
		
		GameSeries gs = new GameSeries();
		gs = em.find(GameSeries.class, Id);
		return gs;
	}

}
