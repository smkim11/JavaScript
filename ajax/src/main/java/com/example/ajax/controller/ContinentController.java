package com.example.ajax.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.ajax.mapper.ContinentMapper;

@Controller
public class ContinentController {
	@Autowired ContinentMapper continentMapper;
	
	@GetMapping({"/","/continentList"})
	public String continentList(Model model,@RequestParam(defaultValue = "0") int country
										  , @RequestParam(defaultValue = "0") int continent
										  , @RequestParam(defaultValue = "0") int city) {
		//List<Map<String,Object>> list = continentMapper.selectContinentList();
		//model.addAttribute("continentList",list);
		model.addAttribute("continentList",continentMapper.selectContinentList());
		model.addAttribute("countryList",continentMapper.selectCountryList(continent));
		model.addAttribute("cityList",continentMapper.selectCityList(country));
		model.addAttribute("continent", continent);
		model.addAttribute("country", country);
		model.addAttribute("city", city);
		return "continentList";
	}
}
