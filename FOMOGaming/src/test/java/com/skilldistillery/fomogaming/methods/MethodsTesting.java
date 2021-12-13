package com.skilldistillery.fomogaming.methods;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.fomogaming.data.UserDAO;
import com.skilldistillery.fomogaming.entities.VideoGame;

@SpringBootTest
class MethodsTesting {

	@Autowired
	private UserDAO userDao;


	@Test
	@DisplayName("test method gamesInAction")
	void test1() {
		List<VideoGame> genreList = userDao.listorSearchGamesByGenre("action");
		assertNotNull(genreList);
		assertTrue(genreList.size() > 0);
//		assertEquals(7, genreList.size());
	}
	

}
