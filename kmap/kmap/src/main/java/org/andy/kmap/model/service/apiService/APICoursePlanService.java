package org.andy.kmap.model.service.apiService;

import org.andy.kmap.model.dao.apiDao.APICourseDao;
import org.andy.kmap.model.dao.apiDao.APICoursePlanDao;
import org.andy.kmap.model.entity.CoursePlanAddModels.CourseViewModel;
import org.andy.kmap.model.entity.DropDownModel.DropDownViewModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by li on 2015/10/30.
 */

@Service("APICoursePlanService")
public class APICoursePlanService {

    @Autowired
    @Qualifier("APICoursePlanDaoImpl")
    private APICoursePlanDao apiCoursePlanDao;

    public List<DropDownViewModel> getDropDownModels(){

        return apiCoursePlanDao.getDropDownModels();

    }


    public List<CourseViewModel> GetCoursesByAcademy(String academyname){

        return apiCoursePlanDao.GetCoursesByAcademy(academyname);

    }



}
