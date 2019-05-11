package com.lyp.leave.vo;

import lombok.Data;

@Data
public class RecordRequestVo {
    private String beginTime;
    private String endTime;
    private String number;
    private Integer college;
    private Integer clas;
    private Integer grade;
}
