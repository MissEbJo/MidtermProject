package com.skilldistillery.fomogaming.methods;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.fomogaming.data.VideoGameDAO;
import com.skilldistillery.fomogaming.entities.VideoGame;

@SpringBootTest
class VideoGameDAOTest {

	@Autowired
	private VideoGameDAO gameDao;


	@Test
	@DisplayName("test method Search By Genre")
	void test1() {
		List<VideoGame> genreList = gameDao.searchByGenre("action");
		assertNotNull(genreList);
		assertTrue(genreList.size() > 0);
//		assertEquals(7, genreList.size());
	}
	
	@Test
	@DisplayName("test method Search by Name")
	void test2() {
		List<VideoGame> titleList = gameDao.searchByName("The Witcher");
		
		assertNotNull(titleList);
		
	}
	
	@Test
	@DisplayName("test method Search by Release Year")
	void test3() {
		List<VideoGame> yearList = gameDao.searchByReleaseYear(2017);
		
		assertNotNull(yearList);
		assertTrue(yearList.size() > 0);
	}
	

}
