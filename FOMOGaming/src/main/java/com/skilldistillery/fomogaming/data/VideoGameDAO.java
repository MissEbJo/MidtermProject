package com.skilldistillery.fomogaming.data;

import java.util.List;

import com.skilldistillery.fomogaming.entities.VideoGame;

public interface VideoGameDAO {

	public List<VideoGame> searchByName(String name);

	public List<VideoGame> searchByKeyword(String keyword);

	public List<VideoGame> searchByReleaseYear(int year);

	public List<VideoGame> searchByMode(String mode);

	public List<VideoGame> searchByGenre(String genre);

	public List<VideoGame> searchByPlatform(String platform);
	
	public VideoGame addVideoGame(VideoGame newGame);
	
	public VideoGame updateVideoGame(VideoGame vg);
	
	public void removeVideoGame(VideoGame vg);

}
