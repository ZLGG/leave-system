package com.zyx.course.service;

import com.zyx.course.eo.*;
import com.zyx.course.mapper.UserMapper;
import com.zyx.course.vo.DataVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService {
    @Resource
    private UserMapper UserMapper;

    public List<DataVo> selectUserList(Integer id) {
        List<DataVo> userEos = UserMapper.selectUserList(id);
        return userEos;
    }

    @Transactional
    public void insertDate(ProjectDate DataVo) {
        UserMapper.deleteDate();
        UserMapper.insertDate(DataVo);
    }

    public void deleteUser(Integer id) {
        UserEo userEo = new UserEo();
        userEo.setId(id);
        UserMapper.deleteUser(userEo);
    }

    public Result selectLimitProject() {
        List<DataVo> dataVos = UserMapper.selectLimitProject();
        Integer count = UserMapper.selectCount();
        return new Result(0,"",dataVos,count);
    }

    public List<DataVo> getTeacher() {
        List<DataVo> teacher = UserMapper.getTeacher();
        return teacher;
    }

    public void insertUser(UserEo UserEo) {
        UserMapper.insertUser(UserEo);
    }

    public UserEo Login(UserEo UserEo) {

        UserEo eo = UserMapper.selectUser(UserEo);
        return eo;
    }

    public void updateUser(UserEo UserEo) {
        UserMapper.updateUser(UserEo);

    }

    public UserEo selectUserByNumber(String number) {
        return UserMapper.selectUserByNumber(number);
    }


}
