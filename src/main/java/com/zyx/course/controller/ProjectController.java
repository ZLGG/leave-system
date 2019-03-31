package com.zyx.course.controller;

import com.zyx.course.eo.ProjectEo;
import com.zyx.course.eo.Result;
import com.zyx.course.mapper.UserMapper;
import com.zyx.course.service.ProjectService;
import com.zyx.course.vo.DataVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ProjectController {
    @Autowired
    private ProjectService ProjectService;
    @ResponseBody
    @RequestMapping("/getProject")
    public Result selectProjectList(String page,String limit) {
        Result result = ProjectService.selectProjectList(page, limit);
        return result;
    }

    @ResponseBody
    @RequestMapping("/deleteProject")
    public Result deleteProject(Integer id) {
        ProjectService.deleteUser(id);
        return new Result();

    }

    @ResponseBody
    @RequestMapping("/selectStudentProject")
    public Result selectStudentProject(String page,String limit) {
        List<DataVo> dataVos = ProjectService.selectStudentProject(2);
        for (DataVo vo : dataVos) {
            if (vo.getIspass()==0) {
                vo.setIspassName("及格");
            } else if (vo.getIspass() == 1) {
                vo.setIspassName("不及格");
            } else {
                vo.setIspassName("未出");
            }
        }
        return new Result(0, "", dataVos, 100);
    }
    @ResponseBody
    @RequestMapping("/selectTeacherProject")
    public Result selectTeacherProject(String page,String limit) {
        Result result = ProjectService.selectTeacherProject(1, page, limit);
        for (DataVo vo :(List<DataVo>) result.getData()) {
            if (vo.getIspass()==0) {
                vo.setIspassName("及格");
            } else if (vo.getIspass() == 1) {
                vo.setIspassName("不及格");
            } else {
                vo.setIspassName("未出");
            }
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/cancelProject")
    public Result cancelProject(Integer id) {
        return new Result();
    }

    @ResponseBody
    @RequestMapping("/choiceProject")
    public Result choiceProject(Integer id) {
        return new Result();
    }

    @ResponseBody
    @RequestMapping("/addProject")
    public Result addProject(DataVo DataVo) {
        DataVo.setScore(Integer.parseInt(DataVo.getScoreString()));
        ProjectService.insertProject(DataVo);

        return new Result(200,"","");
    }
}
