package com.team4.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team4.vo.BoardVO;
import com.team4.vo.PagingVO;

@Mapper
public interface BoardMapper {

	void insertBoard(BoardVO board);
	
	List<BoardVO> selectAll();

	BoardVO selectBoardByBoardNo(int boardNo);

	void updateBoardDeleted(int boardNo);

	void updateBoardReadCount(int boardNo);
	
	void updateBoard(BoardVO board);

	int countBoard();

	List<BoardVO> selectBoard(PagingVO vo);
	
	

}
