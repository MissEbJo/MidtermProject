package com.skilldistillery.fomogaming.data;

import com.skilldistillery.fomogaming.entities.Book;

public interface BookDAO {


	Book updateBook(Book bk);

	void removeBook(Book bk);

	Book addBook(Book bk, int seriesId);
	
}
