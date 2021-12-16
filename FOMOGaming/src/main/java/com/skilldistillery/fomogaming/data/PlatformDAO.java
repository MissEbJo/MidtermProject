package com.skilldistillery.fomogaming.data;

import java.util.ArrayList;
import java.util.List;

import com.skilldistillery.fomogaming.entities.Platform;



public interface PlatformDAO {

	public Platform addPlatform(Platform platform);

	public Platform updatePlatform(Platform platform);

	public void removePlatform(Platform platform);


	public List<Platform> findPlatformByName(String [] names);

	List<Platform> getAllPlatforms();
	
}
