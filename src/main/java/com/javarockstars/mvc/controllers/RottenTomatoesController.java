package com.javarockstars.mvc.controllers;

import com.javarockstars.mvc.models.rottentomatoes.RestClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

    @RequestMapping(value = "/inTheaters", method = RequestMethod.GET)
    public ModelAndView getMoviesInTheaters() {
        return new ModelAndView("/rotten/inTheater", "movies", restClient.getMoviesInTheaters());
    }

    @RequestMapping(value = "/upcomingMovies", method = RequestMethod.GET)
    public ModelAndView getUpcomingMovies() {
        return new ModelAndView("/rotten/upMovie", "movies", restClient.getUpcomingMovies());
    }

    @RequestMapping(value = "/topRentals", method = RequestMethod.GET)
    public ModelAndView getTopRentalDvds() {
        return new ModelAndView("/rotten/topRental", "movies", restClient.getTopRentalDvds());
    }

    @RequestMapping(value = "/currentReleases", method = RequestMethod.GET)
    public ModelAndView getCurrentReleasesDvds() {
        return new ModelAndView("rotten/currentRelease", "movies", restClient.getCurrentReleasesDvds());
    }

    @RequestMapping(value = "/upcomingDvds", method = RequestMethod.GET)
    public ModelAndView getUpcomingDvds() {
        return new ModelAndView("/rotten/upDvd", "movies", restClient.getUpcomingDvds());
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView displayDetails(@RequestParam String title) {
        return new ModelAndView("/rotten/details", "movie", restClient.getMovie(title));
    }
}
