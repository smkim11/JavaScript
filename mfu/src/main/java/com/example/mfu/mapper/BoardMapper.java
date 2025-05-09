package com.example.mfu.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.mfu.dto.Board;

@Mapper
public interface BoardMapper {
	Integer insertBoard(Board board);
}
