package com.rowan.stockweb.utility;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.Map;
@Component
public class WebUtility {
 @Value("${rest.url}") String resturl;

    public  URI  getURI(String path, Map<String,String> query){
        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(resturl+path);
        if(query != null ) {
            query.forEach((a, b) -> {
                builder.queryParam(a, b);
            });
        }
        return builder.build().toUri();

    }

}
