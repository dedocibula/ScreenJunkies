package com.javarockstars.mvc.controllers;

import com.javarockstars.mvc.models.dao.RelationDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Andrej Galad on 4.5.2014.
 */
@Controller
@RequestMapping("/relation")
public class RelationController {

    @Autowired
    private RelationDAO relationDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/performers", method = RequestMethod.GET)
    public ModelAndView getPerformers() {
        return new ModelAndView("relation/performers", "performers", relationDAO.findPerformers());
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public ModelAndView getUsers() {
        return new ModelAndView("relation/users", "users", relationDAO.findUsers());
    }

    @RequestMapping(value = "/directors", method = RequestMethod.GET)
    public ModelAndView getDirectors() {
        return new ModelAndView("relation/directors", "directors", relationDAO.findDirectors());
    }

    @RequestMapping(value = "/certificates", method = RequestMethod.GET)
    public ModelAndView getCertificates() {
        return new ModelAndView("relation/certificates", "certificates", relationDAO.findCertificates());
    }

    @RequestMapping(value = "/seasons", method = RequestMethod.GET)
    public ModelAndView getSeasons() {
        return new ModelAndView("relation/seasons", "seasons", relationDAO.findSeasons());
    }
}
