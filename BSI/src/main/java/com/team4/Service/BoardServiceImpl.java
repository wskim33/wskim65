package com.team4.Service;

import java.util.List;

import com.team4.mapper.BoardMapper;
import com.team4.vo.BoardVO;
import com.team4.vo.PagingVO;

import lombok.Setter;

public class BoardServiceImpl implements BoardService{
	
	@Setter
	private BoardMapper boardMapper;
	
	@Override
	public int writeBoard(BoardVO board) {
		
		boardMapper.insertBoard(board);
		
		return 0;
	}

	@Override
	public List<BoardVO> findAll() {
		
		List<BoardVO> boards = boardMapper.selectAll();
		
		return boards;
	}

	@Override
	public BoardVO findBoardByBoardNo(int boardNo) {
		BoardVO board = boardMapper.selectBoardByBoardNo(boardNo);
		return board;
	}
	@Override
	public void increaseBoardReadCount(int boardNo) {
		boardMapper.updateBoardReadCount(boardNo);
	}
	
	@Override
	public void deleteBoard(int boardNo) {
		boardMapper.updateBoardDeleted(boardNo);
	}
	
	@Override
	public void updateBoard(BoardVO board) {
		boardMapper.updateBoard(board);
	}

	@Override
	public int countBoard() {
		return boardMapper.countBoard();
	}

	@Override
	public List<BoardVO> selectBoard(PagingVO vo) {
		return boardMapper.selectBoard(vo);
	}

}
