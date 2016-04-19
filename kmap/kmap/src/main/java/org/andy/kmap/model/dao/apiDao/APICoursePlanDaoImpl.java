package org.andy.kmap.model.dao.apiDao;

import com.google.gson.Gson;
import org.andy.kmap.model.entity.*;
import org.andy.kmap.model.entity.CoursePlanAddModels.CourseViewModel;
import org.andy.kmap.model.entity.CoursePlanSearchModel.CoursePlanSearchModel;
import org.andy.kmap.model.entity.DropDownModel.CourseDropDown;
import org.andy.kmap.model.entity.DropDownModel.DropDownViewModel;
import org.andy.kmap.model.entity.DropDownModel.GradeDropDown;
import org.andy.kmap.model.entity.DropDownModel.MajorDropDown;
import org.andy.kmap.model.map.CourseRelations;
import org.andy.kmap.model.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

/**
 * Created by li on 2015/10/30.
 */

@Repository("APICoursePlanDaoImpl")
public class APICoursePlanDaoImpl implements APICoursePlanDao {

    private static org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(APICoursePlanDaoImpl.class);
    @Autowired
    JdbcTemplate jdbcTemplate;


    final List<String> tags=new ArrayList<String>();

    /**
     * 下拉列表对象
     * @return
     */
    public List<DropDownViewModel> getDropDownModels(int type){
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
        logger.info("获取下拉列表,学院:"+new Gson().toJson(dropDownViewModels));
        //循环添加专业
        for (DropDownViewModel dropDownViewModel:dropDownViewModels){
            dropDownViewModel.setNodes(getMajorDropDown(dropDownViewModel.getId(),type));
        }
        return dropDownViewModels;
    }


    /**
     * 获取下拉列表中专业的信息
     * @return
     */
    public   List<MajorDropDown> getMajorDropDown(int academyId, final int type){

        final List<MajorDropDown> majorDropDowns=new ArrayList<>();
        final List<String> names=new ArrayList<>();
        String sqlForMajors="select id,year,name from major where academyId="+academyId;

        jdbcTemplate.query(sqlForMajors, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                if(names.size()==0||!names.contains(resultSet.getString("name"))) {
                    names.add(resultSet.getString("name"));
                    MajorDropDown majorDropDown = new MajorDropDown();
                    majorDropDown.setSelectable(false);
                    majorDropDown.setTags(tags);
                    majorDropDown.setHref("#child1");
                    majorDropDown.setText(resultSet.getString("name"));
                    majorDropDown.setId(resultSet.getInt("id"));
                    majorDropDowns.add(majorDropDown);
                }

            }
        });

        for (MajorDropDown majorDropDown:majorDropDowns){
            majorDropDown.setNodes(getGradeDropDown(majorDropDown.getText(),majorDropDown.getId(),type));
        }

        logger.info("获取下拉列表, 学院 "+academyId+"专业:"+new Gson().toJson(majorDropDowns));
        return majorDropDowns;
    }

    /**
     * 获取下拉列表中年级的信息
     * @return
     */
    public  List<GradeDropDown> getGradeDropDown(String name, final int majorId, final int type){

        final List<GradeDropDown> gradeDropDowns=new ArrayList<GradeDropDown>();

        String sqlForGrades="select year from major where name=?";

        jdbcTemplate.query(sqlForGrades,new Object[]{name},  new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {

                GradeDropDown gradeDropDown=new GradeDropDown();
                logger.info("获取下拉列表年级为"+resultSet.getInt(1));
                gradeDropDown.setText(String.valueOf(resultSet.getInt("year")));
                gradeDropDown.setHref("#grandchild1");
                gradeDropDown.setTags(tags);
                //添加知识点的下拉列表
                if(type==0) {
                    List<CourseDropDown> courseDropDowns = getCourseDropDown(majorId);
                    if (courseDropDowns != null)
                        gradeDropDown.setNodes(courseDropDowns);
                }
                gradeDropDowns.add(gradeDropDown);

            }
        });

        logger.info("获取下拉列表, 专业 "+majorId+"年级:"+new Gson().toJson(gradeDropDowns));
        return gradeDropDowns;


    }

    /**
     * 根据专业ID获取专业相关课程模型
     * @return
     */
    public List<CourseDropDown> getCourseDropDown(int majorId){
        try {
            final List<CourseDropDown> courseDropDowns=new ArrayList<CourseDropDown>();
            String sqlForCourses="select course from mc where major=?";
            List<Integer> courseIds= jdbcTemplate.query(sqlForCourses, new Object[]{majorId}, new RowMapper<Integer>() {
                @Override
                public Integer mapRow(ResultSet resultSet, int i) throws SQLException {
                    return resultSet.getInt("course");
                }
            });
            //根据courseIds获取课程详情
            String sqlForCourseDetails="select name from course where id=?";
            for (final Integer id:courseIds){
                jdbcTemplate.query(sqlForCourseDetails, new Object[]{id}, new RowCallbackHandler() {
                    @Override
                    public void processRow(ResultSet resultSet) throws SQLException {
                        CourseDropDown courseDropDown=new CourseDropDown();
                        courseDropDown.setHref(String.valueOf(id));
                        courseDropDown.setTags(tags);
                        courseDropDown.setText(resultSet.getString("name"));
                        courseDropDowns.add(courseDropDown);
                    }
                });
            }

            logger.info("获取下拉列表, 专业 "+majorId+"课程:"+new Gson().toJson(courseDropDowns));
            return courseDropDowns;
        }catch (Exception ex)
        {
            return null;
        }
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
        String sqlForCourses="select courseCode,name,credit,category from course where academyId=?";

        jdbcTemplate.query(sqlForCourses,new Object[]{academyId}, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {

                    CourseViewModel courseViewModel = new CourseViewModel();
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

                return resultSet.getString("name");

            }
        });

    }

    @Transactional
    public CommonResult AddCoursePlan(List<CourseRelations> courseRelationses, String academy, String major, String year){
        final CommonResult result=new CommonResult();
        int isRepeatedId=0;
        //加上学院的限制
        int academyId=0;
     try {
         //首先根据major和year查出majorid
         String sqlForMajorId="select id from major where year=? and name=?";
         int majorId= jdbcTemplate.queryForObject(sqlForMajorId, new Object[]{year, major}, new RowMapper<Integer>() {
             @Override
             public Integer mapRow(ResultSet resultSet, int i) throws SQLException {
                 return resultSet.getInt("id");
             }
         });
         //查出academyId
         String sqlForacademyId="select codeNumber from academy where name=?";
         academyId=jdbcTemplate.queryForObject(sqlForacademyId, new Object[]{academy}, new RowMapper<Integer>() {
             @Override
             public Integer mapRow(ResultSet resultSet, int i) throws SQLException {
                 return resultSet.getInt("codeNumber");
             }
         });
         //插入mc中作为专业添加的课程选课只需要取head就行了,避免重复插入
         String sqlForCourseId="select id,credit from course where name=? and academyId=?";
         final List<Course> courseIds=new ArrayList<>();
         for(final CourseRelations relation:courseRelationses){
             jdbcTemplate.query(sqlForCourseId, new Object[]{relation.head,academyId}, new RowCallbackHandler() {
                 @Override
                 public void processRow(ResultSet resultSet) throws SQLException {
                     Course course=new Course(resultSet.getInt("id"),relation.head);
                     course.setCredit(resultSet.getDouble("credit"));
                     courseIds.add(course);
                 }
             });
         }
         //循环插入数据mc表中
         String updateSqlForMC="insert into mc(major,course,credit) values(?,?,?)";
         String checkForMC="select * from mc where major=? and course=?";
         for (Course values:courseIds){
             if(isRepeatedId==0)
             {
                 isRepeatedId=values.getId();
             }
             if(isRepeatedId==values.getId())
             {
                 continue;
             }
             else
             {
                 isRepeatedId=values.getId();
             }
             List<Course> isRepeated=  jdbcTemplate.query(checkForMC, new Object[]{majorId,isRepeatedId}, new RowMapper<Course>() {
                 @Override
                 public Course mapRow(ResultSet resultSet, int i) throws SQLException {
                     if(resultSet.next()) {
                         Course course1 = new Course(1,resultSet.getObject("course").toString());
                         return course1;
                     }else
                         return null;
                 }
             });
             if(isRepeated!=null&&isRepeated.size()>0)
                continue;
             else {
                 //不重复再更新
                 jdbcTemplate.update(updateSqlForMC, new Object[]{majorId, isRepeatedId, values.getCredit()});
             }
         }
         //循环插入cc表中
         String updateSqlForCC="insert into cc(tail,head,majorId) values(?,?,?)";
         final List<Integer> courseIdsForHeads=new ArrayList<>();
         for (CourseRelations relation:courseRelationses){

             jdbcTemplate.query(sqlForCourseId, new Object[]{relation.tail}, new RowCallbackHandler() {
                 @Override
                 public void processRow(ResultSet resultSet) throws SQLException {
                     courseIdsForHeads.add(resultSet.getInt("id"));
                 }
             });
         }
         //插入cc(这个是一个关系网,双向关系)
         String checkForCC="select * from cc where tail=? and head=? and majorId=?";
         int i=0;
         for (Course head:courseIds)
         {
             List<Course> isRepeated=jdbcTemplate.query(checkForCC, new Object[]{courseIdsForHeads.get(i),head.getId(),majorId}, new RowMapper<Course>() {
                 @Override
                 public Course mapRow(ResultSet resultSet, int i) throws SQLException {
                     if(resultSet.next()) {
                         Course course1 = new Course(1,resultSet.getObject("tail").toString());
                         return course1;
                     }else
                         return null;
                 }
             });
             if(isRepeated!=null&&isRepeated.size()>0) {
                 i++;
                 continue;
             }
             else {
                 jdbcTemplate.update(updateSqlForCC, new Object[]{courseIdsForHeads.get(i), head.getId(),majorId});
                 i++;
             }

         }
         //返回结果
         result.setStatus(1);
         result.setDetail("添加计划成功");
         return  result;

     }catch (Exception ex)
     {

         result.setStatus(-1);
         result.setDetail(ex.getMessage());
         return result;

     }
    }
    /**
     * 获取搜索结果
     * @param college
     * @param major
     * @param year
     * @return
     */
    public List<CoursePlanSearchModel> getSearchResults(String college, String major, String year){
        //初始化结果集
        final List<CoursePlanSearchModel> coursePlanSearchModels=new ArrayList<>();
        try {

            //查出academyId
            String sqlForacademyId="select codeNumber from academy where name=?";
            int academyId=jdbcTemplate.queryForObject(sqlForacademyId, new Object[]{college}, new RowMapper<Integer>() {
                @Override
                public Integer mapRow(ResultSet resultSet, int i) throws SQLException {
                    return resultSet.getInt("codeNumber");
                }
            });
            //根据major,year得到majorId
            String sqlForMajorId="select id from major where year=? and name=?";
            int majorId=jdbcTemplate.queryForObject(sqlForMajorId, new Object[]{year, major}, new RowMapper<Integer>() {
                @Override
                public Integer mapRow(ResultSet resultSet, int i) throws SQLException {
                    return resultSet.getInt("id");
                }
            });
            //根据majorid获取courseid
            String sqlForCourseIDS="select course from mc where major=?";
            List<Integer> courseIDs=jdbcTemplate.query(sqlForCourseIDS, new Object[]{majorId}, new RowMapper<Integer>() {
                @Override
                public Integer mapRow(ResultSet resultSet, int i) throws SQLException {
                    return resultSet.getInt("course");
                }
            });
            //通过courseIDS获取课程以及相关课程并且添加入结果集
            String sqlForCourseDetail="SELECT id,credit,name from course where id=?";
            StringBuffer related=new StringBuffer();
            for (int courseId:courseIDs)
            {
                jdbcTemplate.query(sqlForCourseDetail, new Object[]{courseId}, new RowCallbackHandler() {
                    @Override
                    public void processRow(ResultSet resultSet) throws SQLException {
                        CoursePlanSearchModel coursePlanSearchModel=new CoursePlanSearchModel();
                        coursePlanSearchModel.setCourseid(resultSet.getInt("id"));
                        coursePlanSearchModel.setCoursename(resultSet.getString("name"));
                        coursePlanSearchModel.setCredit(resultSet.getDouble("credit"));
                        coursePlanSearchModels.add(coursePlanSearchModel);
                    }
                });
            }
            return coursePlanSearchModels;

        }catch (Exception ex)
        {
            ex.printStackTrace();
            return coursePlanSearchModels;
        }

    }

}
