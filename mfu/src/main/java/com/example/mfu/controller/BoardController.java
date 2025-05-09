package com.example.mfu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.mfu.dto.BoardForm;
import com.example.mfu.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {
	@Autowired BoardService boardService;
	
	@GetMapping({"/","/addBoard"})
	public String addBoard() {
		return "addBoard";
	}
	
	@PostMapping("/addBoard")
	public String addBoard(BoardForm boardForm) {
		log.info(boardForm.toString());
		// boardService.addBoard(boardForm);
		return "redirect:/";
	}
}
