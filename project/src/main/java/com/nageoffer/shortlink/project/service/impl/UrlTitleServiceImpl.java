package com.nageoffer.shortlink.project.service.impl;

import com.nageoffer.shortlink.project.service.UrlTitleService;
import lombok.SneakyThrows;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Service;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

@Service
public class UrlTitleServiceImpl implements UrlTitleService {
    @Override
    @SneakyThrows
    public String getTitleByUrl(String url) {
        URL targetUrl = new URL(url);
        HttpURLConnection urlConnection = (HttpURLConnection) targetUrl.openConnection();
        urlConnection.setRequestMethod("GET");
        urlConnection.connect();
        int responseCode = urlConnection.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK){
            Document document = Jsoup.connect(url).get();
            return document.title();
        }
        return "Error while fetching title";

    }
}
