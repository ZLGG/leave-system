package com.zyx.course.eo;

import lombok.Data;

@Data
public class ProjectStudent {
    private Integer id;
    private Integer userId;
    private Integer projectId;
    private Integer ispass;
    private String createTime;
    private Integer dr;
}
