package com.lyp.leave.mapper;

import com.lyp.leave.eo.eo.DataVo;
import com.lyp.leave.eo.eo.RecordEo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface RecordMapper {
    @Select("SELECT FOUND_ROWS() as count;")
    Integer selectCount();

    @Select("select SQL_CALC_FOUND_ROWS * from record r where r.dr=0 and r.studentId = #{id} limit #{page},#{limit}")
    List<DataVo> studentSelectRecord(@Param("id") Integer id,@Param("page")Integer page,@Param("limit")Integer limit);

    @Select("select SQL_CALC_FOUND_ROWS r.id,u1.userName,u1.clas,r.beginTime,r.endTime,u1.phone,r.reason,r.createTime from user u,record r ,user u1 where u.dr = 0 and u1.dr = 0 and r.dr = 0 and u.role = 2 and r.status=0 and r.studentId = u1.id and u1.college = u.college and u.grade =u1.grade and u.id=#{id} and r.day<7 limit #{page},#{limit}")
    List<DataVo> InstructorSelectRecord(@Param("id") Integer id,@Param("page")Integer page,@Param("limit")Integer limit);

    @Select("SELECT SQL_CALC_FOUND_ROWS r.id,s.userName,s.grade,s.clas,r.beginTime,r.endTime,s.phone,r.reason,r.createTime FROM user l,record r,user s WHERE l.role=3 AND l.dr = 0 AND r.dr = 0 AND  s.dr=0 AND s.college = l.college and r.`status` = 0 and r.studentId = s.id and l.id = ${id} and day>6 limit #{page},#{limit}")
    List<DataVo> leaderSelectRecord(@Param("id") Integer id,@Param("page")Integer page,@Param("limit")Integer limit);

    @Insert("INSERT INTO record (studentId,beginTime,endTime,reason,createTime,day,status) VALUES(#{eo.studentId},#{eo.beginTime},#{eo.endTime},#{eo.reason},now(),#{eo.day},0)")
    void insertRecord(@Param("eo") RecordEo RecordEo);

    @Update("update record set status = #{eo.status}")
    void updateRecord(@Param("eo") RecordEo recordEo);

    @Update("update record set dr = 1 where id=#{id}")
    void deleteRecord(@Param("id") Integer id);

    @Select("select * from record where dr=0 and id=#{id}")
    RecordEo selectRecordById(@Param("id") Integer id);

    @Update("update record set status=1 where id=#{id} and dr = 0 and status=3")
    void xiaoJiaRecord(@Param("id") Integer id);

    @Update("update record set status=2 ,auditorId=#{auditorId} where id = #{id}")
    void refuseRecord(@Param("auditorId") Integer auditorId, @Param("id") Integer id);

    @Update("update record set status=3 ,auditorId = #{auditorId} where id=#{id}")
    void adoptRecord(@Param("auditorId") Integer auditorId, @Param("id") Integer id);

}
