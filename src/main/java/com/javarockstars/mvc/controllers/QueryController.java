package com.javarockstars.mvc.controllers;

import com.javarockstars.mvc.models.dao.QueryDAO;
import com.javarockstars.mvc.models.entities.Performer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Andrej Galad on 4.5.2014.
 */
@Controller
@RequestMapping("/query")
public class QueryController {

    @Autowired
    private QueryDAO queryDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/one", method = RequestMethod.GET)
    public ModelAndView getLatestVideos() {
        Performer performer = new Performer();
        performer.setFirstName("Brad");
        performer.setLastName("Pitt");
        return new ModelAndView("/query/queryOne", "latestVideos", queryDAO.findLatestVideos(performer));
    }

    @RequestMapping(value = "/two", method = RequestMethod.GET)
    public ModelAndView getDirectorsWithAllGenres() {
        return new ModelAndView("/query/queryTwo", "directors", queryDAO.findDirectorsWithAllGenres());
    }

    @RequestMapping(value = "/three", method = RequestMethod.GET)
    public ModelAndView getUserWithMostFriends() {
        return new ModelAndView("/query/queryThree", "user", queryDAO.findUserWithMostFriends());
    }

    @RequestMapping(value = "/four", method = RequestMethod.GET)
    public ModelAndView getMostCommonRateScore() {
        return new ModelAndView("/query/queryFour", "rateScore", queryDAO.findMostCommonRateScore());
    }

    @RequestMapping(value = "/five", method = RequestMethod.GET)
    public ModelAndView getOldestUser() {
        return new ModelAndView("/query/queryFive", "oldestUser", queryDAO.findOldestUser());
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView getGenericResult(@ModelAttribute String sql) {
        return new ModelAndView("/query/generic", "result", queryDAO.genericQuery(sql));
    }
}
