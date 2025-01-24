package com.example.eco.advice;

import com.example.eco.dto.RestResponseDto;
import com.example.eco.exception.EcoException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class EcoRestAdvice {
    @ExceptionHandler(EcoException.class)
    public ResponseEntity<RestResponseDto<String>> handleEcoException(EcoException e) {
        RestResponseDto<String> restResponseDto = RestResponseDto.fail(e.getMessage());
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(restResponseDto);
    }
}
