package com.javarockstars.mvc.controllers;

import com.javarockstars.mvc.models.rottentomatoes.RestClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Andrej Galad on 6.5.2014.
 */
@Controller
@RequestMapping("/rotten")
public class RottenTomatoesController {

    @Autowired
    private RestClient restClient;

    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/boxOffice", method = RequestMethod.GET)
    public ModelAndView getBoxOfficeMovies() {
        return new ModelAndView("/rotten/boxOffice", "movies", restClient.getBoxOfficeMovies());
    }
}
