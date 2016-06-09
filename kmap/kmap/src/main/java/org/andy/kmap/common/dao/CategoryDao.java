package org.andy.kmap.common.dao;

import org.andy.kmap.common.model.entity.*;



public interface CategoryDao {

    /**
     * This method get the category of a certain course.
     * @param course
     * @return
     */
    Category getCategory(Course course);
}
