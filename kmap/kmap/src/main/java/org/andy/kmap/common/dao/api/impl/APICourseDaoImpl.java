package org.andy.kmap.common.dao.api.impl;

import org.andy.kmap.common.dao.api.APICourseDao;
import org.andy.kmap.common.model.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by li on 2015/10/20.
 */
@Repository("APICourseDaoImpl")
public class APICourseDaoImpl implements APICourseDao {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<AddCourseViewModel> getAllCourses(){

        List<AddCourseViewModel> addCourseViewModels=new ArrayList<AddCourseViewModel>();
        try {

            String sql="SELECT * FROM academy ";
            addCourseViewModels=  jdbcTemplate.query(sql, new RowMapper<AddCourseViewModel>() {
                @Override
                public AddCourseViewModel mapRow(ResultSet resultSet, int i) throws SQLException {
                        AddCourseViewModel addMajorViewModel = new AddCourseViewModel();
                        addMajorViewModel.setId(resultSet.getInt("codeNumber"));
                        addMajorViewModel.setAcademyName(resultSet.getString("name"));
                        return addMajorViewModel;

                }
            });

            //获取majors
            List<List<Course>> courses=new ArrayList<List<Course>>(addCourseViewModels.size());
            System.out.println(addCourseViewModels.size());
            int index=0;
            for(AddCourseViewModel addCourseViewModel:addCourseViewModels){

                String sqlForMajors="select courseCode,name,credit from course where academyId="+addCourseViewModel.getId();
                courses.add(index, jdbcTemplate.query(sqlForMajors, new RowMapper() {
                    @Override
                    public Course mapRow(ResultSet resultSet, int i) throws SQLException {
                       Course course=new Course(resultSet.getInt("courseCode"));
                        course.setName(resultSet.getString("name"));
                        course.setCredit(resultSet.getInt("credit"));
                        return course;
                    }
                }));
                addCourseViewModel.setCourses(courses.get(index));
                index++;
            }
            return addCourseViewModels;

        }catch (Exception ex){

            ex.printStackTrace();


        }

        return null;


    }

    public CommonResult addCourse(Course course){

        //定义返回的结果
        CommonResult commonResult=new CommonResult();

        try {

            //拿到之后首先检查该记录是否重了
            String sql="select courseCode,name FROM course where courseCode=? AND name=?";
            List< Course> result=  jdbcTemplate.query(sql, new Object[]{course.getId(),course.getName()}, new RowMapper<Course>() {
                @Override
                public Course mapRow(ResultSet resultSet, int i) throws SQLException {
                    if(resultSet.next()) {
                        Course course1 = new Course(resultSet.getInt("courseCode"),resultSet.getString("name"));
                        return course1;
                    }else
                        return null;
                }
            });
            //说明添加了重复的元素
            if(result!=null&&result.size()>0)
            {
                commonResult.setStatus(-1);
                commonResult.setDetail("禁止重复添加！");
                return commonResult;

            }else
            {
                //插入数据
                String updateSql="INSERT INTO course(courseCode,name,credit,academyId,category,property) VALUES(?,?,?,?,?,?)";
                jdbcTemplate.update(updateSql,new Object[]{course.getId(),course.getName(),course.getCredit(),course.getAcademyId(),course.getCategoryId(),
                course.getPropertyId()});
                commonResult.setStatus(1);
                commonResult.setDetail("添加成功");
                return commonResult;

            }

        }catch (Exception ex){

            commonResult.setDetail(ex.getMessage());
            commonResult.setStatus(-1);
            return commonResult;

        }
    }

    public CommonResult deleteCourse(Course course){

        //定义返回的结果
        CommonResult commonResult=new CommonResult();
        try{
            jdbcTemplate.update("DELETE FROM course WHERE courseCode="+course.getId());
            commonResult.setStatus(1);
            commonResult.setDetail("已删除");
            return commonResult;

        }catch (Exception ex){

            commonResult.setStatus(-1);
            commonResult.setDetail(ex.getMessage());

            return commonResult;

        }


    }

    public CommonResult editCourse(Course course){

        //定义返回的结果
        CommonResult commonResult=new CommonResult();
        try {
            jdbcTemplate.update("UPDATE course SET credit="+course.getCredit()+",name='"+course.getName()+"'WHERE courseCode="+course.getId());
            commonResult.setStatus(1);
            commonResult.setDetail("修改成功！");
            return commonResult;

        }catch (Exception ex){

            commonResult.setDetail(ex.getMessage());
            commonResult.setStatus(-1);
            return commonResult;

        }



    }


}
