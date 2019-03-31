package com.zyx.course.eo;

import lombok.Data;

import java.sql.Date;

@Data
public class ProjectDate {
    private Integer id;
    private String begin;
    private String end;
    private String beginTime;
    private String endTime;
}
