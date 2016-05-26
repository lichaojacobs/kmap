package org.andy.kmap.model.entity.DropDownModel;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lichao on 16/5/26.
 */
public class PointThirdLevel extends CommonPoint {
  private List<PointFourthLevel> nodes;

  public PointThirdLevel() {
    nodes = new ArrayList<>();
  }

  public List<PointFourthLevel> getNodes() {
    return nodes;
  }

  public void setNodes(List<PointFourthLevel> nodes) {
    this.nodes = nodes;
  }
}
