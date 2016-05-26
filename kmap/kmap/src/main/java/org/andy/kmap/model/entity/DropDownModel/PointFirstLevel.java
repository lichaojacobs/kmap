package org.andy.kmap.model.entity.DropDownModel;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lichao on 16/5/26.
 */
public class PointFirstLevel extends CommonPoint {
  private List<PointSecondLevel> nodes;

  public PointFirstLevel(){
    nodes=new ArrayList<>();
  }

  public List<PointSecondLevel> getNodes() {
    return nodes;
  }

  public void setNodes(List<PointSecondLevel> nodes) {
    this.nodes = nodes;
  }
}
