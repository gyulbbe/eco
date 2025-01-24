package com.example.eco.advice;

import com.example.eco.dto.RestResponseDto;
import com.example.eco.exception.EcoException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
public class EcoRestAdvice {
    @ExceptionHandler(EcoException.class)
    public ResponseEntity<RestResponseDto<String>> handleEcoException(EcoException e) {
        log.error("error: " + e);
        RestResponseDto<String> restResponseDto = RestResponseDto.fail(e.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(restResponseDto);
    }
}
