package com.skilldistillery.fomogaming.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class GameSeriesTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private GameSeries gameSeries;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf= Persistence.createEntityManagerFactory("JPAFomoGaming");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		gameSeries = em.find(GameSeries.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		gameSeries = null;
	}

	@Test
	void test_GameSeries_Mapping() {
		assertNotNull(gameSeries);
		assertEquals("The Legend of Zelda", gameSeries.getName());
	}

	@Test
	@DisplayName("Testing GameSeries to TvShow mapping")
	void test2() {
		gameSeries = em.find(GameSeries.class, 8);
		assertNotNull(gameSeries);
		assertEquals("THE WITCHER", gameSeries.getTvShows().get(0).getTitle());
	}
	
	@Test
	@DisplayName("Testing GameSeries to VideoGame mapping")
	void test3() {
		gameSeries = em.find(GameSeries.class, 5);
		assertNotNull(gameSeries);
		assertEquals(1, gameSeries.getVideoGames().get(0).getId());
	}
	
	@Test
	@DisplayName("Testing GameSeries to book mapping")
	void test4() {
		gameSeries = em.find(GameSeries.class, 8);
		assertNotNull(gameSeries);
		assertEquals(1, gameSeries.getBooks().size());
	}
	
	@Test
	@DisplayName("Testing GameSeries to Movie mapping")
	void test5() {
		gameSeries = em.find(GameSeries.class, 9);
		assertNotNull(gameSeries);
		assertEquals(1, gameSeries.getMovies().size());
	}
	
	
}
