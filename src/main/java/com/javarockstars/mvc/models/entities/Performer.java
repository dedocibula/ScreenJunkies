package com.javarockstars.mvc.models.entities;

/**
 * Created by Andrej Galad on 4.5.2014.
 */
public class Performer extends Person {

    private Gender gender;

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }
}
