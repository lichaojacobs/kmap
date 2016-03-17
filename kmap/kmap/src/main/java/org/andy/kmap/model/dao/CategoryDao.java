package org.andy.kmap.model.dao;

import org.andy.kmap.model.entity.*;



public interface CategoryDao {

    /**
     * This method get the category of a certain course.
     * @param course
     * @return
     */
    Category getCategory(Course course);
}
