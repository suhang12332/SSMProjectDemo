package com.su.service.memberidserviceimpl;

import com.su.dao.MemberidDao;
import com.su.dao.OrdersDao;
import com.su.entity.Memberid;
import com.su.service.MemberidService;
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
 * @date 2019/8/21 下午4:55
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class MemberidServiceImpl extends BaseServiceImpl<Memberid> implements MemberidService {

    public MemberidServiceImpl(MemberidDao memberidDao) {
        super(memberidDao);
    }

    @Override
    public List<Memberid> findAll() {
        return memberidDao.findAll();
    }

    @Override
    public Memberid findById(Integer id) {
        return null;
    }

    @Override
    public int deleteById(Integer id) {
        return 0;
    }

    @Override
    public int insert(Memberid memberid) {
        return 0;
    }

    @Override
    public int update(Memberid memberid) {
        return 0;
    }
}
