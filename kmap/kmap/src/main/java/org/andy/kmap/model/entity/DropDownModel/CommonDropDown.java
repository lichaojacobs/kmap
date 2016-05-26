package org.andy.kmap.model.entity.DropDownModel;

import java.util.List;

/**
 * Created by li on 2015/10/29.
 */
public class CommonDropDown {

    private int id;
    private String text;
    private String href;
    private List<String> tags;
    private boolean selectable;
    private List<MajorDropDown> nodes;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public boolean isSelectable() {
        return selectable;
    }

    public void setSelectable(boolean selectable) {
        this.selectable = selectable;
    }

    public List<MajorDropDown> getNodes() {
        return nodes;
    }

    public void setNodes(List<MajorDropDown> nodes) {
        this.nodes = nodes;
    }
}
