package com.skilldistillery.fomogaming.data;

import com.skilldistillery.fomogaming.entities.Movie;

public interface MovieDAO {


	Movie updateMovie(Movie mv);

	void removeMovie(Movie mv);

	Movie addMovie(Movie movie, int seriesId);

	
}
