package com.zyx.course.controller;

import com.zyx.course.eo.ProjectDate;
import com.zyx.course.eo.Result;
import com.zyx.course.eo.UserEo;
import com.zyx.course.mapper.UserMapper;
import com.zyx.course.service.UserService;
import com.zyx.course.vo.DataVo;
import javafx.geometry.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService UserService;

    @RequestMapping("/")
    public String toPage() {
        return "back-login";
    }

    @RequestMapping("/test/{page}")
    public String toPage(@PathVariable String page) {
        return page;
    }

    @RequestMapping("/test/{page}/{page1}")
    public String toPage(@PathVariable String page, @PathVariable String page1) {
        return page + "/" + page1;
    }

    @ResponseBody
    @RequestMapping("/getUserList")
    public Result getUserList(Integer pageSize, Integer limit) {
        List<DataVo> dataVos = UserService.selectUserList(null);
        for (DataVo dataVoataVo : dataVos) {
            if (dataVoataVo.getRole() == 0) {
                dataVoataVo.setRoleName("学生");
            } else if (dataVoataVo.getRole() == 1) {
                dataVoataVo.setRoleName("教师");
            } else {
                dataVoataVo.setRoleName("管理员");
            }
        }
        return new Result(0, "111", dataVos, 1);
    }

    @ResponseBody
    @RequestMapping("/setDate")
    public Result setDate(ProjectDate DataVo) {

        UserService.insertDate(DataVo);

        return new Result(200, "成功", "");
    }

    @InitBinder
    public void initBinder(ServletRequestDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
// binder.registerCustomEditor(String.class, new StringTrimmerEditor(false));
    }

    @ResponseBody
    @RequestMapping(value = "/deleteUserList", method = RequestMethod.POST)
    public Result deleteUserList(@RequestBody String[] id) {
        System.out.print(id);
        return new Result(0, "", "", 100);
    }

    @ResponseBody
    @RequestMapping("/deleteUser")
    public Result deleteUser(Integer id) {
        UserService.deleteUser(id);
        return new Result();
    }

    @ResponseBody
    @RequestMapping("/login")
    public Result login(UserEo UserEo, HttpSession session) {
       UserEo login = UserService.Login(UserEo);
        if (login == null) {
            return new Result(1, "", "");
        }
        session.setAttribute("user", login);
        return new Result(0, "", "");
    }

    @RequestMapping("/signOut")
    public String signOut(HttpSession session) {
        session.invalidate();
        return "back-login";
    }

    @ResponseBody
    @RequestMapping("/updateUser")
    public Result updateUser(UserEo UserEo,HttpSession session) {
        UserEo user = (UserEo)session.getAttribute("user");
        user.setPassword(UserEo.getPassword());
        UserService.updateUser(user);
        return new Result(0,"","");
    }

    @ResponseBody
    @RequestMapping("/selectLimitProject")
    public Result selectLimitProject() {
        Result result = UserService.selectLimitProject();
        return result;
    }

    @ResponseBody
    @RequestMapping("/getTeacher")
    public Result getTeacher(HttpSession session) {

        List<DataVo> teacher = UserService.getTeacher();
        session.setAttribute("teacher",teacher);
        return new Result(200,"","");
    }

    @ResponseBody
    @RequestMapping("/addUser")
    public Result addUser(UserEo DataVo) {
        UserEo userEo = UserService.selectUserByNumber(DataVo.getNumber());
        if (userEo != null) {
            return new Result(1, "", "");
        }
        UserService.insertUser(DataVo);
        return new Result(200, "", "");
    }



}
