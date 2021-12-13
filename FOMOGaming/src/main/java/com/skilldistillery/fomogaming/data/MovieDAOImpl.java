package com.skilldistillery.fomogaming.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.fomogaming.entities.User;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Repository
@Transactional
public class MovieDAOImpl  {

	@PersistenceContext
	private EntityManager em;


}
