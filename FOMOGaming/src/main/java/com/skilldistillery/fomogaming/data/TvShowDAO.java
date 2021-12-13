package com.skilldistillery.fomogaming.data;

import com.skilldistillery.fomogaming.entities.TvShow;

public interface TvShowDAO {

	public TvShow addTvShow(TvShow tvs);
	
	public void removeTvShow(TvShow tvs);
	
	public TvShow updateTvShow(TvShow tvs);
	
}
