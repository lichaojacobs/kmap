package org.andy.kmap.common.model.entity.DropDownModel;

import java.util.List;

/**
 * Created by li on 2015/10/29.
 */
public class GradeDropDown {

    private String text;
    private String href;
    private List<String> tags;
    private List<CourseDropDown> nodes;
    public List<CourseDropDown> getNodes() {
        return nodes;
    }
    public void setNodes(List<CourseDropDown> nodes) {
        this.nodes = nodes;
    }
    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }
}
