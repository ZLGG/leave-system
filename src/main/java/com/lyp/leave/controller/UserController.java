package com.lyp.leave.controller;

import com.lyp.leave.eo.Result;
import com.lyp.leave.eo.eo.UserEo;
import com.lyp.leave.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
public class UserController {
    @Autowired
    private UserService userService;


    @RequestMapping("/insertStudent")
    public Result insertStudent(UserEo userEo) {
        UserEo userEo1 = userService.selectUserById(userEo.getNumber());
        if (userEo1 != null) {
            return new Result(-1, "", "");
        }
        userService.insertStudent(userEo);
        return new Result(0, "", "");
    }

    @ResponseBody
    @RequestMapping("/getStudentList")
    public Result getStudentList(Integer page, Integer limit) {
        Result result = userService.selectUserList(0, page, limit);
        return result;
    }
    @ResponseBody
    @RequestMapping("/getTeacherList")
    public Result getTeacherList(Integer page, Integer limit) {
        Result result = userService.selectUserList(1, page, limit);
        return result;
    }
    @ResponseBody
    @RequestMapping("/getInstructorList")
    public Result getInstructorList(Integer page, Integer limit) {
        Result result = userService.selectUserList(2, page, limit);
        return result;
    }
    @ResponseBody
    @RequestMapping("/getLeaderList")
    public Result getLeaderList(Integer page, Integer limit) {
        Result result = userService.selectUserList(3, page, limit);
        return result;
    }
    @ResponseBody
    @RequestMapping("/getAdminList")
    public Result getAdminList(Integer page, Integer limit) {
        Result result = userService.selectUserList(4, page, limit);
        return result;
    }

    @ResponseBody
    @RequestMapping("/addTeacherUser")
    public Result addTeacherUser(UserEo userEo) {
        UserEo userEo1 = userService.selectUserById(userEo.getNumber().trim());
        if (userEo1 != null) {
            return new Result(-1, "", "");
        }
        userEo.setRole(1);
        userService.addUser(userEo);
        return new Result(0, "", "");
    }
    @RequestMapping("/addAdminUser")
    public Result addAdminUser(UserEo userEo) {
        UserEo userEo1 = userService.selectUserById(userEo.getNumber().trim());
        if (userEo1 != null) {
            return new Result(-1, "", "");
        }
        userEo.setRole(4);
        userService.addUser(userEo);
        return new Result(0, "", "");
    }

    @ResponseBody
    @RequestMapping("/addInstructorUser")
    public Result addInstructorUser(UserEo userEo) {
        UserEo userEo1 = userService.selectUserById(userEo.getNumber().trim());
        if (userEo1 != null) {
            return new Result(-1, "", "");
        }
        userService.addInstructorUser(userEo);
        return new Result(0, "", "");
    }
    @ResponseBody
    @RequestMapping("/addLeaderUser")
    public Result addLeaderUser(UserEo userEo) {
        UserEo userEo1 = userService.selectUserById(userEo.getNumber().trim());
        if (userEo1 != null) {
            return new Result(-1, "", "");
        }
        userService.addLeaderUser(userEo);
        return new Result(0, "", "");
    }

    @ResponseBody
    @RequestMapping("/deleteUser")
    public Result deleteUser(Integer id) {
        userService.deleteUser(id);
        return new Result(0, "", "");
    }


    @ResponseBody
    @RequestMapping("/updateUser")
    public Result updateUser(UserEo userEo,HttpSession session) {
        UserEo user = (UserEo) session.getAttribute("user");
        userEo.setId(user.getId());
        userService.updateUser(userEo);
        session.setAttribute("user", user);
        return new Result(0, "", "");
    }

    @ResponseBody
    @RequestMapping("/login")
    public Result login(UserEo userEo, HttpSession session) {
        UserEo eo = userService.login(userEo);
        if (eo != null) {
            session.setAttribute("user", eo);
            return new Result(0, "", "");
        }
        return new Result(-1, "", "");
    }
}
