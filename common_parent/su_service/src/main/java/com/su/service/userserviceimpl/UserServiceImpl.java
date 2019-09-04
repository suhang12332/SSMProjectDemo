package com.su.service.userserviceimpl;

import com.github.pagehelper.PageHelper;
import com.su.dao.UserDao;
import com.su.dao.basedao.BaseDao;
import com.su.entity.User;
import com.su.service.UserService;
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
 * @date 2019/8/26 下午8:28
 */
@Service
@Transactional(rollbackFor = {Exception.class})
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
    public UserServiceImpl(UserDao userDao) {
        super(userDao);
    }

    @Override
    public List<User> findAll(int page, int size) {
        //参数pageMum是页码数,pageSize是每页显示的条数
        PageHelper.startPage(page, size);
        return userDao.findAll(page,size);
    }

    @Override
    public User findById(Integer id) {

        return userDao.findById(id);
    }

    @Override
    public int deleteById(Integer id) {
        return userDao.deleteById(id);
    }

    @Override
    public int insert(User user) {
        return userDao.insert(user);
    }

    @Override
    public List<User> selectByPhoneNum(String phoneNum) {
        return userDao.selectByPhoneNum(phoneNum);
    }

    @Override
    public List<User> selectByUserName(String userName) {
        return userDao.selectByUserName(userName);
    }


    @Override
    public int update(User user) {
        return userDao.update(user);
    }

    @Override
    public Boolean isLogin(User user) {
        User userInformation = userDao.selectByName(user.getUserName());
        //当用户不为空的时候并且用户密码与数据库的一致的时候登录成功
        return userInformation != null && user.getUserPassword().equals(userInformation.getUserPassword());
    }

    @Override
    public User findUserByName(User user) {
        return userDao.selectByName(user.getUserName());
    }

    @Override
    public int deleteUserRoleById(Integer id) {
        return userDao.deleteUserRoleById(id);
    }
}
