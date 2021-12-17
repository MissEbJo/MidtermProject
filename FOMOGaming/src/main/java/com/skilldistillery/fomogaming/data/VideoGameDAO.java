package com.skilldistillery.fomogaming.data;

import java.util.List;

import com.skilldistillery.fomogaming.entities.GameSeries;
import com.skilldistillery.fomogaming.entities.Genre;
import com.skilldistillery.fomogaming.entities.Platform;
import com.skilldistillery.fomogaming.entities.VideoGame;

public interface VideoGameDAO {
	
	public VideoGame searchForGame(String name);

	public List<VideoGame> searchByName(String name);

	public List<VideoGame> searchByKeyword(String keyword);

	public List<VideoGame> searchByReleaseYear(int year);

	public List<VideoGame> searchByMode(String mode);

	public List<VideoGame> searchByGenre(String genre);

	public List<VideoGame> searchByPlatform(String platform);
	
	public List<VideoGame> searchByDeveloper(String developer);
	
	public void removeVideoGame(VideoGame vg);

	List<VideoGame> searchByGameSeries(String gameSeries);

	List<GameSeries> getAllSeries();

	public VideoGame addVideoGame(VideoGame vg, int seriesId, List<Platform> platformsList, List<Genre> genres);

	List<VideoGame> randomGames(int n);

	VideoGame searchForGameById(int id);

	List<VideoGame> getAllGames();

	VideoGame updateVideoGame(VideoGame vg, GameSeries gs, List<Platform> platforms, List<Genre> genres);

}
