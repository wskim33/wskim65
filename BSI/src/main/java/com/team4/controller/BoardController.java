package com.team4.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team4.Service.BoardService;
import com.team4.vo.BoardVO;
import com.team4.vo.MembersVO;
import com.team4.vo.PagingVO;

@Controller
@RequestMapping(path = {"/board-khw"})
public class BoardController {

	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;
	
	@GetMapping(path = {"/list"})
	public String list(Model model, PagingVO vo, 
					@RequestParam(value = "nowPage", required = false)String nowPage, 
					@RequestParam(value = "cntPerPage", required = false)	String cntPerPage) {
		
		
		
		int total = boardService.countBoard();
		if(nowPage == null && cntPerPage == null) {
				nowPage ="1";
				cntPerPage="5";
		}else if(nowPage == null) {
				nowPage="1";
		}else if(cntPerPage == null) {
				cntPerPage="5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<BoardVO> list = boardService.selectBoard(vo);
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", list);
//		List<BoardVO> boards = boardService.findAll();
//		
//		model.addAttribute("boards", boards);
		
		return "board-khw/paging";
	}
	
	@GetMapping(path = { "/write" })
	public String showWriteForm() {
		
		return "board-khw/write";
	}
	
	@PostMapping(path = {"/write"})
	public String write(@ModelAttribute BoardVO board, HttpSession session, Model model) {
		
		MembersVO s = (MembersVO)session.getAttribute("loginuser"); // 세션에 저장된 로그인 유저값 불러오기
		
		board.setMemberId(s.getMemberId()); // 보드에 memberId 저장하기
		
		boardService.writeBoard(board);
		
		return "redirect:list";
	}
	
	
	@GetMapping(path = { "/detail" })
	public String detail(int boardNo, Model model) {
		
		BoardVO board = boardService.findBoardByBoardNo(boardNo);
		
		if (board == null) {
			return "redirect:list";
		}
		
		boardService.increaseBoardReadCount(boardNo);
		board.setReadCount(board.getReadCount() + 1);
		
		model.addAttribute("board", board);
		
		return "board-khw/detail";
	}
	
	@GetMapping(path = { "/delete" })
	public String delete(int boardNo) {
	
		boardService.deleteBoard(boardNo);
	
		return "redirect:list";
	}
	

	@GetMapping(path = { "/edit" })
	public String showEditForm(int boardNo, Model model) {

		BoardVO board = boardService.findBoardByBoardNo(boardNo);
		
		if (board == null) {
			return "redirect:list";
		}
	
		model.addAttribute("board", board);
	
		return "board-khw/edit";
	}
	
	@PostMapping(path = { "/update" })
	public String update(BoardVO board) {
		
		boardService.updateBoard(board);
		
		return "redirect:detail?boardNo=" + board.getBoardNo();
	}


	
}
