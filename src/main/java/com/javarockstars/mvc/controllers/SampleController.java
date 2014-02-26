package com.javarockstars.mvc.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class SampleController {

    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
	public ModelAndView index() {
		return new ModelAndView("index", "message", "Hello World!");
	}
}