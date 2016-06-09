package org.andy.kmap.common.service.apiService;

import org.andy.kmap.common.dao.api.APICoursePlanDao;
import org.andy.kmap.common.model.entity.CommonResult;
import org.andy.kmap.common.model.entity.CoursePlanAddModels.CourseViewModel;
import org.andy.kmap.common.model.entity.CoursePlanSearchModel.CoursePlanSearchModel;
import org.andy.kmap.common.model.entity.DropDownModel.CommonDropDown;
import org.andy.kmap.common.model.map.CourseRelations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by li on 2015/10/30.
 */

@Service("APICoursePlanService")
public class APICoursePlanService {

    @Autowired
    @Qualifier("APICoursePlanDaoImpl")
    private APICoursePlanDao apiCoursePlanDao;

    public List<CommonDropDown> getDropDownModels(int type){

        return apiCoursePlanDao.getDropDownModels(type);

    }

    public List<CourseViewModel> GetCoursesByAcademy(String academyname){

        return apiCoursePlanDao.GetCoursesByAcademy(academyname);

    }

    @Transactional
    public CommonResult AddCoursePlan(List<CourseRelations> courseRelationses, String academy, String major, String year){

        return  apiCoursePlanDao.AddCoursePlan(courseRelationses,academy,major,year);
    }

    public List<CoursePlanSearchModel> getSearchResults(String college, String major, String year){
        return apiCoursePlanDao.getSearchResults(college,major,year);
    }

}
