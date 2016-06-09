package org.andy.kmap.common.service.apiService;

import org.andy.kmap.common.dao.api.APIAcademyDao;
import org.andy.kmap.common.model.entity.Academy;
import org.andy.kmap.common.model.entity.CommonResult;
import org.andy.kmap.common.model.entity.Grade;
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


    public CommonResult deleteAcademies(int collegeid){

        return apiAcademyDao.deleteAcademies(collegeid);

    }


    public CommonResult editAcademy(Academy academy){

       return  apiAcademyDao.editAcademy(academy);

    }


    public CommonResult gradeAdd(Grade grade){

        return apiAcademyDao.gradeAdd(grade);

    }




}
