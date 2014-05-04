package com.javarockstars.mvc.models.entities;

/**
 * Created by Andrej Galad on 4.5.2014.
 */
public class Certificate {

    private String certificationName;
    private String content;

    public String getCertificationName() {
        return certificationName;
    }

    public void setCertificationName(String certificationName) {
        this.certificationName = certificationName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
