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

class StreamingServiceTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private StreamingService ss;

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
		ss = em.find(StreamingService.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		ss = null;
	}

	@Test
	void test() {
		assertNotNull(ss);
		assertEquals("Netflix", ss.getName());
	}

	@Test
	@DisplayName("test Streaming Service Many to Many Movie mapping")
	void test1() {
		ss = em.find(StreamingService.class, 2);
		assertNotNull(ss);
		assertTrue(ss.getMovies().size() > 0);
	}
	
}
