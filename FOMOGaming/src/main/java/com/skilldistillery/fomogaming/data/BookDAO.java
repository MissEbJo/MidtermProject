package com.skilldistillery.fomogaming.data;

import com.skilldistillery.fomogaming.entities.Book;

public interface BookDAO {

	public Book addBook(Book bk);

	Book updateBook(Book bk);

	void removeBook(Book bk);
	
}
