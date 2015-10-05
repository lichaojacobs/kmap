package org.andy.kmap.model.map;

import java.util.*;

import org.andy.kmap.model.entity.*;

public class CourseMap {

    private Major major;
    private Map<String, Course> nodes;
    private Map<String, Map<String, Course>> edges;


    public CourseMap(Major major) {

        this.major = major;
        this.nodes = new HashMap<>();
        this.edges = new HashMap<>();
    }


    public void addNode(Course course) {

        if (!this.nodes.containsValue(course)) {
            this.nodes.put(course.getName(), course);
        }
    }


    public void addEdge(Course source, Course target) {

        if (this.edges.containsKey(source.getName())) {
            this.edges.get(source.getName()).put(target.getName(), target);
        } else {
            this.edges.put(source.getName(), new HashMap<String, Course>());
            this.edges.get(source.getName()).put(target.getName(), target);
        }
    }
}
