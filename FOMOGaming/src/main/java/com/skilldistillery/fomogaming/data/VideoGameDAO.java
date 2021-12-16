package com.skilldistillery.fomogaming.data;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus.Series;

import com.skilldistillery.fomogaming.entities.GameSeries;
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
	
	public VideoGame updateVideoGame(VideoGame vg);
	
	public void removeVideoGame(VideoGame vg);

	List<VideoGame> searchByGameSeries(String gameSeries);

	List<GameSeries> getAllSeries();

	VideoGame addVideoGame(VideoGame vg, int seriesId);

	List<VideoGame> randomGames(int n);

}
