package org.andy.kmap.model.service.apiService;

import org.andy.kmap.model.dao.apiDao.APIAcademyDao;
import org.andy.kmap.model.entity.Academy;
import org.andy.kmap.model.entity.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Mtime on 2015/9/19.
 */

@Service("APIAcademyService")
public class APIAcademyService {

    @Autowired
    @Qualifier("APIAcademyDaoImpl")
    private APIAcademyDao apiAcademyDao;


    public List<Academy> getAllAcademies(){

      return   apiAcademyDao.getAllAcademies();

    }

    public CommonResult addAcademies(Academy academy){

        return apiAcademyDao.addAcademies(academy);

    }








}
