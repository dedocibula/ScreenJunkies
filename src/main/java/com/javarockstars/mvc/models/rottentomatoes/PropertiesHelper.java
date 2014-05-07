package com.javarockstars.mvc.models.rottentomatoes;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by Andrej Galad on 6.5.2014.
 */
public class PropertiesHelper {
    public static String loadProperty(String propertyName) {
        Properties properties = propertiesInit();
        return properties.getProperty(propertyName);
    }

    private static Properties propertiesInit() {
        Properties properties = new Properties();
        try {
            try (InputStream in = PropertiesHelper.class.getResourceAsStream("/rottentomatoes.properties")) {
                properties.load(in);
            }
        } catch (IOException ex) {
            // do nothing
        }
        return properties;
    }
}
