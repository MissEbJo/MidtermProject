package com.skilldistillery.fomogaming.data;

import java.util.List;

import com.skilldistillery.fomogaming.entities.Platform;



public interface PlatformDAO {

	public Platform addPlatform(Platform platform);

	public Platform updatePlatform(Platform platform);

	public void removePlatform(Platform platform);
	
}
