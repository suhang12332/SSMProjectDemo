package com.su.service.touristserviceimpl;

import com.github.pagehelper.PageHelper;
import com.su.dao.TouristDao;
import com.su.entity.Tourist;
import com.su.service.TouristService;
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
 * @date 2019/8/19 下午4:04
 */
@Service
@Transactional(rollbackFor = {Exception.class})
public class TouristServiceImpl extends BaseServiceImpl<Tourist> implements TouristService {
    public TouristServiceImpl(TouristDao touristDao) {
        super(touristDao);
    }

    @Override
    public List<Tourist> findAll(int page, int size) {
        //参数pageMum是页码数,pageSize是每页显示的条数
        PageHelper.startPage(page, size);
        return touristDao.findAll(page, size);
    }

    @Override
    public Tourist findById(Integer id) {
        return touristDao.findById(id);
    }

    @Override
    public int deleteById(Integer id) {
        return touristDao.deleteById(id);
    }

    @Override
    public int insert(Tourist tourist) {
        return touristDao.insert(tourist);
    }

    @Override
    public int update(Tourist tourist) {

        return touristDao.update(tourist);
    }


    @Override
    public List<Tourist> selectTouristByCredentialsNum(String credentialsNum) {
        return touristDao.selectTouristByCredentialsNum(credentialsNum);
    }

    @Override
    public List<Tourist> selectTouristByPhoneNumber(String phoneNumber) {
        return touristDao.selectTouristByPhoneNumber(phoneNumber);
    }

    @Override
    public List<Tourist> findAllNoPage() {
        return touristDao.findAllNoPage();
    }
}
