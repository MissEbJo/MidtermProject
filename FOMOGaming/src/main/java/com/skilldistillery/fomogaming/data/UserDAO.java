package com.skilldistillery.fomogaming.data;

import com.skilldistillery.fomogaming.entities.User;

public interface UserDAO {

	User findByUsername(String username);
	
}
