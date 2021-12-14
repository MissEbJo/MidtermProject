package com.skilldistillery.fomogaming.data;

import com.skilldistillery.fomogaming.entities.Movie;

public interface MovieDAO {

	Movie addMovie(Movie movie);

	Movie updateMovie(Movie mv);

	void removeMovie(Movie mv);

	
}
