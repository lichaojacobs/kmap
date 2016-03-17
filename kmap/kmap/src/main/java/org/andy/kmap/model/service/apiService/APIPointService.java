package org.andy.kmap.model.service.apiService;

import org.andy.kmap.model.dao.DetailDao;
import org.andy.kmap.model.dao.apiDao.APICourseDao;
import org.andy.kmap.model.dao.apiDao.APIPointDaoImpl;
import org.andy.kmap.model.entity.CommonResult;
import org.andy.kmap.model.entity.Detail;
import org.andy.kmap.model.entity.PointsViewModel;
import org.andy.kmap.model.service.CourseService;
import org.andy.kmap.model.service.DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.w3c.dom.ls.LSException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lichao on 15/12/15.
 */
@Service("APIPointService")
public class APIPointService {

    @Autowired
    @Qualifier("APIPointDaoImpl")
    private APIPointDaoImpl apiPointDao;

    @Autowired
    @Qualifier("DetailDaoImpl")
    private DetailDao detailDao;

    public List<Detail> getPointSelections(String course,String academy){
       return apiPointDao.getPointSelections(course,academy);
    }

    /**
     * 插入相关知识节点
     * @param course
     * @param pointname
     * @param pointdescription
     * @param pointforward
     * @param pointbehind
     * @return
     */
    public CommonResult addPoint(String course, String pointname, String pointdescription, String pointforward, String pointbehind,String academy){
       return apiPointDao.addPoint(course,pointname,pointdescription,pointforward,pointbehind,academy);
    }

    /**
     * 根据level加载知识点
     * @param course
     * @param level
     * @return
     */
    public PointsViewModel getPointSelectionsByLevel(String course, String academy , int level)
    {
        PointsViewModel pointsViewModel=new PointsViewModel();
        List<Detail> details =getPointSelections(course,academy);
        Map<Integer,List<Detail>> levelMap=new HashMap<>();
        for (int i = 0; i < details.size(); i++) {
            Detail detail = details.get(i);
            int detailLevel=GetDetailLevel(detail);
            List<Detail> tempList= levelMap.get(detailLevel);
            if(tempList==null)
            {
                tempList=new ArrayList<>();
                tempList.add(detail);
                levelMap.put(detailLevel,tempList);
            }
            else
            {
                tempList.add(detail);
            }
        }
        //根据level返回models
        if(level==1)
        {
            pointsViewModel.setPointForward(null);
            pointsViewModel.setPointBehind(levelMap.get(1));
        }
        else if(level==4)
            {
            pointsViewModel.setPointForward(levelMap.get(4));
            pointsViewModel.setPointBehind(null);
              }
            else
            {
                pointsViewModel.setPointBehind(levelMap.get(level));
                pointsViewModel.setPointForward(levelMap.get(level-1));
            }
        return pointsViewModel;

    }

    public int GetDetailLevel(Detail detail)
    {
        if(detailDao.getTails(detail).size()==0)
            return 1;
        return GetDetailLevel(detailDao.getTails(detail).get(0))+1;
    }

}
