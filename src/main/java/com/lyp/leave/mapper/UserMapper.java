package com.lyp.leave.mapper;

import com.lyp.leave.eo.eo.DataVo;
import com.lyp.leave.eo.eo.UserEo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UserMapper {
    @Select("SELECT FOUND_ROWS() as count;")
    Integer selectCount();

    @Insert("insert into user (number,userName,clas,grade,createTime,password,college,role) values(#{eo.number},#{eo.userName},#{eo.clas},#{eo.grade},now(),#{eo.password},#{eo.college},0)")
    void insertStudent(@Param("eo")UserEo userEo);

    @Select("select * from user where dr = 0 and number=#{number}")
    UserEo selectUserById(@Param("number")String number);

    @Select("select SQL_CALC_FOUND_ROWS * from user where dr=0 and role=#{role} limit #{page},#{limit}")
    List<UserEo> selectUserList(@Param("role") Integer role,@Param("page") Integer page,@Param("limit") Integer limit);

    @Insert("insert into user (number,userName,password,role,createTime) values(#{eo.number},#{eo.userName},#{eo.password},#{eo.role},now())")
    void addUser(@Param("eo") UserEo userEo);

    @Insert("insert into user (number,userName,password,college,grade,role,createTime) values(#{eo.number},#{eo.userName},#{eo.password},#{eo.college},#{eo.grade},2,now())")
    void addInstructorUser(@Param("eo") UserEo userEo);

    @Insert("insert into user (number,userName,password,college,role,createTime) values(#{eo.number},#{eo.userName},#{eo.password},#{eo.college},3,now())")
    void addLeaderUser(@Param("eo") UserEo userEo);

    @Update("update user set dr=1 where id=#{id}")
    void deleteUser(@Param("id") Integer id);

    @Update("update user set phone=#{eo.phone},password=#{eo.password} where dr=0 and id=#{eo.id}")
    void updateUser(@Param("eo") UserEo userEo);

    @Select("select * from user where dr=0 and number=#{eo.number} and password=#{eo.password}")
    UserEo login(@Param("eo") UserEo userEo);

    @Select("select * from user where id=#{id}")
    UserEo selectUser(@Param("id") Integer id);
}
