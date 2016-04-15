package org.andy.kmap.model.service;

import org.andy.kmap.model.entity.CommonResult;
import org.andy.kmap.model.entity.User;
import org.andy.kmap.model.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service("UserService")
public class UserService {

    @Autowired
    @Qualifier("UserDaoImpl")
    private UserDao userDao;


    /**
     * This method adds a user to the database.
     * @param user
     */
    @Transactional()
    public CommonResult addUser(User user) {

       return  userDao.addUser(user);

    }


    /**
     * This method gets a User instance by email address.
     * @param email
     * @return
     */
    public User getUser(String email) {

        return userDao.getUser(email);

    }


    /**
     * This method checks whether login is valid.
     */
    public boolean isValidLogin(String email, String password) {

        return this.getUser(email).getPassword().equals(password);
    }

    /**
     * 获取用户的角色
     * @param email
     * @return
     */
    public String getUserRole(String email){

        return userDao.getUserRole(email);

    }


    /**
     * 完善个人信息
     * @param user
     * @return
     */
    public CommonResult addUserInfo(User user){
        return userDao.addUserInfo(user);
    }

}

