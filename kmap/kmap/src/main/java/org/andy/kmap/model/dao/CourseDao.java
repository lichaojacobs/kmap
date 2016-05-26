package org.andy.kmap.model.dao;

import java.util.List;

import org.andy.kmap.model.entity.*;

public interface CourseDao {

    /**
     * This method gets a list of courses belonging to a centain major.
     * @param major
     * @return a list of courses belonging to a certain major.
     */
    List<Course> getCourses(Major major);

    /**
     * 获取局部加载课程
     * @param major
     * @param courseId
     * @return
     */
    List<Course> getCourses(Major major,int courseId);
    /**
     * This method gets a list of successors of a certain course.
     * @param major
     * @param course
     * @return
     */
    List<Course> getHeads(Major major, Course course);


    /**
     * This method gets a list of predecessors of a certain course.
     * @param major
     * @param course
     * @return
     */
    List<Course> getTails(Major major, Course course);


    /**
     * This method sets the user's mark of a specific course.
     * @param user
     * @return The course with the mark property.
     */
    Course setMark(User user, Course course);

    Course getCourseById(int id);

    Course getCourse(String courseName,String academy);

    List<Course> getTails(Major major,Course head,List<Integer> courseIds);

    List<Course> getHeads(Major major, Course tail,List<Integer> courseIds);

}
