package com.skilldistillery.fomogaming.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.fomogaming.entities.Platform;

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
	@Override
	public List<Platform> findPlatformByName(String [] names) {
		List<Platform> platforms = new ArrayList<>();
		for (String name: names) {
			String query = "SELECT p FROM Platform p WHERE systemName = :name";
			Platform p = em.createQuery(query, Platform.class).setParameter("name", name).getSingleResult();
			platforms.add(p);
			
		}
		return platforms;
	}
	
	@Override
	public List<Platform> getAllPlatforms() {
		String query = "Select p from Platform p";
		List<Platform >platforms = em.createQuery(query, Platform.class).getResultList();
		return platforms;
	}
}
