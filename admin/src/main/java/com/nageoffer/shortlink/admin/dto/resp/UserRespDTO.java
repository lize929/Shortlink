package com.nageoffer.shortlink.admin.dto.resp;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.nageoffer.shortlink.admin.common.convention.serialize.PhoneDesensitizationSerializer;
import jakarta.validation.constraints.Email;
import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * 用户返回参数响应实体
 */
@Data
public class UserRespDTO {
    Long id;
    String username;
    String real_name;
    @JsonSerialize(using = PhoneDesensitizationSerializer.class)
    String phone;
    @Email
    String mail;
}
