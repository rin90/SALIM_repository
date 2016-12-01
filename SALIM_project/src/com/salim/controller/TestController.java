package com.salim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.salim.service.impl.TestServiceImpl;

@Controller
@RequestMapping("/test")
public class TestController {
	@Autowired
	private TestServiceImpl service;
	
	@RequestMapping("/time")
	public String testTime(ModelMap map){
		String time = service.time();
		map.addAttribute("time", time);
		return "/main.jsp";
	}
}
