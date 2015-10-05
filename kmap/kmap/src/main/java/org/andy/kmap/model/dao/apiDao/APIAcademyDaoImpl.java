package org.andy.kmap.model.dao.apiDao;

import org.andy.kmap.model.entity.Academy;
import org.andy.kmap.model.entity.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * Created by Mtime on 2015/9/19.
 */

@Repository("APIAcademyDaoImpl")
public class APIAcademyDaoImpl implements APIAcademyDao {


    @Autowired
    JdbcTemplate jdbcTemplate;


    public List<Academy> getAllAcademies(){

        String sql="select codeNumber,name FROM academy";

        final List<Academy> academies=new ArrayList<Academy>();

        jdbcTemplate.query(sql, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {

                Academy academy=new Academy();
                academy.setCollegeid(resultSet.getInt("codeNumber"));
                academy.setCollegename(resultSet.getString("name"));

                academies.add(academy);

            }
        });

        return academies;
    }


    /**
     * 添加
     * @param academy
     * @return
     */
    public CommonResult addAcademies(final Academy academy){

        //定义返回的结果
        CommonResult commonResult=new CommonResult();

        try {

            //拿到之后首先检查该记录是否重了
            String sql="select codeNumber,name FROM academy where codeNumber=? or name=?";
           List< Academy> result=  jdbcTemplate.query(sql, new Object[]{academy.getCollegeid(), academy.getCollegename()}, new RowMapper<Academy>() {
                @Override
                public Academy mapRow(ResultSet resultSet, int i) throws SQLException {
                    if(resultSet.next()) {
                        Academy academy1 = new Academy();
                        academy1.setCollegeid(resultSet.getInt("codeNumber"));
                        academy1.setCollegename(resultSet.getString("name"));
                        return academy1;
                    }else
                        return null;
                }
            });
            //说明添加了重复的元素
            if(result!=null&&result.size()>0)
            {
                commonResult.setStatus(-1);
                commonResult.setDetail("禁止重复添加！");

                return commonResult;

            }else
            {
                //插入数据
                jdbcTemplate.update("INSERT INTO academy(codeNumber,name) VALUES('"+academy.getCollegeid()+"','"+academy.getCollegename()+"')");

                commonResult.setStatus(1);
                commonResult.setDetail("添加成功");
                return commonResult;

            }

        }catch (Exception ex){

            commonResult.setDetail(ex.getMessage());
            commonResult.setStatus(-1);
            return commonResult;


        }





    }

}
