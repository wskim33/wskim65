package com.team4.Service;

import java.util.List;

import com.team4.vo.BoardVO;
import com.team4.vo.PagingVO;

public interface BoardService {

	int writeBoard(BoardVO board);
	
	List<BoardVO> findAll();

	BoardVO findBoardByBoardNo(int boardNo);

	void deleteBoard(int boardNo);

	void increaseBoardReadCount(int boardNo);

	void updateBoard(BoardVO board);

	int countBoard();

	List<BoardVO> selectBoard(PagingVO vo);

}
