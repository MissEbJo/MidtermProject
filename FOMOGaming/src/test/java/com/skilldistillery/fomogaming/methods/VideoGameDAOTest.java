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
	
	@Test
	@DisplayName("test method Search by Mode")
	void test4() {
		List<VideoGame> modeList = gameDao.searchByMode("Single player");
		assertNotNull(modeList);
		assertTrue(modeList.size() > 0);
	}
	
	@Test
	@DisplayName("test method Search by Platform")
	void test5() {
		List<VideoGame> platformList = gameDao.searchByPlatform("Nintendo");
		assertNotNull(platformList);
		assertTrue(platformList.size() > 0);
	}

	@Test
	@DisplayName("test method Search by Developer")
	void test6() {
		List<VideoGame> developerList = gameDao.searchByDeveloper("Bungie");
		assertNotNull(developerList);
		assertTrue(developerList.size() > 0);
	}

	@Test
	@DisplayName("test method Search by Series")
	void test7() {
		List<VideoGame> seriesList = gameDao.searchBySeries("Horizon");
		assertNotNull(seriesList);
		assertTrue(seriesList.size() > 0);
	}
}

