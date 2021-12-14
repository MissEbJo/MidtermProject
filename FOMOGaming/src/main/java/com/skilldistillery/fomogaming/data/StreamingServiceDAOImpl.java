package com.skilldistillery.fomogaming.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.fomogaming.entities.StreamingService;
import com.skilldistillery.fomogaming.entities.User;
import com.skilldistillery.fomogaming.entities.VideoGame;

@Repository
@Transactional
public class StreamingServiceDAOImpl implements StreamingServiceDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public StreamingService addStreamingService(StreamingService ss) {
		StreamingService streamingservice = new StreamingService();
		streamingservice = ss;
		
		em.persist(streamingservice);
		em.flush();
		
		
		return streamingservice;
	}

	@Override
	public StreamingService updateStreamingService(StreamingService ss) {
		
		StreamingService streamingservice = em.find(StreamingService.class, ss.getId());
		streamingservice = ss;
		em.persist(streamingservice);
		em.flush();
		
		
		return streamingservice;
		
		
	}

	@Override
	public StreamingService removeStreamingService(StreamingService ss) {
		StreamingService streamingservice = em.find(StreamingService.class, 1);
		streamingservice = ss;
		
		em.remove(streamingservice);
		
		
		return streamingservice;
		
		
		
	}

	

	
	

	

}
