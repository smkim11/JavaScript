package com.example.mfu.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.mfu.dto.Boardfile;

@Mapper
public interface BoardfileMapper {
	Integer insertBoardfile(Boardfile boardfile);
}
