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

class BoardGameTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private BoardGame bGame;

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
		bGame = em.find(BoardGame.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		bGame = null;
	}

	@Test
	@DisplayName("test BoardGame mappings")
	void test1() {
		assertNotNull(bGame);
		assertEquals("Dark Souls: The Board Game", bGame.getName());
		assertEquals(2017, bGame.getReleaseYear());
		
	}
	
	@Test
	@DisplayName("test BoardGame to Developer (Many to One) mappings")
	void test2() {
		assertNotNull(bGame);
		assertEquals(20, bGame.getDeveloperId().getId());
		
	}

	@Test
	@DisplayName("test BoardGame to Video Game (Many to One) mappings")
	void test3() {
		assertNotNull(bGame);
		assertEquals(22, bGame.getVideoGame().getId());
	}

}
