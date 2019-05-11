package com.lyp.leave.service;

import com.lyp.leave.eo.Result;
import com.lyp.leave.eo.eo.UserEo;
import com.lyp.leave.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService {
    @Resource
    private UserMapper userMapper;

    public void insertStudent(UserEo UserEo) {
        userMapper.insertStudent(UserEo);
    }

    public UserEo selectUserById(String number) {
        UserEo userEo = userMapper.selectUserById(number);
        return userEo;
    }

    public Result selectUserList(Integer role, Integer page, Integer limit) {
        page = (page - 1) * limit;
        List<UserEo> userEos = userMapper.selectUserList(role, page, limit);
        Integer count = userMapper.selectCount();
        return new Result(0, "", userEos, count);
    }

    public void addUser(UserEo userEo) {
        userMapper.addUser(userEo);
    }

    public void addInstructorUser(UserEo userEo) {
        userMapper.addInstructorUser(userEo);
    }

    public void addLeaderUser(UserEo userEo) {
        userMapper.addLeaderUser(userEo);
    }

    public void deleteUser(Integer id) {
        userMapper.deleteUser(id);
    }

    public void updateUser(UserEo userEo) {
        userMapper.updateUser(userEo);
    }

    public UserEo login(UserEo userEo) {
        UserEo login = userMapper.login(userEo);
        return login;
    }

    public UserEo selectUser(Integer id) {
        UserEo userEo = userMapper.selectUser(id);
        return userEo;
    }
}
