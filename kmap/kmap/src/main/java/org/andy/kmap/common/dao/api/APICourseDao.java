package org.andy.kmap.common.dao.api;

import org.andy.kmap.common.model.entity.AddCourseViewModel;
import org.andy.kmap.common.model.entity.CommonResult;
import org.andy.kmap.common.model.entity.Course;

import java.util.List;

/**
 * Created by li on 2015/10/20.
 */
public interface APICourseDao {

    public List<AddCourseViewModel> getAllCourses();

    public CommonResult addCourse(Course course);

    public  CommonResult deleteCourse(Course course);

    public CommonResult editCourse(Course course);

}
