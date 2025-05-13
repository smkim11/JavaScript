package com.example.ajax.rest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.ajax.mapper.ContinentMapper;

@RestController
public class ContinentRest {
	@Autowired ContinentMapper continentMapper;
	
	@GetMapping("/countryList/{continentNo}")
	public List<Map<String,Object>> countryList(@PathVariable int continentNo){
		
		return continentMapper.selectCountryList(continentNo);
	}
	
	@GetMapping("/cityList/{countryNo}")
	public List<Map<String,Object>> cityList(@PathVariable int countryNo){
		
		return continentMapper.selectCityList(countryNo);
	}
}
