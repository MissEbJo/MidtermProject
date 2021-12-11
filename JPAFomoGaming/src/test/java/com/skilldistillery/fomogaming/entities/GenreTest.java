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

class GenreTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Genre genre;
	
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
		genre = em.find(Genre.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		genre = null;
	}

	@Test
	@DisplayName("Test basic mapping")
	void test_GameSeries_Mapping() {
		assertNotNull(genre);
		assertEquals("role playing", genre.getName());
	}

	@Test
	@DisplayName("Test mapping to Videogame")
	void test1() {
		assertNotNull(genre);
		assertTrue(0< genre.getVideoGames().size());
	}

}
