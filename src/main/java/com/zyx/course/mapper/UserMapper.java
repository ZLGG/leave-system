package com.zyx.course.mapper;

import com.zyx.course.eo.ProjectDate;
import com.zyx.course.eo.ProjectEo;
import com.zyx.course.eo.ProjectStudent;
import com.zyx.course.eo.UserEo;
import com.zyx.course.vo.DataVo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface UserMapper {
    @Insert("insert into user (userName,number,role,password,createTime)values(#{eo.userName},#{eo.number},#{eo.role},#{eo.password},now())")
    void insertUser(@Param("eo") UserEo UserEo);

    @Update("update user set password = #{eo.password} where id = #{eo.id}")
    void updateUser(@Param("eo") UserEo UserEo);

    @Update("update user set dr=1 where id=#{eo.id}")
    void deleteUser(@Param("eo") UserEo UserEo);

    @Select("<script>" +
            "select * from user " +
            "where dr = 0" +
            "<if test='id!=null'>and id= #{id}</if>" +
            "</script>")
    List<DataVo> selectUserList(@Param("id") Integer id);

    @Select("select * from user where number=#{eo.number} and password=#{eo.password}")
    UserEo selectUser(@Param("eo") UserEo UserEo);

    @Insert("insert into project_date (beginTime,endTime)values(#{eo.beginTime},#{eo.endTime})")
    void insertDate(@Param("eo") ProjectDate eo);

    @Delete("delete from project_date where dr=0")
    void deleteDate();

    @Update("<script>" +
            "update user set dr = 1" +
            " <if test='ids!=null and ids.size>0'> and id in" +
            "<foreach item='item' index='index' collection='ids' open='(' separator=',' close=')'> " +
            " #{item} " +
            "  </foreach>" +
            "</if>" +
            "</script>")
    void deleteUserList(@Param("ids") List<Integer> ids);

    @Select("SELECT SQL_CALC_FOUND_ROWS project_teacher.id, project_teacher.project FROM project_teacher WHERE project_teacher.project = 'shuxue' LIMIT 0,20;")
    List<DataVo> selectLimitProject();

    @Select("SELECT FOUND_ROWS() as count;")
    Integer selectCount();

    @Select("select * from user where role=1")
    List<DataVo> getTeacher();

    @Select("select * from user u where u.dr = 0 and u.number = #{number}")
    UserEo selectUserByNumber(@Param("number")String number);
}
