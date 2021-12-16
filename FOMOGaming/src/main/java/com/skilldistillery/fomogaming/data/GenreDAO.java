package com.skilldistillery.fomogaming.data;

import java.sql.Array;
import java.util.List;

import com.skilldistillery.fomogaming.entities.Genre;

public interface GenreDAO {

	List<Genre> getAllGenres();

	List<Genre> findGenreByName(String[] names);
// hello :)
}
