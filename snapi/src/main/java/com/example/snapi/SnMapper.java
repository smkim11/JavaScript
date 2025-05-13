package com.example.snapi;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface SnMapper {
	@Select("select sn from tsn where sn=#{sn}")
	public String selectSn(String sn);
}
