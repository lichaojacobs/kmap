package org.andy.kmap.model.dao;

import org.andy.kmap.model.entity.*;

public interface PropertyDao {

    /**
     * This method gets the property of a certain course.
     * @param course
     * @return
     */
    Property getProperty(Course course);
}
