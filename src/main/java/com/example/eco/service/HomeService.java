package com.example.eco.service;

import com.example.eco.dto.DataDto;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Base64;
import java.util.Map;

@Service
public class HomeService {
    public DataDto proxy(String encodedName) {

        RestTemplate restTemplate = new RestTemplate();
        String url = "http://121.130.28.118:8080/BTLMS/ALPAS_TEST.do?name=" + encodedName;

        // 응답
        ResponseEntity<Map> response = restTemplate.getForEntity(url, Map.class);

        // 응답 데이터 처리
        Map<String, String> result = response.getBody();
        byte[] decodedImg = Base64.getDecoder().decode(result.get("img"));
        String textData = result.get("text");
        return new DataDto(decodedImg, textData);
    }
}
