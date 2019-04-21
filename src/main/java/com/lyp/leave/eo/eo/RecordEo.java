package com.lyp.leave.eo.eo;

import lombok.Data;

@Data
public class RecordEo {
    private Integer id;
    private String beginTime;
    private String endTime;
    private String reason;
    private String updateTime;
    private String createTime;
    private Integer auditorId;
    private Integer status;
    private String statusName;
    private Integer studentId;
    private Long day;
    private Integer dr;
}
