package org.andy.kmap.model.dao.apiDao;

import org.andy.kmap.model.entity.Academy;
import org.andy.kmap.model.entity.CommonResult;
import org.andy.kmap.model.entity.Grade;

import java.util.List;

/**
 * Created by Mtime on 2015/9/19.
 */


public interface APIAcademyDao {


    public List<Academy> getAllAcademies();

    public CommonResult addAcademies(Academy academy);

    public CommonResult deleteAcademies(int collegeid);

    public CommonResult editAcademy(Academy academy);

    public CommonResult gradeAdd(Grade grade);


}
