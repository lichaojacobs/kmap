package org.andy.kmap.model.dao.apiDao;

import org.andy.kmap.model.entity.CoursePlanAddModels.CourseViewModel;
import org.andy.kmap.model.entity.DropDownModel.DropDownViewModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

/**
 * Created by li on 2015/10/30.
 */
public interface APICoursePlanDao {



    public List<DropDownViewModel> getDropDownModels();

    public List<CourseViewModel> GetCoursesByAcademy(String academyname);


}
