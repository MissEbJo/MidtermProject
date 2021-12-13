package com.skilldistillery.fomogaming.data;

import java.util.List;

import com.skilldistillery.fomogaming.entities.StreamingService;
import com.skilldistillery.fomogaming.entities.User;
import com.skilldistillery.fomogaming.entities.VideoGame;

public interface StreamingServiceDAO {

	public StreamingService addStreamingService(StreamingService ss);

	public StreamingService updateStreamingService(StreamingService ss);

	public StreamingService removeStreamingService(StreamingService ss);
}
