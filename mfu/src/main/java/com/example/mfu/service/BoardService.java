package com.example.mfu.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.mfu.dto.Board;
import com.example.mfu.dto.BoardForm;
import com.example.mfu.dto.Boardfile;
import com.example.mfu.exception.AddBoardException;
import com.example.mfu.mapper.BoardMapper;
import com.example.mfu.mapper.BoardfileMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class BoardService {
	@Autowired BoardMapper boardMapper;
	@Autowired BoardfileMapper boardfileMapper;
	
	// 전체 리스트
	public List<Board> boardList(){
		return boardMapper.boardList();
	}
	
	// 번호에 맞는 Board하나
	public Board boardListByNo(int boardNo) {
		return boardMapper.boardListByNo(boardNo);
	}
	
	// boardNo에 해당하는 boardfile 리스트
	public List<Boardfile> boardOne(int boardNo) {
		
		return boardfileMapper.selectBoardOne(boardNo);
	}
	
	// board 수정
	public void updateBoard(Board board) {
		boardMapper.updateBoard(board);
	}
	
	// boardfile 삭제
	public void deleteBoardfile(int boardfileNo) { 
		// 파일에서 삭제 후 DB삭제
		Boardfile boardfile = boardfileMapper.selectBoardfileOne(boardfileNo);
		File file = new File("C:/project/upload2/"+boardfile.getFilename());
		if(file.exists()) {
			file.delete();
		}
		boardfileMapper.deleteBoardfile(boardfileNo);
	}
	// board, boardfile 추가
	public void addBoard(BoardForm boardForm) {
		// 1) board 추가
		Board board = new Board();
		board.setBoardTitle(boardForm.getBoardTitle()); // board.getBoardNo() ==> 0
		int addBoardRow = boardMapper.insertBoard(board); // 실행 후 board.setBoardNo(key)
		log.info("board.getBoardNo(): "+board.getBoardNo());
		if(addBoardRow !=1) { // key값이 넘어오지 않으면 예외처리
			throw new AddBoardException();
		}
		
		// 2) boardfile 추가
		if(boardForm.getBoardfile() != null) {
			for(MultipartFile f : boardForm.getBoardfile()) {
				// getBoardfile size만큼 입력
				Boardfile bf = new Boardfile();
				bf.setBoardNo(board.getBoardNo());
				bf.setFiletype(f.getContentType());
				String filename = UUID.randomUUID().toString().replace("-",""); 
				filename += f.getOriginalFilename().substring(f.getOriginalFilename().lastIndexOf(".")); // .확장자 추가
				bf.setFilename(filename);
				
				int addBoardfileRow = boardfileMapper.insertBoardfile(bf);
				if(addBoardfileRow !=1) { // key값이 넘어오지 않으면 예외처리
					throw new AddBoardException();
				}
				
				// 3) 파일 저장
				File emptyFile = new File("c:/project/upload2/"+ filename);
				// f안에 파일스트림을 emptyFile로 이동
				try {
					f.transferTo(emptyFile);
				} catch (IllegalStateException | IOException e) {
					throw new AddBoardException(); // try...catch 예외를 강제하지 않는 예외로 변경해서 발생
				}
			}
		}
		
	}
	
}
