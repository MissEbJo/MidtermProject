package com.skilldistillery.fomogaming.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.fomogaming.entities.Book;
import com.skilldistillery.fomogaming.entities.GameSeries;

@Repository
@Transactional
public class BookDAOImpl implements BookDAO{

	@PersistenceContext
	private EntityManager em;

	@Override
	public Book addBook(Book bk, int seriesId) {
		if (seriesId > 0) {
			GameSeries gs = em.find(GameSeries.class, seriesId);
			bk.setGameSeriesId(gs);
		}
		em.persist(bk);
		return bk;
	}
	
	@Override
	public Book updateBook(Book bk) {
		em.getTransaction().begin();
		Book book = em.find(Book.class, bk.getId());
		book = bk;
		em.persist(book);
		em.flush();
		em.getTransaction().commit();
		return book;
	}
	
	@Override
	public void removeBook(Book bk) {
		em.getTransaction().begin();
		Book book = new Book();
		book = em.find(Book.class, bk.getId());
		em.remove(book);
		em.getTransaction().commit();
	}
}


