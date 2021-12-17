package com.skilldistillery.fomogaming.data;

import com.skilldistillery.fomogaming.entities.TvShow;

public interface TvShowDAO {

	public void removeTvShow(TvShow tvs);
	
	public TvShow updateTvShow(TvShow tvs);

	TvShow addTvShow(TvShow tvs, int gameId, int seriesId);
	
}
