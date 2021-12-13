package com.skilldistillery.fomogaming.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.fomogaming.entities.BoardGame;
import com.skilldistillery.fomogaming.entities.User;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Repository
@Transactional
public class BoardGameDAOImpl implements BoardGameDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public BoardGame addBoardGame(BoardGame bg) {
		BoardGame boardGame = new BoardGame();
		boardGame = bg;
		em.getTransaction().begin();
		em.persist(bg);
		em.flush();
		em.getTransaction().commit();

		return boardGame;
	}

	@Override
	public BoardGame updateBoardGame(BoardGame bg) {
		// TODO Auto-generated method stub
		return bg;
	}

	@Override
	public void removeBoardGame(BoardGame bg) {
		// TODO Auto-generated method stub
		
	}
	

}
