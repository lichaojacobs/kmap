package org.andy.kmap.common.dao.api;

import org.andy.kmap.common.model.entity.CommonResult;
import org.andy.kmap.common.model.entity.CoursePlanAddModels.CourseViewModel;
import org.andy.kmap.common.model.entity.CoursePlanSearchModel.CoursePlanSearchModel;
import org.andy.kmap.common.model.entity.DropDownModel.CommonDropDown;
import org.andy.kmap.common.model.map.CourseRelations;

import java.util.List;

/**
 * Created by li on 2015/10/30.
 */
public interface APICoursePlanDao {


    public List<CommonDropDown> getDropDownModels(int type);

    public List<CourseViewModel> GetCoursesByAcademy(String academyname);

    public CommonResult AddCoursePlan(List<CourseRelations> courseRelationses,String academy,String major,String year);

    public List<CoursePlanSearchModel> getSearchResults(String college,String major,String year);
}
