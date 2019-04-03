package com.zyx.course.mapper;

import com.zyx.course.eo.eo.DataVo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RecordMapper {
    @Select("select * from record r where r.dr=0 and r.studentId = #{id}")
    List<DataVo> studentSelectRecord(@Param("id") Integer id);//

    @Select("select * from user u,record r ,user u1 where u.dr = 0 and u1.dr = 0 and r.dr = 0 and u.role = 2 and r.status=0 and r.studentId = u1.id and u1.college = u.college and u.grade =u1.grade and u.id=#{id} and r.day<7")
    List<DataVo> InstructorSelectRecord(@Param("id") Integer id);

    @Select("SELECT * FROM user l,record r,user s WHERE l.role=3 AND l.dr = 0 AND r.dr = 0 AND  s.dr=0 AND s.college = l.college and r.`status` = 0 and r.studentId = s.id and l.id = ${id} and day>7")
    List<DataVo> leaderSelectRecord(@Param("id") Integer id);

    @Insert("INSERT INTO record r(r.beginTime,r.endTime,r.reason,r.createTime,r.day,r.`status`) VALUES()")
    void insertRecord(@Param("eo") DataVo dataVo);

}
