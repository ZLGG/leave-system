package com.lyp.leave.eo.eo;

import lombok.Data;
import org.apache.ibatis.annotations.Select;

@Data
public class DataVo {
    private Integer id;
    private String beginTime;
    private String endTime;
    private String reason;
    private String updateTime;
    private String createTime;
    private Integer auditorId;
    private String auditorIdName;
    private Integer status;
    private Integer day;
    private String statusName;
    private Integer studentId;
    private String userName;
    private String passWord;
    private Integer clas;
    private String college;
    private Integer grade;
    private String major;
    private String phone;
    private Integer role;
    private String roleName;
    private Integer dr;
}
