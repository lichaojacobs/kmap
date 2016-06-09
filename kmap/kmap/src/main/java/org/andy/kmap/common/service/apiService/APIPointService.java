package org.andy.kmap.common.service.apiService;

import com.google.gson.Gson;

import org.andy.kmap.common.dao.DetailDao;
import org.andy.kmap.common.dao.api.impl.APIPointDaoImpl;
import org.andy.kmap.common.model.entity.CommonResult;
import org.andy.kmap.common.model.entity.Detail;
import org.andy.kmap.common.model.entity.DropDownModel.PointDropDown;
import org.andy.kmap.common.model.entity.DropDownModel.PointFirstLevel;
import org.andy.kmap.common.model.entity.DropDownModel.PointFourthLevel;
import org.andy.kmap.common.model.entity.DropDownModel.PointSecondLevel;
import org.andy.kmap.common.model.entity.DropDownModel.PointThirdLevel;
import org.andy.kmap.common.model.entity.PointsViewModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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

  private List<String> tags = new ArrayList<String>();

  public List<Detail> getPointSelections(String course, String academy) {
    return apiPointDao.getPointSelections(course, academy);
  }

  private static org.apache.log4j.Logger logger = org.apache.log4j.Logger
      .getLogger(APIPointService.class);


  /**
   * 插入相关知识节点
   */
  public CommonResult addPoint(String course, String pointname, String pointdescription,
      String pointforward, String pointbehind, String academy) {
    return apiPointDao
        .addPoint(course, pointname, pointdescription, pointforward, pointbehind, academy);
  }

  /**
   * 根据level加载知识点
   */
  public PointsViewModel getPointSelectionsByLevel(String course, String academy, int level) {
    PointsViewModel pointsViewModel = new PointsViewModel();
    List<Detail> details = getPointSelections(course, academy);
    Map<Integer, List<Detail>> levelMap = new HashMap<>();
    for (int i = 0; i < details.size(); i++) {
      Detail detail = details.get(i);
      int detailLevel = GetDetailLevel(detail);
      List<Detail> tempList = levelMap.get(detailLevel);
      if (tempList == null) {
        tempList = new ArrayList<>();
        tempList.add(detail);
        levelMap.put(detailLevel, tempList);
      } else {
        tempList.add(detail);
      }
    }
    //根据level返回models
    if (level == 1) {
      pointsViewModel.setPointForward(null);
      pointsViewModel.setPointBehind(levelMap.get(1));
    } else if (level == 4) {
      pointsViewModel.setPointForward(levelMap.get(4));
      pointsViewModel.setPointBehind(null);
    } else {
      pointsViewModel.setPointBehind(levelMap.get(level));
      pointsViewModel.setPointForward(levelMap.get(level - 1));
    }
    return pointsViewModel;

  }

  /**
   * 加载已经添加的知识点关系下拉表
   */
  public List<PointDropDown> getPointDropDown(String course, String academy) {
    List<PointDropDown> pointDropDowns=new ArrayList<>();
    PointDropDown pointDropDown=new PointDropDown();
    pointDropDown.setText(course);
    pointDropDown.setTags(tags);
    List<Detail> courseDetails = apiPointDao.getPointSelections(course, academy);
    logger.info("getPointDropDown 从数据库中获取数据为:"+new Gson().toJson(courseDetails));
    List<PointFirstLevel> pointFirstLevels = new ArrayList<>();
    List<Detail> firstLevelDeails = new ArrayList<>();

    try {

      for (Detail detail : courseDetails) {
        int level = GetDetailLevel(detail);
        if (level == 1) {
          firstLevelDeails.add(detail);
        }
      }
      logger.info("知识点第一层数据为: "+new Gson().toJson(firstLevelDeails));
      for (Detail detail : firstLevelDeails) {
        PointFirstLevel pointFirstLevel = new PointFirstLevel();
        List<Detail> secondLevelDetails = new ArrayList<>();
        pointFirstLevel.setText(detail.getName());
        pointFirstLevel.setTags(tags);
        List<PointSecondLevel> pointSecondLevels = buildPointScondLevels(detail,
            secondLevelDetails);
        if (pointSecondLevels.size() == 0) {
          pointFirstLevels.add(pointFirstLevel);
          continue;
        }
        else
        {
          pointFirstLevel.setNodes(pointSecondLevels);
          //第三层
          for (int i = 0; i < secondLevelDetails.size(); i++) {
            List<Detail> thirdLevelDetails = new ArrayList<>();
            List<PointThirdLevel> pointThirdLevels = buildPointThirdLevels(
                secondLevelDetails.get(i), thirdLevelDetails);
            if (pointThirdLevels.size() == 0) {
              continue;
            } else {
              pointSecondLevels.get(i).setNodes(pointThirdLevels);
              //第四层
              for (int j = 0; j < thirdLevelDetails.size(); j++) {
                List<Detail> fourthLevelDetails = new ArrayList<>();
                List<PointFourthLevel> pointFourthLevels = buildPointFourthLevels(
                    thirdLevelDetails.get(i), fourthLevelDetails);
                if (pointFourthLevels.size() == 0) {
                  continue;
                } else {
                  pointThirdLevels.get(j).setNodes(pointFourthLevels);
                }
              }
            }

          }
        }
        pointFirstLevels.add(pointFirstLevel);
      }

    } catch (Exception ex) {
      logger.error("getPointDropDown error :" + ex.getMessage() + ex.getStackTrace());
    }

    logger.info("知识点下拉列表返回值为:" + new Gson().toJson(pointFirstLevels));
    pointDropDown.setNodes(pointFirstLevels);
    pointDropDowns.add(pointDropDown);
    return pointDropDowns;
  }

  public List<PointSecondLevel> buildPointScondLevels(Detail detail,
      List<Detail> secondLevelDetails) {
    List<PointSecondLevel> pointSecondLevels = new ArrayList<>();
    if (detailDao.getHeads(detail).size() == 0) {
      return pointSecondLevels;
    }
    List<Detail> heads = detailDao.getHeads(detail);
    for (Detail head : heads) {
      PointSecondLevel pointSecondLevel = new PointSecondLevel();
      pointSecondLevel.setText(head.getName());
      pointSecondLevel.setTags(tags);
      pointSecondLevels.add(pointSecondLevel);
      secondLevelDetails.add(head);
    }
    return pointSecondLevels;
  }

  public List<PointThirdLevel> buildPointThirdLevels(Detail detail,
      List<Detail> thirdLevelDetails) {
    List<PointThirdLevel> pointThirdLevels = new ArrayList<>();
    if (detailDao.getHeads(detail).size() == 0) {
      return pointThirdLevels;
    }
    List<Detail> heads = detailDao.getHeads(detail);
    for (Detail head : heads) {
      PointThirdLevel pointThirdLevel = new PointThirdLevel();
      pointThirdLevel.setText(head.getName());
      pointThirdLevel.setTags(tags);
      pointThirdLevels.add(pointThirdLevel);
      thirdLevelDetails.add(head);
    }
    return pointThirdLevels;
  }

  public List<PointFourthLevel> buildPointFourthLevels(Detail detail,
      List<Detail> fourthLevelDetails) {
    List<PointFourthLevel> pointFourthLevels = new ArrayList<>();
    if (detailDao.getHeads(detail).size() == 0) {
      return pointFourthLevels;
    }
    List<Detail> heads = detailDao.getHeads(detail);
    for (Detail head : heads) {
      PointFourthLevel pointFourthLevel = new PointFourthLevel();
      pointFourthLevel.setText(head.getName());
      pointFourthLevel.setTags(tags);
      pointFourthLevels.add(pointFourthLevel);
      fourthLevelDetails.add(head);
    }
    return pointFourthLevels;
  }


  public int GetDetailLevel(Detail detail) {
    if (detailDao.getTails(detail).size() == 0) {
      return 1;
    }
    return GetDetailLevel(detailDao.getTails(detail).get(0)) + 1;
  }

}
