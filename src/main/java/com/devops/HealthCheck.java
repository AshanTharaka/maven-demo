
package com.devops;

import java.net.HttpURLConnection;
import java.net.URL;

public class HealthCheck {

    public static void main(String[] args) {
        HttpURLConnection connection = null;

        try {
            URL url = new URL("http://localhost:8081/api/hello");
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setConnectTimeout(3000);
            connection.setReadTimeout(3000);

            int statusCode = connection.getResponseCode();

            if (statusCode < 200 || statusCode >= 300) {
                System.exit(1);
            }

        } catch (Exception e) {
            System.exit(1);
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }
}
