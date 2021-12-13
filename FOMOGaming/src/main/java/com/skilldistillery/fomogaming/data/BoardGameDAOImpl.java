package com.skilldistillery.fomogaming.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.fomogaming.entities.BoardGame;

@Transactional
@Service
public class BoardGameDAOImpl implements BoardGameDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public BoardGame addBoardGame(BoardGame bg) {
		BoardGame boardGame = new BoardGame();
		boardGame = bg;
		em.getTransaction().begin();
		em.persist(boardGame);
		em.flush();
		em.getTransaction().commit();
		return boardGame;
	}

	@Override
	public BoardGame updateBoardGame(BoardGame bg) {
		em.getTransaction().begin();
		BoardGame boardGame = em.find(BoardGame.class, bg.getId());
		boardGame = bg;
		em.persist(boardGame);
		em.flush();
		em.getTransaction().commit();
		return boardGame;
	}

	@Override
	public void removeBoardGame(BoardGame bg) {
		em.getTransaction().begin();
		BoardGame boardGame = new BoardGame();
		boardGame = em.find(BoardGame.class, bg.getId());
		em.remove(boardGame);
		em.getTransaction().commit();
	}
	

}
