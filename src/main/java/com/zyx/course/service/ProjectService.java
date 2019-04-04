package com.zyx.course.service;

import com.zyx.course.eo.ProjectEo;
import com.zyx.course.eo.ProjectStudent;
import com.zyx.course.eo.Result;
import com.zyx.course.mapper.ProjectMapper;
import com.zyx.course.vo.DataVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.xml.crypto.Data;
import java.util.List;
@Service
public class ProjectService {
    @Resource
    private ProjectMapper ProjectMapper;
    @Transactional
    public Result selectProjectList(String page,String limit) {
        int i1 = Integer.parseInt(limit);
        int i = (Integer.parseInt(page) - 1) * i1;
        List<DataVo> dataVos = ProjectMapper.selectProject(i, i1);
        Integer count = ProjectMapper.selectCount();
        return new Result<>(0,"",dataVos,count);
    }

    public void deleteUser(Integer id) {
        ProjectMapper.deleteProject(id);
    }

    public Result selectStudentProject(Integer id,Integer page,Integer limit) {
        page = (page - 1) * limit;
        List<DataVo> data = ProjectMapper.selectStudentProject(id,page,limit);
        Integer integer = ProjectMapper.selectCount();
        return new Result<>(0,"",data,integer);
    }

    @Transactional
    public Result selectTeacherProject(Integer id,String page,String limit) {
        int i1 = Integer.parseInt(limit);
        int i = (Integer.parseInt(page) - 1) * i1;
        List<DataVo> dataVos = ProjectMapper.selectTeacherProject(id, i, i1);
        Integer count = ProjectMapper.selectCount();

        return new Result(0, "", dataVos, count);
    }


    public void insertProject(DataVo DataVo) {
        ProjectMapper.insertProject(DataVo);

    }
    public void insertprojectStudent(ProjectStudent ProjectStudent) {
        ProjectMapper.insertprojectStudent(ProjectStudent);
    }

    public ProjectStudent selectProjectStudent(ProjectStudent ProjectStudent) {
        ProjectStudent projectStudent = ProjectMapper.selectProjectStudent(ProjectStudent);
        return projectStudent;
    }
    public void deleteProjectStudent(Integer id) {
        ProjectMapper.deleteProjectStudent(id);
    }

    public ProjectStudent selectProjectById(Integer id) {
        ProjectStudent projectStudent = ProjectMapper.selectProjectById(id);
        return projectStudent;
    }

    public void updateIsPassNot(Integer id) {
        ProjectMapper.updateIsPassNot(id);
    }

    public void updateIsPass(Integer id) {
        ProjectMapper.updateIsPass(id);

    }
}
