package com.nageoffer.shortlink.admin.dto.resp;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.nageoffer.shortlink.admin.common.convention.serialize.PhoneDesensitizationSerializer;
import jakarta.validation.constraints.Email;
import lombok.Data;

@Data
public class UserActualRespDTO {
    Long id;
    String username;
    String real_name;
    String phone;
    @Email
    String mail;
}
