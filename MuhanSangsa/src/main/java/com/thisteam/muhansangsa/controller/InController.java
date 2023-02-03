package com.thisteam.muhansangsa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.thisteam.muhansangsa.service.InService;

@Controller
public class InController {
	
	@Autowired
	private InService service;
}
