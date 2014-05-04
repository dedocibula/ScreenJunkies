package com.javarockstars.mvc.models.dao;

import com.javarockstars.mvc.models.entities.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Andrej Galad on 4.5.2014.
 */
@Repository
public class RelationDAO {

    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;

    public List<Performer> findPerformers() {
        String sql = "select * from performer limit 20";
        return jdbcTemplate.query(sql, new RowMapper<Performer>() {
            @Override
            public Performer mapRow(ResultSet resultSet, int i) throws SQLException {
                Performer performer = new Performer();
                performer.setId(resultSet.getInt("pid"));
                performer.setFirstName(resultSet.getString("first_name"));
                performer.setLastName(resultSet.getString("last_name"));
                performer.setAge(resultSet.getInt("age"));
                performer.setGender(resultSet.getString("gender").equals("M") ? Gender.MALE : Gender.FEMALE);
                return performer;
            }
        });
    }

    public List<User> findUsers() {
        String sql = "select * from userinfo limit 20";
        return jdbcTemplate.query(sql, new RowMapper<User>() {
            @Override
            public User mapRow(ResultSet resultSet, int i) throws SQLException {
                User user = new User();
                user.setId(resultSet.getInt("uid"));
                user.setFirstName(resultSet.getString("first_name"));
                user.setLastName(resultSet.getString("last_name"));
                user.setAge(resultSet.getInt("age"));
                user.setGender(resultSet.getString("gender").equals("M") ? Gender.MALE : Gender.FEMALE);
                user.setLocation(resultSet.getString("location"));
                return user;
            }
        });
    }

    public List<Director> findDirectors() {
        String sql = "select * from director limit 20";
        return jdbcTemplate.query(sql, new RowMapper<Director>() {
            @Override
            public Director mapRow(ResultSet resultSet, int i) throws SQLException {
                Director director = new Director();
                director.setId(resultSet.getInt("did"));
                director.setFirstName(resultSet.getString("first_name"));
                director.setLastName(resultSet.getString("last_name"));
                director.setAge(resultSet.getInt("age"));
                return director;
            }
        });
    }

    public List<Certificate> findCertificates() {
        String sql = "select * from certificates limit 20";
        return jdbcTemplate.query(sql, new RowMapper<Certificate>() {
            @Override
            public Certificate mapRow(ResultSet resultSet, int i) throws SQLException {
                Certificate certificate = new Certificate();
                certificate.setCertificationName(resultSet.getString("certification_name"));
                certificate.setContent(resultSet.getString("content"));
                return certificate;
            }
        });
    }

    public List<Season> findSeasons() {
        String sql = "select * from season limit 20";
        return jdbcTemplate.query(sql, new RowMapper<Season>() {
            @Override
            public Season mapRow(ResultSet resultSet, int i) throws SQLException {
                Season season = new Season();
                season.setTitle(resultSet.getString("seasontitle"));
                season.setNumber(resultSet.getInt("seasonnum"));
                return season;
            }
        });
    }
}
