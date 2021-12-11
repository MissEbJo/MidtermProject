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

class DeveloperTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Developer develop;

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
		develop = em.find(Developer.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		develop = null;
	}

	@Test
	@DisplayName("test Developer mappings")
	void test1() {
		assertNotNull(develop);
		assertEquals("Capcom", develop.getName());
		assertEquals(1979, develop.getFoundingYear());
	}
	
	@Test
	@DisplayName("test Developer to BoardGame: list of board games mappings")
	void test2() {
		assertNotNull(develop);
		assertNotNull(develop.getBoardgames());
	}
	
	@Test
	@DisplayName("test Developer to Video Game mappings")
	void test3() {
		assertNotNull(develop);
		assertTrue(develop.getVideogames().size() > 0);
		assertEquals(6, develop.getVideogames().get(0).getId());
	}

}
