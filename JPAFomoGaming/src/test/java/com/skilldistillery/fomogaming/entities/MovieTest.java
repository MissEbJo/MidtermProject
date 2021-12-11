package com.skilldistillery.fomogaming.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class MovieTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Movie movie;

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
		movie = em.find(Movie.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		movie = null;
	}

	@Test
	void test() {
		assertNotNull(movie);
		assertEquals("Warcraft", movie.getTitle());
		
	}
	
	@Test
	@DisplayName("test Movie Many to Many Streaming Service mapping")
	void test1() {
		assertNotNull(movie);
		assertEquals("Prime Video", movie.getSs().get(0).getName());
		
	}
	
	@Test
	@DisplayName("test Movie Many to One Game Series mapping")
	void test2() {
		assertNotNull(movie);
		assertEquals("Warcraft", movie.getGameSeries().getName());
	}
}