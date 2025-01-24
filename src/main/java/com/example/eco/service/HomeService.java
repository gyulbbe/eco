package com.example.eco.service;

import com.example.eco.dto.DataDto;
import com.example.eco.exception.EcoException;
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

        // 존재하지 않는 이름인 경우
        if (result.containsKey("ERROR")) {
            throw new EcoException(result.get("ERROR"));
        }

        // 존재하는 이름인 경우
        String textData = result.get("text");
        byte[] decodedImg = Base64.getDecoder().decode(result.get("img"));

        return new DataDto(decodedImg, textData);
    }
}
