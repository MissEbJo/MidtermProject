package com.skilldistillery.fomogaming.data;

import com.skilldistillery.fomogaming.entities.BoardGame;

public interface BoardGameDAO {

	public BoardGame updateBoardGame(BoardGame bg);
	
	public void removeBoardGame(BoardGame bg);

	public BoardGame addBoardGame(BoardGame bg);
	
}
