package com.example.join.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.join.dto.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

	@GetMapping("/joinMember")
	public String joinMember() {
		return "joinMember"; // joinMember.jsp
	}
	
	@PostMapping("/joinMember")
	public String joinMember(MemberDto memberDto) {
		log.debug(memberDto.toString());
		return "redirect:/";
	}
}
