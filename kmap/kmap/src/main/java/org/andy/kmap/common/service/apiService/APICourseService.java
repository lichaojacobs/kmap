package org.andy.kmap.common.service.apiService;

import org.andy.kmap.common.dao.api.APICourseDao;
import org.andy.kmap.common.model.entity.AddCourseViewModel;
import org.andy.kmap.common.model.entity.CommonResult;
import org.andy.kmap.common.model.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by li on 2015/10/20.
 */

@Service("APICourseService")
public class APICourseService {


    @Autowired
    @Qualifier("APICourseDaoImpl")
    private APICourseDao apiCourseDao;

    /**
     * 获得所有学院的专业
     * @return
     */
    public List<AddCourseViewModel> getAllCourses(){

      return   apiCourseDao.getAllCourses();

    }

    /**
     * 添加课程
     * @return
     */
    public CommonResult addCourse(Course course){

        return apiCourseDao.addCourse(course);

    }


    public CommonResult deleteCourse(Course course){

        return  apiCourseDao.deleteCourse(course);
    }

    public CommonResult editCourse(Course course){

        return apiCourseDao.editCourse(course);
    }

}
