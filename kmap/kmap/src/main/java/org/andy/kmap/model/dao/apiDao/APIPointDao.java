package org.andy.kmap.model.dao.apiDao;

import org.andy.kmap.model.entity.CommonResult;
import org.andy.kmap.model.entity.Detail;

import java.util.List;

/**
 * Created by lichao on 15/12/15.
 */

public interface APIPointDao {

    public List<Detail> getPointSelections(String course,String academy);
    public CommonResult addPoint(String course,String pointname,String pointdescription,String pointforward,String pointbehind,String academy);
    public List<Detail> getPointSelectionsByLevel(String course,int level);
}
