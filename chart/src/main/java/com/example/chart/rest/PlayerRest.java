package com.example.chart.rest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.chart.mapper.PlayerMapper;

@RestController
public class PlayerRest {
	@Autowired PlayerMapper playerMapper;
	
	// 나라별 평균 나이
	@PostMapping("/rest/avgAgeByCountry")
	public List<Map<String,Object>> avgAgeByCountry(){
		return playerMapper.selectAvgAgeByCountry();
	}
	
	// 성별 가입자 수
	@PostMapping("/rest/countByGender")
	public List<Map<String,Object>> countByGender(){
		return playerMapper.selectCountByGender();
	}
	
	//년도별 나라별 가입자 수
	@PostMapping("/rest/countByYearAndCountry")
	public List<Map<String,Object>> countByYearAndCountry(){
		return playerMapper.selectCountByYearAndCountry();
	}
	
	// 년도별 전체 누적 가입자 수
	@PostMapping("/rest/totalCountByYear")
	public List<Map<String,Object>> totalCountByYear(){
		return playerMapper.selectTotalCountByYear();
	}
}
