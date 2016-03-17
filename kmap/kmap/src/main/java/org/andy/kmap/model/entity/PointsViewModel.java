package org.andy.kmap.model.entity;

import java.util.List;

/**
 * Created by lichao on 16/3/15.
 */
public class PointsViewModel {

    private List<Detail> pointForward;
    private List<Detail> pointBehind;

    public List<Detail> getPointForward() {
        return pointForward;
    }

    public void setPointForward(List<Detail> pointForward) {
        this.pointForward = pointForward;
    }

    public List<Detail> getPointBehind() {
        return pointBehind;
    }

    public void setPointBehind(List<Detail> pointBehind) {
        this.pointBehind = pointBehind;
    }
}
