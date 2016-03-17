package org.andy.kmap.model.dao.apiDao;

import org.andy.kmap.model.entity.CommonResult;
import org.andy.kmap.model.entity.CoursePlanAddModels.CourseViewModel;
import org.andy.kmap.model.entity.CoursePlanSearchModel.CoursePlanSearchModel;
import org.andy.kmap.model.entity.DropDownModel.DropDownViewModel;
import org.andy.kmap.model.map.CourseRelations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

/**
 * Created by li on 2015/10/30.
 */
public interface APICoursePlanDao {


    public List<DropDownViewModel> getDropDownModels(int type);

    public List<CourseViewModel> GetCoursesByAcademy(String academyname);

    public CommonResult AddCoursePlan(List<CourseRelations> courseRelationses,String academy,String major,String year);

    public List<CoursePlanSearchModel> getSearchResults(String college,String major,String year);
}
