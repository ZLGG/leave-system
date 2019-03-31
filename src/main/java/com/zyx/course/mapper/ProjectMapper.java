package com.zyx.course.mapper;

import com.zyx.course.eo.ProjectEo;
import com.zyx.course.eo.ProjectTeacher;
import com.zyx.course.vo.DataVo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import javax.xml.crypto.Data;
import java.util.List;

public interface ProjectMapper {
    @Select("select * from project_teacher p,user u where u.id = p.teacherId and u.role =1 and u.dr =0 and p.dr = 0 limit #{page},#{limit}")
    List<DataVo> selectProject(@Param("page") Integer page,@Param("limit") Integer limit);

    @Select("select t.project,t.score,t.createTime,p.id,u.userName,p.ispass from project_student p,user u,project_teacher t,user u1 where p.userId = u.id and p.projectId = t.id and u1.id = t.teacherId and u1.id = #{id} limit #{page},#{limit};")
    List<DataVo> selectTeacherProject(@Param("id") Integer id,@Param("page") Integer page,@Param("limit") Integer limit);

    @Insert("insert into project_teacher (teacherId,project,score,createTime) values(#{eo.teacherId},#{eo.project},#{eo.score},now())")
    void insertProject(@Param("eo")DataVo eo);

    @Select("select t.project,t.score,p.createTime,p.id,u1.userName,p.ispass from project_student p,user u,project_teacher t,user u1 where p.userId = u.id and p.projectId = t.id and u1.id = t.teacherId and u.id = #{id}")
    List<DataVo> selectStudentProject(@Param("id") Integer id);

    @Update("update project_teacher set dr=1 and id=#{id}")
    void deleteProject(@Param("id") Integer id);

    @Select("SELECT FOUND_ROWS() as count;")
    Integer selectCount();

}
