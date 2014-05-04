package com.javarockstars.mvc.controllers;

import com.javarockstars.mvc.models.dao.SampleDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sample")
public class SampleController {

    @Autowired
    private SampleDAO sampleDAO;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView getSamples() {
        //return new ModelAndView("sample", "samples", sampleDAO.findAllSampleModels());
        List<Map<String, Object>> model = sampleDAO.findAllSampleModelsGeneric();
        return new ModelAndView("sample", "samples", model);
    }
}