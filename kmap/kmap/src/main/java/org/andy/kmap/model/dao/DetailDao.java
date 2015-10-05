package org.andy.kmap.model.dao;

import java.util.List;

import org.andy.kmap.model.entity.*;

public interface DetailDao {

    /**
     * This method gets a list of details belonging to a certain course.
     * @param course
     * @return a list of courses belonging to a certain major.
     */
    List<Detail> getDetails(Course course);


    /**
     * This method gets a list of successors of a certain detail.
     * @param tail
     * @return
     */
    List<Detail> getHeads(Detail tail);


    /**
     * This method gets a list of predecessors of a certain detail.
     * @param head
     * @return
     */
    List<Detail> getTails(Detail head);
}
