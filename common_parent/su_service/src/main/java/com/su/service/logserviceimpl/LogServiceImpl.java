package com.su.service.logserviceimpl;

import com.github.pagehelper.PageHelper;
import com.su.dao.LogDao;
import com.su.entity.Log;
import com.su.service.LogService;
import com.su.service.baseservice.BaseServiceImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/9/5 下午2:29
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class LogServiceImpl extends BaseServiceImpl<Log> implements LogService {
    public LogServiceImpl(LogDao logDao) {
        super(logDao);
    }

    @Override
    public List<Log> findAll(int page, int size) {
        //参数pageMum是页码数,pageSize是每页显示的条数
        PageHelper.startPage(page, size);
        return logDao.findAll(page,size);
    }

    @Override
    public int deleteByUserName(String userName) {
        return logDao.deleteByUserName(userName);
    }

    @Override
    public Log findById(Integer id) {
        return null;
    }

    @Override
    public int deleteById(Integer id) {
        return 0;
    }

    @Override
    public int insert(Log log) {
        return logDao.insert(log);
    }

    @Override
    public List<Log> findByUserName(String userName,int page, int size) {
        //参数pageMum是页码数,pageSize是每页显示的条数
        PageHelper.startPage(page, size);
        return logDao.findByUserName(userName, page, size);
    }

    @Override
    public int update(Log log) {
        return 0;
    }
}
