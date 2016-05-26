package org.andy.kmap.model.entity.DropDownModel;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lichao on 16/5/27.
 */
public class PointDropDown extends CommonPoint {
  public List<PointFirstLevel> nodes;

  public PointDropDown(){
    nodes=new ArrayList<>();
  }

  public List<PointFirstLevel> getNodes() {
    return nodes;
  }

  public void setNodes(List<PointFirstLevel> nodes) {
    this.nodes = nodes;
  }
}
