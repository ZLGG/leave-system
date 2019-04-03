package com.zyx.course.eo.eo;

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
    private Integer studentId;
    private Integer dr;
}
