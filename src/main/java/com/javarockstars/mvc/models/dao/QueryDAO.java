package com.javarockstars.mvc.models.dao;

import com.javarockstars.mvc.models.entities.Performer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Andrej Galad on 4.5.2014.
 */
@Repository
public class QueryDAO {

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * List 10 latest videos that the performer participated in.
     * @param performer performer
     * @return title and release date for each video
     */
    public List<Map<String, Object>> findLatestVideos(Performer performer) {
        String sql = "select title, release_year " +
                     "from performer as p, actin as a, videoinfo as v " +
                     "where p.pid = a.pid and v.vid = a.vid and " +
                     "last_name = :lastName and " +
                     "first_name = :firstName " +
                     "order by release_year desc " +
                     "limit 10;";
        Map<String, String> namedParameters = new HashMap<>();
        namedParameters.put("firstName", performer.getFirstName());
        namedParameters.put("lastName", performer.getLastName());
        return namedParameterJdbcTemplate.queryForList(sql, namedParameters);
    }

    /**
     * List the names of directors who have directed at least one movie in each genre.
     * @return director id, director's first name, director's last name
     */
    public List<Map<String, Object>> findDirectorsWithAllGenres() {
        String sql = "select d.did, d.first_name,d.last_name " +
                     "from director as d " +
                     "where not exists " +
                     "(" +
                     "(select genre from genre) " +
                     "except " +
                     "(select genre " +
                     "from belongtoGenre as b, moviedirectors as dm " +
                     "where b.vid = dm.vid and dm.did = d.did)" +
                     ");";
        return jdbcTemplate.queryForList(sql);
    }

    /**
     * List the user who has the most friends.
     * @return user id, number of user's friends
     */
    public List<Map<String, Object>> findUserWithMostFriends() {
        String sql = "create view user_total_friends as " +
                     "select uid1 as uid, count(distinct uid2) as friend_num " +
                     "from friends " +
                     "group by uid1;";

        jdbcTemplate.execute(sql);

        sql = "select uid, friend_num " +
              "from user_total_friends " +
              "where friend_num >= all (select max(friend_num) " +
              "from user_total_friends);";

        return jdbcTemplate.queryForList(sql);
    }

    /**
     * List the most common rate score.
     * @return rate score
     */
    public List<Map<String, Object>> findMostCommonRateScore() {
        String sql = "select rate_score from " +
                     "(select rate_score, count(rate_score) as count " +
                     "from ratings " +
                     "group by rate_score" +
                     "order by count desc) " +
                     "limit 1";

        return jdbcTemplate.queryForList(sql);
    }

    public List<Map<String, Object>> findOldestUser() {
        String sql = "select max(age) " +
                     "from userinfo";

        return jdbcTemplate.queryForList(sql);
    }

    public List<Map<String, Object>> genericQuery(String query) {
        return jdbcTemplate.queryForList(query);
    }
}
