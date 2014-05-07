package com.javarockstars.mvc.models.rottentomatoes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javarockstars.mvc.models.entities.Movie;
import com.javarockstars.mvc.models.entities.Rating;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.json.JSONConfiguration;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Andrej Galad on 6.5.2014.
 */
@Service
public class RestClient {
    private String movieUrl;
    private String listUrl;
    private String apiKey;
    private Client client;
    private ObjectMapper objectMapper;

    public RestClient() {
        ClientConfig clientConfig = new DefaultClientConfig();
        clientConfig.getFeatures().put(JSONConfiguration.FEATURE_POJO_MAPPING, Boolean.TRUE);
        movieUrl = PropertiesHelper.loadProperty("movieUrl");
        listUrl = PropertiesHelper.loadProperty("listUrl");
        apiKey = PropertiesHelper.loadProperty("apiKey");
        client = Client.create(clientConfig);
        objectMapper = new ObjectMapper();
    }

    public List<Movie> getBoxOfficeMovies() {
        String json = client.resource(listUrl)
                .path("movies/box_office.json")
                .queryParam("limit", "15")
                .queryParam("country", "us")
                .queryParam("apikey", apiKey)
                .get(String.class)
                .trim();
        return deserialize(json);
    }

    public List<Movie> getMoviesInTheaters() {
        String json = client.resource(listUrl)
                .path("movies/in_theaters.json")
                .queryParam("page_limit", "15")
                .queryParam("page", "1")
                .queryParam("apikey", apiKey)
                .get(String.class)
                .trim();
        return deserialize(json);
    }

    public List<Movie> getUpcomingMovies() {
        String json = client.resource(listUrl)
                .path("movies/upcoming.json")
                .queryParam("page_limit", "15")
                .queryParam("page", "1")
                .queryParam("apikey", apiKey)
                .get(String.class)
                .trim();
        return deserialize(json);
    }

    public List<Movie> getTopRentalDvds() {
        String json = client.resource(listUrl)
                .path("dvds/top_rentals.json")
                .queryParam("limit", "15")
                .queryParam("apikey", apiKey)
                .get(String.class)
                .trim();
        return deserialize(json);
    }

    public List<Movie> getCurrentReleasesDvds() {
        String json = client.resource(listUrl)
                .path("dvds/new_releases.json")
                .queryParam("page_limit", "15")
                .queryParam("page", "1")
                .queryParam("apikey", apiKey)
                .get(String.class)
                .trim();
        return deserialize(json);
    }

    public List<Movie> getUpcomingDvds() {
        String json = client.resource(listUrl)
                .path("dvds/upcoming.json")
                .queryParam("page_limit", "15")
                .queryParam("page", "1")
                .queryParam("apikey", apiKey)
                .get(String.class)
                .trim();
        return deserialize(json);
    }

    public Movie getMovie(String title) {
        String json = client.resource(movieUrl)
                .path("movies.json")
                .queryParam("q", title)
                .queryParam("page_limit", "1")
                .queryParam("apikey", apiKey)
                .get(String.class)
                .trim();
        List<Movie> movies = deserialize(json);
        return movies.size() > 0 ? movies.get(0) : null;
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
                try {
                    movie.setCriticsConsensus(object.getString("critics_consensus"));
                } catch (JSONException e) {
                }
                try {
                    movie.setReleaseDate(object.getJSONObject("release_dates").getString("theater"));
                } catch (JSONException e) {
                }
                Rating rating = new Rating();
                JSONObject r = object.getJSONObject("ratings");
                try {
                    rating.setAudienceRating(r.getString("audience_rating"));
                } catch (JSONException e) {
                }
                try {
                    rating.setAudienceScore(r.getInt("audience_score"));
                } catch (JSONException e) {
                }
                try {
                    rating.setCriticsRating(r.getString("critics_rating"));
                } catch (JSONException e) {
                }
                try {
                    rating.setCriticsScore(r.getInt("critics_score"));
                } catch (JSONException e) {
                }
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