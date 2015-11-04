package org.andy.kmap.model.dao;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import javax.sql.DataSource;

import org.andy.kmap.model.entity.*;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("CourseDaoImpl")
public class CourseDaoImpl implements CourseDao {

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


    /**
     * This method gets a list of successors of a certain course.
     * @param major
     * @param course
     * @return
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
            exception = ex;
        } finally {
            ConnectionCloser.close(connection, statement, exception);
        }

        return course;
    }
}
