package org.andy.kmap.model.map;

import java.util.*;

import org.andy.kmap.model.entity.*;

public class DetailMap {

    private Course course;
    private Map<String, Detail> nodes;
    private Map<String, Map<String, Detail>> edges;


    public DetailMap(Course course) {

        this.course = course;
        this.nodes = new HashMap<>();
        this.edges = new HashMap<>();

        // Add course node as the root detail node.
        this.nodes.put(course.getName(), new Detail(course.getName()));
        this.edges.put(course.getName(), new HashMap<String, Detail>());
    }


    public void addNode(Detail detail) {

        if (!this.nodes.containsValue(detail)) {
            this.nodes.put(detail.getName(), detail);
        }
    }


    /**
     * This method is especially for adding course-detail edge.
     * @param target
     */
    public void addEdge(Detail target) {

        this.edges.get(this.course.getName()).put(target.getName(), target);
    }


    /**
     * This method is for adding detail-detail edge.
     * @param source
     * @param target
     */
    public void addEdge(Detail source, Detail target) {

        if (this.edges.containsKey(source.getName())) {
            this.edges.get(source.getName()).put(target.getName(), target);
        } else {
            this.edges.put(source.getName(), new HashMap<String, Detail>());
            this.edges.get(source.getName()).put(target.getName(), target);
        }
    }
}
