package com.example.eco.dto;

import jakarta.servlet.http.HttpServletResponse;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class RestResponseDto<T> {
    private int status;
    private String message;
    private T data;

    public static <T> RestResponseDto<T> success(T data) {
        RestResponseDto<T> dto = new RestResponseDto<>();
        dto.setStatus(HttpServletResponse.SC_OK);
        dto.setMessage("success");
        dto.setData(data);

        return dto;
    }

    public static <T> RestResponseDto<T> fail(String message) {
        RestResponseDto<T> dto = new RestResponseDto<>();
        dto.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        dto.setMessage(message);
        dto.setData(null);

        return dto;
    }
}
