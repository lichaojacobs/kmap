package org.andy.kmap.common.service;

import java.util.List;

import org.andy.kmap.common.model.entity.Major;
import org.andy.kmap.common.dao.MajorDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("MajorService")
public class MajorService {

    @Autowired
    @Qualifier("MajorDaoImpl")
    private MajorDao majorDao;

    public void addMajor(Major major) {
        this.majorDao.addMajor(major);
    }

    public List<Major> getMajor() {
        return this.majorDao.getMajor();
    }

    public Major getMajorByUserId(String email){
        return this.majorDao.getMajorByUserId(email);
    };
}
