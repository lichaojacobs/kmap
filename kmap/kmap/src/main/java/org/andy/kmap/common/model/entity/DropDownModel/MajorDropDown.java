package org.andy.kmap.common.model.entity.DropDownModel;

import java.util.List;

/**
 * Created by li on 2015/10/29.
 */
public class MajorDropDown {

    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private String text;
    private String href;
    private List<String> tags;
    private boolean selectable;

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

    public boolean isSelectable() {
        return selectable;
    }

    public void setSelectable(boolean selectable) {
        this.selectable = selectable;
    }

    public List<GradeDropDown> getNodes() {
        return nodes;
    }

    public void setNodes(List<GradeDropDown> nodes) {
        this.nodes = nodes;
    }

    private List<GradeDropDown> nodes;



}
