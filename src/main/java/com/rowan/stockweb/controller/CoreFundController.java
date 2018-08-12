package com.rowan.stockweb.controller;

import com.rowan.stockweb.data.entity.CoreStock;
import com.rowan.stockweb.utility.WebUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import java.net.URI;

@Controller
@RequestMapping("/stock")
public class CoreFundController {
String path="/stock";
    @Autowired RestTemplate rest;
    @Autowired WebUtility webUtility;
    @Value("${rest.url}") String resturl;

    @GetMapping("/fav")
    @CrossOrigin
    public String favourite (ModelMap model ){
        URI uri = webUtility.getURI(path +"/wishlist",null);
        CoreStock [] foo = rest.getForObject(uri , CoreStock[].class);
        model.put("path" , resturl);
        model.put("wishlist" , foo);
        return "fund";
    }


}
