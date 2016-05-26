package org.andy.kmap.model.entity.DropDownModel;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lichao on 16/5/26.
 */
public class PointSecondLevel extends CommonPoint {
  private List<PointThirdLevel> nodes;

  public PointSecondLevel(){
    nodes=new ArrayList<>();
  }

  public List<PointThirdLevel> getNodes() {
    return nodes;
  }

  public void setNodes(List<PointThirdLevel> nodes) {
    this.nodes = nodes;
  }
}
