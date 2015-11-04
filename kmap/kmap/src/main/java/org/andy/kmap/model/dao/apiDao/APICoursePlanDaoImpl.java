package org.andy.kmap.model.dao.apiDao;

import org.andy.kmap.model.entity.Academy;
import org.andy.kmap.model.entity.CoursePlanAddModels.CourseViewModel;
import org.andy.kmap.model.entity.DropDownModel.DropDownViewModel;
import org.andy.kmap.model.entity.DropDownModel.GradeDropDown;
import org.andy.kmap.model.entity.DropDownModel.MajorDropDown;
import org.andy.kmap.model.entity.Grade;
import org.andy.kmap.model.entity.Major;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by li on 2015/10/30.
 */

@Repository("APICoursePlanDaoImpl")
public class APICoursePlanDaoImpl implements APICoursePlanDao {

    @Autowired
    JdbcTemplate jdbcTemplate;


    final List<String> tags=new ArrayList<String>();

    /**
     * 下拉列表对象
     * @return
     */
    public List<DropDownViewModel> getDropDownModels(){
        //定义结果集
        final List<DropDownViewModel> dropDownViewModels=new ArrayList<DropDownViewModel>();
        //获取全部学院
        String sql="select codeNumber,name FROM academy";

        jdbcTemplate.query(sql, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {

                DropDownViewModel dropDownViewModel=new DropDownViewModel();
                dropDownViewModel.setId(resultSet.getInt("codeNumber"));
                dropDownViewModel.setText(resultSet.getString("name"));
                dropDownViewModel.setHref("#parent1");
                dropDownViewModel.setSelectable(false);
                dropDownViewModel.setTags(tags);

                dropDownViewModels.add(dropDownViewModel);
            }
        });

        //循环添加专业
        for (DropDownViewModel dropDownViewModel:dropDownViewModels){

            dropDownViewModel.setNodes(getMajorDropDown(dropDownViewModel.getId()));

        }


        return dropDownViewModels;


    }


    /**
     * 获取下拉列表中专业的信息
     * @return
     */
    public   List<MajorDropDown> getMajorDropDown(int academyId){

        final List<MajorDropDown> majorDropDowns=new ArrayList<MajorDropDown>();

        String sqlForMajors="select id,year,name from major where academyId="+academyId;

        jdbcTemplate.query(sqlForMajors, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {

                MajorDropDown majorDropDown=new MajorDropDown();
                majorDropDown.setSelectable(false);
                majorDropDown.setTags(tags);
                majorDropDown.setHref("#child1");
                majorDropDown.setText(resultSet.getString("name"));
                majorDropDown.setId(resultSet.getInt("id"));
                majorDropDown.setNodes(getGradeDropDown(resultSet.getString("name")));

                majorDropDowns.add(majorDropDown);

            }
        });

        return majorDropDowns;


    }


    /**
     * 获取下拉列表中年级的信息
     * @return
     */
    public  List<GradeDropDown> getGradeDropDown(String name){

        final List<GradeDropDown> gradeDropDowns=new ArrayList<GradeDropDown>();

        String sqlForGrades="select year from major where name=?";

        jdbcTemplate.query(sqlForGrades,new Object[]{name},  new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {

                GradeDropDown gradeDropDown=new GradeDropDown();
                gradeDropDown.setText(resultSet.getString("year"));
                gradeDropDown.setHref("#grandchild1");
                gradeDropDown.setTags(tags);

                gradeDropDowns.add(gradeDropDown);

            }
        });

        return gradeDropDowns;


    }


    /**
     * 获取课程
     * @param academyname
     * @return
     */
    public List<CourseViewModel> GetCoursesByAcademy(String academyname){

        //定义结果集
        final List<CourseViewModel> courseViewModels=new ArrayList<CourseViewModel>();

        String sqlForAcademy="select codeNumber from academy where name=?";
        int academyId= jdbcTemplate.queryForObject(sqlForAcademy, new Object[]{academyname}, new RowMapper<Integer>() {
            @Override
            public Integer mapRow(ResultSet resultSet, int i) throws SQLException {

                return resultSet.getInt("codeNumber");

            }
        });

        final List<Integer> categorys=new ArrayList<Integer>();
        String sqlForCourses="select courseCode,name,credit,category from course where academyId="+academyId;

        jdbcTemplate.query(sqlForCourses, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {

                CourseViewModel courseViewModel=new CourseViewModel();
                courseViewModel.setCourseid(resultSet.getInt("courseCode"));
                courseViewModel.setCoursename(resultSet.getString("name"));
                courseViewModel.setCredit(resultSet.getDouble("credit"));
                courseViewModel.setCategory(getCategoryName(resultSet.getInt("category")));
                courseViewModels.add(courseViewModel);
            }
        });

        return courseViewModels;

    }


    /**
     * 获取属性表的名称
     * @param categoryId
     * @return
     */
    public String getCategoryName(int categoryId){

         return   jdbcTemplate.queryForObject("select name from category where id=?", new Object[]{categoryId}, new RowMapper<String>() {

            @Override
            public String mapRow(ResultSet resultSet, int i) throws SQLException {

                return resultSet.getString("codeNumber");

            }
        });

    }



}
