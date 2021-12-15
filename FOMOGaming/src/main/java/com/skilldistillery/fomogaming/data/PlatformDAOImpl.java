package com.skilldistillery.fomogaming.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.fomogaming.entities.Platform;
import com.skilldistillery.fomogaming.entities.TvShow;
import com.skilldistillery.fomogaming.entities.User;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Repository
@Transactional
public class PlatformDAOImpl implements PlatformDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Platform addPlatform(Platform platforms) {
		Platform platform = new Platform();
		platform = platforms;
		
		em.persist(platform);
		em.flush();
	
		return platform;
	}

	@Override
	public Platform updatePlatform(Platform platforms) {
		
		Platform platform = em.find(Platform.class, platforms.getId());
		platform = platforms;
		em.persist(platform);
		em.flush();
		
		return platform;
	}

	@Override
	public void removePlatform(Platform platforms) {
		
		Platform platform = new Platform();
		platform = em.find(Platform.class, platforms.getId());
		em.remove(platform);
		
	}
}
