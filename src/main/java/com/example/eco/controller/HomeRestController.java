package com.example.eco.controller;

import com.example.eco.dto.DataDto;
import com.example.eco.dto.RestResponseDto;
import com.example.eco.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeRestController {

    private final HomeService homeService;

    @Autowired
    public HomeRestController(HomeService homeService) {
        this.homeService = homeService;
    }

    @GetMapping("/proxy")
    public ResponseEntity<RestResponseDto<DataDto>> proxy(@RequestParam String encodedName) {
        return ResponseEntity.ok(RestResponseDto.success(homeService.proxy(encodedName)));
    }
}
