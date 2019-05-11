package com.lyp.leave.service;

import com.lyp.leave.eo.Result;
import com.lyp.leave.eo.eo.DataVo;
import com.lyp.leave.eo.eo.RecordEo;
import com.lyp.leave.mapper.RecordMapper;
import com.lyp.leave.vo.RecordRequestVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RecordService {
    @Resource
    private RecordMapper recordMapper;

    public void insertRecord(RecordEo RecordEo) {
        recordMapper.insertRecord(RecordEo);
    }

    public Result studentSelectRecord(Integer id, Integer page, Integer limit) {
        page = (page - 1) * limit;
        List<DataVo> dataVos = recordMapper.studentSelectRecord(id, page, limit);
        Integer count = recordMapper.selectCount();
        return new Result(0, "", dataVos, count);
    }

    public void deleteRecord(Integer id) {
        recordMapper.deleteRecord(id);
    }

    public RecordEo selectRecordById(Integer id) {
        RecordEo recordEo = recordMapper.selectRecordById(id);
        return recordEo;
    }

    public void xiaoJiaRecord(Integer id) {
        recordMapper.xiaoJiaRecord(id);
    }

    public Result InstructorSelectRecord(Integer id,Integer page,Integer limit) {
        page = (page - 1) * limit;
        List<DataVo> dataVos = recordMapper.InstructorSelectRecord(id, page, limit);
        Integer count = recordMapper.selectCount();
        return new Result(0, "", dataVos, count);
    }

    public void refuseRecord(Integer auditorId, Integer id) {
        recordMapper.refuseRecord(auditorId, id);
    }

    public void adoptRecord(Integer auditorId, Integer id) {
        recordMapper.adoptRecord(auditorId, id);
    }

    public Result leaderSelectRecord(Integer id, Integer page, Integer limit) {
        page = (page - 1) * limit;
        List<DataVo> dataVos = recordMapper.leaderSelectRecord(id, page, limit);
        Integer count = recordMapper.selectCount();
        return new Result(0, "", dataVos, count);
    }

    public Result selectRecord(Integer page, Integer limit, RecordRequestVo vo) {
        List<DataVo> dataVos1 = recordMapper.selectRecord(vo, page, limit);
        Integer count = recordMapper.selectCount();
        return new Result(0, "", dataVos1, count);
    }

    public Result teacherSelectRecord(Integer page, Integer limit) {
        page = (page - 1) * limit;
        List<DataVo> dataVos = recordMapper.teacherSelectRecord(page, limit);
        Integer count = recordMapper.selectCount();
        return new Result(0, "", dataVos, count);
    }
}
