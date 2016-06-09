package org.andy.kmap.common.model.entity.DropDownModel;

import java.util.List;

/**
 * Created by lichao on 16/5/26.
 */
public class CommonPoint {
  private String text;
  private String href;
  private List<String> tags;

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
