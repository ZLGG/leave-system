package com.lyp.leave.service.old;

import com.lyp.leave.eo.ProjectDate;
import com.lyp.leave.eo.Result;
import com.lyp.leave.eo.UserEo;
import com.lyp.leave.vo.DataVo;
import com.lyp.leave.mapper.old.UserOldMapper;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


public class UserService {
    @Resource
    private UserOldMapper UserMapper;

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
