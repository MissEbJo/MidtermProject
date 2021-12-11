package com.skilldistillery.fomogaming.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class VideoGameTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private VideoGame vg;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAFomoGaming");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		vg = em.find(VideoGame.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		vg = null;
	}

	@Test
	@DisplayName("Test Video Game basic mapping")
	void test() {
		assertNotNull(vg);
		assertEquals("Horizon Zero Dawn", vg.getName());
		assertEquals(2017, vg.getReleaseYear());
	}
	
	@Test
	@DisplayName("Test Video Game to Genre mapping")
	void test2() {
		assertNotNull(vg);
		assertTrue(vg.getGenres().size() > 0);
		assertEquals(3, vg.getGenres().size());
	}
	
	@Test
	@DisplayName("Test Video Game to Game Series mapping")
	void test3() {
		assertNotNull(vg);
		assertEquals("Horizon", vg.getGameSeries().getName());
	}

	@Test
	@DisplayName("Test Video Game to TV Show mapping")
	void test4() {
		vg = null;
		vg = em.find(VideoGame.class, 21);
		assertNotNull(vg);
		assertEquals("THE WITCHER", vg.getTvShows().get(0).getTitle());
		assertTrue(vg.getTvShows().size() > 0);
	}
	
	@Test
	@DisplayName("Test Video Game to Developer mapping")
	void test5() {
		assertNotNull(vg);
		assertEquals("Guerrilla Games", vg.getDeveloper().getName());
	}
	
	@Test
	@DisplayName("Test Video Game to Board Game mapping")
	void test6() {
		vg = null;
		vg = em.find(VideoGame.class, 22);
		assertNotNull(vg);
		assertEquals("Dark Souls: The Board Game", vg.getBoardGames().get(0).getName());
	}
	
	@Test
	@DisplayName("Test Video Game to Platform mapping")
	void test7() {
		assertNotNull(vg);
		assertEquals(2, vg.getPlatforms().size());
	}
	
	@Test
	@DisplayName("Test Video Game to User mapping")
	void test8() {
		assertNotNull(vg);
		assertEquals(1, vg.getUsers().size());
	}
	
}
