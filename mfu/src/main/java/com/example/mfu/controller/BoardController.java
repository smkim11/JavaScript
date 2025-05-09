package com.example.mfu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mfu.dto.Board;
import com.example.mfu.dto.BoardForm;
import com.example.mfu.dto.Boardfile;
import com.example.mfu.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {
	@Autowired BoardService boardService;
	
	// 전체 리스트
	@GetMapping({"/","/boardList"})
	public String boardList(Model model) {
		List<Board> list = boardService.boardList();
		model.addAttribute("list",list);
		return "boardList";
	}
	
	// 상세 페이지
	@GetMapping("/boardOne")
	public String boardOne(Model model,@RequestParam int boardNo) {
		List<Boardfile> list = boardService.boardOne(boardNo);
		model.addAttribute("list",list);
		return "boardOne";
	}
	
	// 추가
	@GetMapping("/addBoard")
	public String addBoard() {
		return "addBoard";
	}
	
	@PostMapping("/addBoard")
	public String addBoard(BoardForm boardForm) {
		log.info(boardForm.toString());
		boardService.addBoard(boardForm);
		return "redirect:/";
	}
	
	// 수정
	@GetMapping("/updateBoard")
	public String updateBoard(Model model,@RequestParam int boardNo) {
		Board b = boardService.boardListByNo(boardNo);
		model.addAttribute("b", b);
		return "updateBoard";
	}
	
	@PostMapping("/updateBoard")
	public String updateBoard(Board board) {
		boardService.updateBoard(board);
		return "redirect:/";
	}
	
	// 삭제
	@GetMapping("/deleteBoardfile")
	public String deleteBoardfile(@RequestParam int boardNo, @RequestParam int boardfileNo) {
		boardService.deleteBoardfile(boardfileNo);
		return "redirect:/boardOne?boardNo="+boardNo;
	}
}
