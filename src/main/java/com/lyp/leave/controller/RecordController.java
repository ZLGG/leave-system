package com.lyp.leave.controller;

import com.lyp.leave.eo.Result;
import com.lyp.leave.eo.eo.DataVo;
import com.lyp.leave.eo.eo.RecordEo;
import com.lyp.leave.eo.eo.UserEo;
import com.lyp.leave.service.RecordService;
import com.lyp.leave.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class RecordController {
    @Autowired
    private RecordService RecordService;
    @Autowired
    private UserService userService;

    @ResponseBody
    @RequestMapping("/session/{id}")
    public String addSession(HttpSession session, @PathVariable(name = "id")Integer id) {
        UserEo userEo = new UserEo();
        userEo.setId(id);
        userEo.setNumber("15631030602");
        userEo.setUserName("zlg");
        userEo.setPhone("17633901170");
        userEo.setRole(0);
        session.setAttribute("user", userEo);
        return "success";
    }

    /**
     * 请假
     * @param RecordEo
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/addRecord")
    public Result addRecord(RecordEo RecordEo,HttpSession session) throws Exception{
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        long time = simpleDateFormat.parse(RecordEo.getEndTime()).getTime();
        long time1 = simpleDateFormat.parse(RecordEo.getBeginTime()).getTime();
        long date = time - time1;
        UserEo user = (UserEo) session.getAttribute("user");
        long l;
        if (date > 0) {
            l = date / 3600 / 1000/ 24;
        } else {
            return new Result(-1,"","");
        }
        RecordEo.setDay(l);
        RecordEo.setStudentId(user.getId());
        RecordService.insertRecord(RecordEo);
        return new Result(0,"","");
    }

    /**
     * 学生请假列表
     * @param id
     * @param page
     * @param limit
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/studentSelectRecord")
    public Result studentSelectRecord(Integer id, Integer page, Integer limit, HttpSession session) {
        UserEo user = (UserEo) session.getAttribute("user");
        //Result result = RecordService.studentSelectRecord(user.getId(), page, limit);
        Result result = RecordService.studentSelectRecord(user.getId(), page, limit);
        for (DataVo recordEo : (List<DataVo>) result.getData()) {
            if (recordEo.getStatus() == 0) {
                recordEo.setStatusName("待批准");
            }
            else if (recordEo.getStatus() == 1) {
                recordEo.setStatusName("已销假");
            } else if (recordEo.getStatus() == 2) {
                recordEo.setStatusName("拒绝");
            } else {
                recordEo.setStatusName("待销假");
            }
        }
        return result;
    }

    /**
     * 取消请假
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/cancelRecord")
    public Result cancelRecord(Integer id) {
        RecordEo recordEo = RecordService.selectRecordById(id);
        if (recordEo.getStatus() != 0 ) {
            return new Result(-1, "", "");
        }
        RecordService.deleteRecord(id);
        return new Result(0,"","");
    }

    /**
     * 销假
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/xiaoJiaRecord")
    public Result xiaojia(Integer id) {
        RecordEo recordEo = RecordService.selectRecordById(id);
        if (recordEo.getStatus() == 0) {
            return new Result(0, "", "");
        } else if (recordEo.getStatus() == 1) {
            return new Result(1, "", "");
        } else if (recordEo.getStatus() == 2) {
            return new Result(2, "", "");
        } else {
            RecordService.xiaoJiaRecord(id);
            return new Result(3, "", "");
        }
    }

    /**
     * 辅导员查看请假列表
     * @param session
     * @param page
     * @param limit
     * @return
     */
    @ResponseBody
    @RequestMapping("/getInstructorRecordList")
    public Result getInstructorRecordList(HttpSession session,
                                          @RequestParam(defaultValue = "1") Integer page,
                                          @RequestParam(defaultValue = "10") Integer limit) {
        UserEo user = (UserEo) session.getAttribute("user");
        Result result = RecordService.InstructorSelectRecord(user.getId(), page, limit);
        return result;
    }

    /**
     * 拒绝请假
     * @param id
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/refuseRecord")
    public Result refuseRecord(Integer id,HttpSession session) {
        UserEo user = (UserEo) session.getAttribute("user");
        RecordService.refuseRecord(user.getId(), id);
        return new Result(0,"","");
    }

    /**
     * 批准请假
     * @param id
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/adoptRecord")
    public Result adoptRecord(Integer id, HttpSession session) {
        UserEo user = (UserEo) session.getAttribute("user");
        RecordService.adoptRecord(user.getId(), id);
        return new Result(0, "", "");
    }

    /**
     * 领导查看请假列表
     * @param page
     * @param limit
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/getLeaderRecordList")
    public Result leaderSelectRecord(Integer page, Integer limit, HttpSession session) {
        UserEo user = (UserEo) session.getAttribute("user");
        Result result = RecordService.leaderSelectRecord(user.getId(), page, limit);
        return result;
    }

    @ResponseBody
    @RequestMapping("/getRecord")
    public Result getRecord(Integer page, Integer limit) {
        Result result = RecordService.teacherSelectRecord(page, limit);
        for (DataVo dataVo : (List<DataVo>) result.getData()) {
            UserEo userEo = userService.selectUser(dataVo.getAuditorId());
            dataVo.setAuditorIdName(userEo.getUserName());
            if (dataVo.getStatus()==1) {
                dataVo.setStatusName("已销假");
            } else if (dataVo.getStatus() == 2) {
                dataVo.setStatusName("已拒绝");
            } else if (dataVo.getStatus() == 3) {
                dataVo.setStatusName("待销假");
            } else {
                dataVo.setStatusName("待批准");
            }

        }
        return result;
    }
}
