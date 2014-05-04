package com.javarockstars.mvc.models.entities;

/**
 * Created by Andrej Galad on 4.5.2014.
 */
public class User extends Person {

    private String location;
    private Gender gender;

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }
}
