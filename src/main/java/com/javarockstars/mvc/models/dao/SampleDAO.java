package com.javarockstars.mvc.models.dao;

import com.javarockstars.mvc.models.entities.SampleModel;
import com.javarockstars.mvc.models.entities.Season;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * Created by Andrej Galad on 29.4.2014.
 */
@Repository
public class SampleDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<SampleModel> findAllSampleModels() {
        String sql = "select * from sample_model";
        return jdbcTemplate.query(sql, new RowMapper<SampleModel>() {
            @Override
            public SampleModel mapRow(ResultSet resultSet, int rowNumber) throws SQLException {
                SampleModel model = new SampleModel();
                model.setFirstName(resultSet.getString("FIRST_NAME"));
                model.setLastName(resultSet.getString("LAST_NAME"));
                model.setPhoneNumber(resultSet.getInt("PHONE_NUMBER"));
                return model;
            }
        });
    }

    public List<Map<String, Object>> findAllSampleModelsGeneric() {
        String sql = "select * from sample_model";
        return jdbcTemplate.queryForList(sql);
    }
}
