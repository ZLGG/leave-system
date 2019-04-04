package com.zyx.course.controller;

import com.sun.org.apache.regexp.internal.RE;
import com.zyx.course.eo.ProjectEo;
import com.zyx.course.eo.ProjectStudent;
import com.zyx.course.eo.Result;
import com.zyx.course.eo.UserEo;
import com.zyx.course.mapper.UserMapper;
import com.zyx.course.service.ProjectService;
import com.zyx.course.service.UserService;
import com.zyx.course.vo.DataVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
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
    public Result selectStudentProject(Integer page,Integer limit,HttpSession session) {
        UserEo user = (UserEo) session.getAttribute("user");
        Result result = ProjectService.selectStudentProject(user.getId(),page,limit);
        for (DataVo vo : (List<DataVo>)result.getData()) {
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
    @RequestMapping("/selectTeacherProject")
    public Result selectTeacherProject(String page, String limit, HttpSession session) {
        UserEo user = (UserEo) session.getAttribute("user");
        Result result = ProjectService.selectTeacherProject(user.getId(), page, limit);
        for (DataVo vo : (List<DataVo>) result.getData()) {
            if (vo.getIspass() == 0) {
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
        ProjectStudent projectStudent = ProjectService.selectProjectById(id);
        if (projectStudent.getIspass() == 1 || projectStudent.getIspass() == 0) {
            return new Result(1,"","");
        }
        ProjectService.deleteProjectStudent(id);
        return new Result(0,"","");
    }

    @ResponseBody
    @RequestMapping("/choiceProject")
    public Result choiceProject(Integer id, HttpSession session,Integer page,Integer limit) {
        UserEo user = (UserEo) session.getAttribute("user");
        ProjectStudent projectStudent = new ProjectStudent();
        projectStudent.setProjectId(id);
        projectStudent.setUserId(user.getId());
        ProjectStudent projectStudent1 = ProjectService.selectProjectStudent(projectStudent);
        Result result = ProjectService.selectStudentProject(user.getId(), page, limit);
        if (projectStudent1 != null) {
            return new Result(1,"","");
        }
        if (((List<DataVo>)result.getData()).size() >= 2) {
            return new Result(2,"","");
        }
        ProjectService.insertprojectStudent(projectStudent);
        return new Result(0,"","");
    }

    @ResponseBody
    @RequestMapping("/addProject")
    public Result addProject(DataVo DataVo) {
        DataVo.setScore(Integer.parseInt(DataVo.getScoreString()));
        ProjectService.insertProject(DataVo);

        return new Result(200,"","");
    }

    @ResponseBody
    @RequestMapping("/PassProject")
    public Result PassProject(Integer id) {
        ProjectStudent projectStudent = ProjectService.selectProjectById(id);
        if (projectStudent.getIspass() == 0 || projectStudent.getIspass() == 1) {
            return new Result(1,"","");
        }
        ProjectService.updateIsPass(id);
        return new Result(0,"","");
    }

    @ResponseBody
    @RequestMapping("/notPassProject")
    public Result notPassProject(Integer id) {
        ProjectStudent projectStudent = ProjectService.selectProjectById(id);
        if (projectStudent.getIspass() == 0 || projectStudent.getIspass() == 1) {
            return new Result(1,"","");
        }
        ProjectService.updateIsPassNot(id);
        return new Result(0,"","");
    }
}
