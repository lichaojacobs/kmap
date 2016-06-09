package org.andy.kmap.common.dao;

import java.util.List;

import org.andy.kmap.common.model.entity.Major;

public interface MajorDao {

    /**
     * This method adds a major object into the database.
     * @param major
     */
    void addMajor(Major major);


    /**
     * This method gets a list of major objects in the system.
     * @return A list of major objects in the system.
     */
    List<Major> getMajor();

    Major getMajorByUserId(String email);
}
