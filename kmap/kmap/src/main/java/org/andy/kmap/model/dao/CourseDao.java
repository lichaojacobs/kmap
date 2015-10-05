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
}
