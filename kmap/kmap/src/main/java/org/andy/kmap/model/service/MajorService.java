package org.andy.kmap.model.service;

import java.util.List;

import org.andy.kmap.model.entity.Major;
import org.andy.kmap.model.dao.MajorDao;

public class MajorService {

    private MajorDao majorDao;


    public MajorService(MajorDao majorDao) {
        this.majorDao = majorDao;
    }


    public void addMajor(Major major) {
        this.majorDao.addMajor(major);
    }


    public List<Major> getMajor() {
        return this.majorDao.getMajor();
    }
}
