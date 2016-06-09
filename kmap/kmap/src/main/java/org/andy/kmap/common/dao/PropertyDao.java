package org.andy.kmap.common.dao;

import org.andy.kmap.common.model.entity.*;

public interface PropertyDao {

    /**
     * This method gets the property of a certain course.
     * @param course
     * @return
     */
    Property getProperty(Course course);
}
