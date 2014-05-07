package com.javarockstars.mvc;

import com.javarockstars.mvc.models.entities.Movie;
import com.javarockstars.mvc.models.rottentomatoes.RestClient;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by Andrej Galad on 6.5.2014.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/mvc-dispatcher-servlet.xml")
public class RestClientTest {

    @Autowired
    public RestClient restClient;

    @Test
    public void getBoxOfficeMoviesTest() {
        List<Movie> boxOfficeMovies = restClient.getBoxOfficeMovies();
        Assert.assertNotNull(boxOfficeMovies);
        Assert.assertTrue(!boxOfficeMovies.isEmpty());
    }

    @Test
    public void getUpcomingMoviesTest() {
        List<Movie> boxOfficeMovies = restClient.getUpcomingMovies();
        Assert.assertNotNull(boxOfficeMovies);
        Assert.assertTrue(!boxOfficeMovies.isEmpty());
    }
}
