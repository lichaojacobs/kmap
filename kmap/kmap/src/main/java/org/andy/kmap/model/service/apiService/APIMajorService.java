package org.andy.kmap.model.service.apiService;

import org.andy.kmap.model.dao.apiDao.APIMajorDao;
import org.andy.kmap.model.entity.AddMajorViewModel;
import org.andy.kmap.model.entity.CommonResult;
import org.andy.kmap.model.entity.Major;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by li on 2015/10/13.
 */
@Service("APIMajorService")
public class APIMajorService {

    @Autowired
    @Qualifier("APIMajorDaoImpl")
    private APIMajorDao apiMajorDao;


    public List< AddMajorViewModel> GetMajorsPerGrade(){

      return  apiMajorDao.GetMajorsPerGrade();
    }

    public CommonResult addMajor(Major major){

        return apiMajorDao.addMajor(major);

    }

    /**
     * 修改专业信息
     * @param
     * @return
     */
    public CommonResult editMajor(Major updateMajor,Major pastMajor){

      return   apiMajorDao.editMajor(updateMajor,pastMajor);

    }

    /**
     * 删除专业
     * @param major
     * @return
     */
    public CommonResult deleteMajor(Major major){

        return apiMajorDao.deleteMajor(major);

    }

}
