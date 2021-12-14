package com.skilldistillery.fomogaming.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.fomogaming.entities.Book;

@Repository
@Transactional
public class BookDAOImpl implements BookDAO{

	@PersistenceContext
	private EntityManager em;

	@Override
	public Book addBook(Book bk) {
		Book book = new Book();
		book = bk;
		em.getTransaction().begin();
		em.persist(book);
		em.flush();
		em.getTransaction().commit();
		return book;
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


