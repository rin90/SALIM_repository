package com.salim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.salim.service.GoalService;

@Controller
@RequestMapping("/gaol")
public class GoalController {
	@Autowired
	GoalService service;
	
	
}
