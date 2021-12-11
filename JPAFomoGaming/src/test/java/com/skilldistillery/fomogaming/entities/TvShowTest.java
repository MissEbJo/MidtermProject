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

class TvShowTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private TvShow tv;

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
		tv = em.find(TvShow.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		tv = null;
	}

	@Test
	@DisplayName("Test TV Show basic mapping")
	void test1() {
		assertNotNull(tv);
		assertEquals("THE WITCHER", tv.getTitle());
		assertEquals(1, tv.getNumberOfSeasons());
		assertEquals(2019, tv.getReleaseYear());
	}
	
	@Test
	@DisplayName("Test TV Show to Game Series mapping")
	void test2() {
		assertNotNull(tv);
		assertEquals("The Witcher", tv.getGameSeries().getName());
	}
	
	@Test
	@DisplayName("Test TV Show to Video Game mapping")
	void test3() {
		assertNotNull(tv);
		assertEquals("The Witcher", tv.getVideoGame().getName());
		assertEquals(21, tv.getVideoGame().getId());
	}
	
	@Test
	@DisplayName("Test TV Show to Streaming Service mapping")
	void test4() {
		assertNotNull(tv);
		assertTrue(tv.getStreamingService().size() > 0);
		assertEquals("Netflix", tv.getStreamingService().get(0).getName());
	}

}
