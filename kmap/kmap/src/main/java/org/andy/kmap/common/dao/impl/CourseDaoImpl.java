package org.andy.kmap.common.dao.impl;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

import com.google.gson.Gson;

import org.andy.kmap.common.dao.ConnectionCloser;
import org.andy.kmap.common.dao.CourseDao;
import org.andy.kmap.common.model.entity.*;
import org.andy.kmap.tools.SqlUtils;
import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("CourseDaoImpl")
public class CourseDaoImpl implements CourseDao {

    private static Logger logger = Logger.getLogger(CourseDaoImpl.class);

    @Autowired
    @Qualifier("dataSource")
    private BasicDataSource dataSource;

    /**
     * This method gets a list of courses belonging to a certain major.
     * @param major
     * @return a list of courses belonging to a certain major.
     */
    public List<Course> getCourses(Major major) {

        Connection connection = null;
        PreparedStatement statement = null;
        SQLException exception = null;

        List<Course> courses = new ArrayList<>();

        try {
            connection = this.dataSource.getConnection();
            statement = connection.prepareStatement("SELECT course.id, course.name, mc.credit FROM course, mc WHERE mc.major = ? AND mc.course = course.id");
            statement.setInt(1, major.getId());

            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Course course = new Course(result.getString(2));
                course.setId(result.getInt(1));
                course.setCredit(result.getInt(3));
                courses.add(course);
            }
        } catch (SQLException ex) {
            exception = ex;
        } finally {
            ConnectionCloser.close(connection, statement, exception);
        }

        return courses;
    }

    @Override
    public List<Course> getCourses(Major major, int courseId) {
        Connection connection = null;
        PreparedStatement statement = null;
        SQLException exception = null;
        List<Course> courses = new ArrayList<>();
        List<Integer> courseIds=new ArrayList<>();
        StringBuffer buffer=new StringBuffer();

        try {
            connection = this.dataSource.getConnection();
            statement = connection.prepareStatement("SELECT head,tail FROM cc WHERE head=? or tail=?");
            statement.setInt(1, courseId);
            statement.setInt(2,courseId);
            ResultSet result = statement.executeQuery();
            courseIds.add(courseId);
            while (result.next()) {
               if(result.getInt("head")==courseId){
                   courseIds.add(result.getInt("tail"));
               }else{
                   courseIds.add(result.getInt("head"));
               }
            }

            SqlUtils.setCourseIds(courseIds);
            //生成statement
            statement= SqlUtils.generateInSqlStr(connection,statement,major);

            result=statement.executeQuery();
            while (result.next()) {
                Course course = new Course(result.getString(2));
                course.setId(result.getInt(1));
                course.setCredit(result.getInt(3));
                courses.add(course);
            }
            logger.info("获取到Courses{}: "+new Gson().toJson(courses));

        } catch (SQLException ex) {
            logger.error("getCourses error ex is",ex);
        } finally {
            ConnectionCloser.close(connection, statement, exception);
        }

        return courses;
    }

    public static String preparePlaceHolders(int length) {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < length;) {
            builder.append("?");
            if (++i < length) {
                builder.append(",");
            }
        }
        return builder.toString();
    }
    public static void setValues(PreparedStatement preparedStatement, Object... values) throws SQLException {
        for (int i = 0; i < values.length; i++) {
            preparedStatement.setObject(i + 1, values[i]);
        }
    }

    /**
     * This method gets a list of successors of a certain course.
     * @param major
     * @param
     * @returnds
     */
    public List<Course> getHeads(Major major, Course tail) {

        List<Course> heads = new ArrayList<>();
        List<Course> courses = getCourses(major);

        Connection connection = null;
        PreparedStatement statement = null;
        SQLException exception = null;
        try {
            connection = this.dataSource.getConnection();

            statement = connection.prepareStatement("SELECT cc.head FROM cc WHERE cc.tail = ?");
            statement.setInt(1, tail.getId());
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Course head = new Course(result.getInt(1));
                heads.add(courses.get(courses.indexOf(head)));
            }
        } catch (SQLException ex) {
            exception = ex;
        } finally {
            ConnectionCloser.close(connection, statement, exception);
        }

        return heads;
    }


    public List<Course> getTails(Major major, Course head) {

        List<Course> tails = new ArrayList<>();
        List<Course> courses = getCourses(major);

        Connection connection = null;
        PreparedStatement statement = null;
        SQLException exception = null;

        try {
            connection = this.dataSource.getConnection();
            statement = connection.prepareStatement("SELECT cc.tail FROM cc WHERE cc.head = ?");
            statement.setInt(1, head.getId());
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Course tail = new Course(result.getInt(1));
                tails.add(courses.get(courses.indexOf(tail)));
            }
        } catch (SQLException ex) {
            exception = ex;
        } finally {
            ConnectionCloser.close(connection, statement, exception);
        }
        return tails;
    }

    public List<Course> getHeads(Major major, Course tail,List<Integer> courseIds){
        List<Course> heads = new ArrayList<>();
        List<Course> courses = getCourses(major);

        Connection connection = null;
        PreparedStatement statement = null;
        SQLException exception = null;
        try {
            connection = this.dataSource.getConnection();

            statement = connection.prepareStatement("SELECT cc.head FROM cc WHERE cc.tail = ? AND cc.head IN (" + SqlUtils.generateIdStrs() +")");
            statement.setInt(1, tail.getId());
            for (int i = 0; i < courseIds.size(); i++)
            {
                statement.setInt(i + 2, courseIds.get(i));
            }

            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Course head = new Course(result.getInt(1));
                heads.add(courses.get(courses.indexOf(head)));
            }
        } catch (SQLException ex) {
            exception = ex;
        } finally {
            ConnectionCloser.close(connection, statement, exception);
        }

        return heads;
    }

    public List<Course> getTails(Major major,Course head,List<Integer> courseIds){
        List<Course> tails = new ArrayList<>();
        List<Course> courses = getCourses(major);

        Connection connection = null;
        PreparedStatement statement = null;
        SQLException exception = null;

        try {
            connection = this.dataSource.getConnection();
            statement = connection.prepareStatement("SELECT cc.tail FROM cc WHERE cc.head = ? AND cc.tail IN (" + SqlUtils.generateIdStrs() +")");
            statement.setInt(1, head.getId());
            for (int i = 0; i < courseIds.size(); i++)
            {
                statement.setInt(i + 2, courseIds.get(i));
            }
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Course tail = new Course(result.getInt(1));
                tails.add(courses.get(courses.indexOf(tail)));
            }
        } catch (SQLException ex) {
            exception = ex;
        } finally {
            ConnectionCloser.close(connection, statement, exception);
        }
        return tails;
    }

    @Override
    public Course getCourseById(int id) {
        Course course=null;
        Connection connection=null;
        PreparedStatement statement=null;
        SQLException exception = null;
        try {
            connection = this.dataSource.getConnection();
            statement = connection.prepareStatement("SELECT * FROM course WHERE id = ?");
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                course=new Course(result.getInt("id"),result.getString("name"));
            }
        } catch (SQLException ex) {
            exception = ex;
        } finally {
            ConnectionCloser.close(connection, statement, exception);
        }

        return course;
    }

    public Course getCourse(String courseName,String academy)
    {
        Course course=null;
        Connection connection = null;
        PreparedStatement statement = null;
        SQLException exception = null;
        int academyId=0;
        try {
            connection = this.dataSource.getConnection();

            statement = connection.prepareStatement("SELECT codeNumber FROM academy WHERE name = ?");
            statement.setString(1,academy);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                academyId=result.getInt("codeNumber");
            }
            statement=connection.prepareStatement("SELECT * FROM course WHERE name=? and academyId=?");
            statement.setString(1,courseName);
            statement.setInt(2,academyId);
            result=statement.executeQuery();
            if (result.next()) {
                course=new Course(result.getInt("id"),result.getString("name"));
            }

        } catch (SQLException ex) {
            exception = ex;
        } finally {
            ConnectionCloser.close(connection, statement, exception);
        }
        return course;
    }

    public Course setMark(User user, Course course) {

        Connection connection = null;
        PreparedStatement statement = null;
        SQLException exception = null;

        try {
            connection = this.dataSource.getConnection();
            statement = connection.prepareStatement("SELECT mark FROM uc WHERE user = ? AND course = ?");
            statement.setLong(1, user.getId());
            statement.setInt(2, course.getId());

            ResultSet result = statement.executeQuery();

            if (result.next()) {
                course.setMark(result.getDouble(1));
            }
        } catch (SQLException ex) {
            logger.error("setmark error ex is",ex);
        } finally {
            ConnectionCloser.close(connection, statement, exception);
        }

        return course;
    }
}
