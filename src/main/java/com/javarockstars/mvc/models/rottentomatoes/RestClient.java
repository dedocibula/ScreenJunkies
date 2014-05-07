package com.javarockstars.mvc.models.rottentomatoes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javarockstars.mvc.models.entities.Movie;
import com.javarockstars.mvc.models.entities.Rating;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.json.JSONConfiguration;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Andrej Galad on 6.5.2014.
 */
@Service
public class RestClient {
    private String movieUrl;
    private String dvdUrl;
    private String apiKey;
    private Client client;
    private ObjectMapper objectMapper;

    public RestClient() {
        ClientConfig clientConfig = new DefaultClientConfig();
        clientConfig.getFeatures().put(JSONConfiguration.FEATURE_POJO_MAPPING, Boolean.TRUE);
        movieUrl = PropertiesHelper.loadProperty("movieUrl");
        dvdUrl = PropertiesHelper.loadProperty("dvdUrl");
        apiKey = PropertiesHelper.loadProperty("apiKey");
        client = Client.create(clientConfig);
        objectMapper = new ObjectMapper();
    }

    public List<Movie> getBoxOfficeMovies() {
        String json = client.resource(movieUrl)
                            .path("movies/box_office.json")
                            .queryParam("limit", "15")
                            .queryParam("country", "us")
                            .queryParam("apikey", apiKey)
                            .get(String.class)
                            .trim();
        return deserialize(json);
    }

    private List<Movie> deserialize(String json) {
        List<Movie> movies = new ArrayList<>();
        try {
            JSONObject response = new JSONObject(json);
            JSONArray movieObjects = response.getJSONArray("movies");
            for (int i = 0; i < movieObjects.length(); i++) {
                JSONObject object = movieObjects.getJSONObject(i);
                Movie movie = new Movie();
                movie.setTitle(object.getString("title"));
                movie.setYear(object.getInt("year"));
                movie.setMpaaRating(object.getString("mpaa_rating"));
                movie.setCriticsConsensus(object.getString("critics_consensus"));
                movie.setReleaseDate(object.getJSONObject("release_dates").getString("theater"));
                Rating rating = new Rating();
                JSONObject r = object.getJSONObject("ratings");
                rating.setAudienceRating(r.getString("audience_rating"));
                rating.setAudienceScore(r.getInt("audience_score"));
                rating.setCriticsRating(r.getString("critics_rating"));
                rating.setCriticsScore(r.getInt("critics_score"));
                movie.setRatings(rating);
                movie.setSynopsis(object.getString("synopsis"));
                movie.setThumbnail(object.getJSONObject("posters").getString("thumbnail"));
                movie.setImage(object.getJSONObject("posters").getString("detailed"));
                movies.add(movie);
            }
        } catch (JSONException e) {
        }
        return movies;
    }
}