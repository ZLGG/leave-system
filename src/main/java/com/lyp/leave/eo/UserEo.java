package com.lyp.leave.eo;

import lombok.Data;

import java.util.Date;

@Data
public class UserEo {
    private Integer id;
    private String userName;
    private String number;
    private  Integer role;
    private String password;
    private String createTime;
    private Integer dr;
}
