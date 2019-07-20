package com.dc.controller;

import com.dc.service.Check;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URLEncoder;

@Controller
public class Distinguish {

    @RequestMapping(value = "/distinguish", method= RequestMethod.POST, produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String distinguish(String img) throws IOException, URISyntaxException {
        img = img.substring(23);
        img = URLEncoder.encode(img, "GBK");
        img = "image=" + img;
        System.out.println(img);
//        JSONArray result = Check.post(img).getJSONArray("array");
//        String result = Check.post(img);
        return Check.post(img).toString();
    }
}
