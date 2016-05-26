package org.andy.kmap.model.dao.apiDao;

import org.andy.kmap.model.entity.CommonResult;
import org.andy.kmap.model.entity.Course;
import org.andy.kmap.model.entity.Detail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by lichao on 15/12/15.
 */
@Repository("APIPointDaoImpl")
public class APIPointDaoImpl implements APIPointDao {
  @Autowired
  JdbcTemplate jdbcTemplate;

  @Override
  public List<Detail> getPointSelections(String course, String academy) {
    try {
      //查出academyId
      String sqlForacademyId = "select codeNumber from academy where name=?";
      int academyId = jdbcTemplate
          .queryForObject(sqlForacademyId, new Object[]{academy}, new RowMapper<Integer>() {
            @Override
            public Integer mapRow(ResultSet resultSet, int i) throws SQLException {
              return resultSet.getInt("codeNumber");
            }
          });
      //查出courseId
      String sqlForCourseId = "select id from course where name=? and academyId=?";
      int courseId = jdbcTemplate.queryForObject(sqlForCourseId, new Object[]{course, academyId},
          new RowMapper<Integer>() {
            @Override
            public Integer mapRow(ResultSet resultSet, int i) throws SQLException {
              return resultSet.getInt("id");
            }
          });
      String sqlForDetail = "SELECT detail.id, detail.name FROM detail WHERE detail.course = ?";
      List<Detail> details = jdbcTemplate
          .query(sqlForDetail, new Object[]{courseId}, new RowMapper<Detail>() {
            @Override
            public Detail mapRow(ResultSet resultSet, int i) throws SQLException {
              Detail detail = new Detail(resultSet.getInt(1), resultSet.getString(2));
              return detail;
            }
          });
      return details;

    } catch (Exception ex) {
      ex.printStackTrace();
      return null;
    }
  }

  public CommonResult addPoint(String course, String pointname, String pointdescription,
      String pointforward, String pointbehind, String academy) {
    CommonResult commonResult = new CommonResult();
    //添加入detail表中
    try {
      //查出academyId
      String sqlForacademyId = "select codeNumber from academy where name=?";
      int academyId = jdbcTemplate
          .queryForObject(sqlForacademyId, new Object[]{academy}, new RowMapper<Integer>() {
            @Override
            public Integer mapRow(ResultSet resultSet, int i) throws SQLException {
              return resultSet.getInt("codeNumber");
            }
          });
      //查出courseId
      String sqlForCourseId = "select id from course where name=? and academyId=?";
      int courseId = jdbcTemplate.queryForObject(sqlForCourseId, new Object[]{course, academyId},
          new RowMapper<Integer>() {
            @Override
            public Integer mapRow(ResultSet resultSet, int i) throws SQLException {
              return resultSet.getInt("id");
            }
          });
      //判断是否是重复添加
      String sqlForRepeated = "select * from detail where name=? and course=?";
      List<Detail> details = jdbcTemplate
          .query(sqlForRepeated, new Object[]{pointname, courseId}, new RowMapper<Detail>() {
            @Override
            public Detail mapRow(ResultSet resultSet, int i) throws SQLException {
              if (resultSet.next()) {
                Detail detail = new Detail(resultSet.getInt("id"), resultSet.getString("name"));
                return detail;
              } else {
                return null;
              }
            }
          });
      if (details.size() != 0) {
        commonResult.setStatus(-1);
        commonResult.setDetail("禁止添加课程相同知识点");
        return commonResult;
      }
      //根据课程ID插入detail表中
      String sqlForDetail = "insert into detail(name,info,course) values(?,?,?)";
      jdbcTemplate.update(sqlForDetail, new Object[]{pointname, pointdescription, courseId});

      //如果前序后序节点不为空,则插入dd中
      if (pointforward.equals("0") && pointbehind.equals("0")) {
        commonResult.setDetail("知识点添加成功");
        commonResult.setStatus(1);
        return commonResult;
      } else {
        //查询出detailid
        String sqlForDetailId = "select id from detail where name=? and course=?";
        int detailId = jdbcTemplate
            .queryForObject(sqlForDetailId, new Object[]{pointname, courseId},
                new RowMapper<Integer>() {
                  @Override
                  public Integer mapRow(ResultSet resultSet, int i) throws SQLException {
                    return resultSet.getInt("id");
                  }
                });
        if (pointforward.equals("0")) {
          int tail = Integer.valueOf(pointbehind);
          String sqlForDD = "insert into dd(tail,head) values(?,?)";
          jdbcTemplate.update(sqlForDD, new Object[]{detailId, tail});
        }
        if (pointbehind.equals("0")) {
          int head = Integer.valueOf(pointforward);
          String sqlForDD = "insert into dd(tail,head) values(?,?)";
          jdbcTemplate.update(sqlForDD, new Object[]{head, detailId});
        }
        if (!pointbehind.equals("0") && !pointforward.equals("0")) {

          int tail = Integer.valueOf(pointbehind);
          int head = Integer.valueOf(pointforward);
          String sqlForDD = "insert into dd(tail,head) values(?,?)";
          String deleteForDD = "delete from dd where tail=? and head=?";
          jdbcTemplate.update(deleteForDD, new Object[]{head, tail});
          jdbcTemplate.update(sqlForDD, new Object[]{detailId, tail});
          jdbcTemplate.update(sqlForDD, new Object[]{head, detailId});
        }
        //返回插入结果
        commonResult.setDetail("知识点添加成功");
        commonResult.setStatus(1);
        return commonResult;
      }

    } catch (Exception ex) {
      commonResult.setStatus(-1);
      commonResult.setDetail(ex.getMessage());
      return commonResult;
    }

  }

  @Override
  public List<Detail> getPointSelectionsByLevel(String course, int level) {
    return null;
  }

}
