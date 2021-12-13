package com.skilldistillery.fomogaming.methods;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.fomogaming.data.UserDAO;
import com.skilldistillery.fomogaming.data.UserDAOImpl;
import com.skilldistillery.fomogaming.entities.VideoGame;

class MethodsTesting {

	private UserDAO userDao;

	@BeforeEach
	void setUp() throws Exception {
		userDao = new UserDAOImpl();
	}

	@AfterEach
	void tearDown() throws Exception {
		userDao = null;
	}

	@Test
	@DisplayName("test method gamesInAction")
	void test1() {
		
		List<VideoGame> actions = userDao.gamesInAction();
		assertNotNull(actions);
	}
	

}
