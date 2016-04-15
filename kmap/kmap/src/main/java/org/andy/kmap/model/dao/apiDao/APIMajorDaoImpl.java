package org.andy.kmap.model.dao.apiDao;

import org.andy.kmap.model.entity.Academy;
import org.andy.kmap.model.entity.AddMajorViewModel;
import org.andy.kmap.model.entity.CommonResult;
import org.andy.kmap.model.entity.Major;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by li on 2015/10/13.
 */
@Repository("APIMajorDaoImpl")
public class APIMajorDaoImpl implements APIMajorDao {

    private static Logger logger = Logger.getLogger(APIMajorDao.class);

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public List<AddMajorViewModel> GetMajorsPerGrade() {

        List<AddMajorViewModel> addMajorViewModels=new ArrayList<AddMajorViewModel>();
        try {

            String sql="SELECT * FROM academy ";
            addMajorViewModels=  jdbcTemplate.query(sql, new RowMapper<AddMajorViewModel>() {
                @Override
                public AddMajorViewModel mapRow(ResultSet resultSet, int i) throws SQLException {

                    AddMajorViewModel addMajorViewModel = new AddMajorViewModel();
                    addMajorViewModel.setId(resultSet.getInt("codeNumber"));
                    addMajorViewModel.setAcademyName(resultSet.getString("name"));
                    return addMajorViewModel;
                }

            });

            //获取majors
            List<List<Major>> majors=new ArrayList<List<Major>>(addMajorViewModels.size());
            System.out.println(addMajorViewModels.size());
            int index=0;
            for(AddMajorViewModel addMajorViewModel:addMajorViewModels){

                String sqlForMajors="select id,year,name from major where academyId="+addMajorViewModel.getId();
                majors.add(index, jdbcTemplate.query(sqlForMajors, new RowMapper() {
                    @Override
                    public Major mapRow(ResultSet resultSet, int i) throws SQLException {
                            Major major = new Major(resultSet.getInt("id"), resultSet.getString("name"));
                            major.setYear(resultSet.getInt("year"));
                            return major;
                    }
                }));
                addMajorViewModel.setMajors(majors.get(index));
                index++;
            }
            return addMajorViewModels;

        }catch (Exception ex){

            ex.printStackTrace();


        }

        return null;



    }

    public CommonResult addMajor(final Major major){
        //定义返回的结果
        CommonResult commonResult=new CommonResult();
        try {

            //拿到之后首先检查该记录是否重了
            String sqlCheck="select year,name FROM major where year=? AND name=?";
            final List< Major> result=  jdbcTemplate.query(sqlCheck, new Object[]{major.getYear(), major.getName()}, new RowMapper<Major>() {
                @Override
                public Major mapRow(ResultSet resultSet, int i) throws SQLException {
                    if(resultSet.next())
                    {
                        Major temp=new Major(0,resultSet.getString("name"));
                        temp.setAcademyId(resultSet.getInt("academyId"));
                        temp.setYear(resultSet.getInt("year"));
                        return temp;
                    }
                    else
                        return null;

                }
            });
            //是否添加了重复的元素
            if(result!=null&&result.size()>0) {
                commonResult.setStatus(-1);
                commonResult.setDetail("禁止重复添加！");

                return commonResult;
            }else
            {
            String sql="insert into major(year,name,info,academyId) values(?,?,?,?)";
            jdbcTemplate.update(sql,new Object[]{major.getYear(),major.getName(),major.getInfo(),major.getAcademyId()});
            commonResult.setStatus(1);
            commonResult.setDetail("专业添加成功！");
            return commonResult;
            }

        }catch (Exception ex){

            commonResult.setDetail("Error!"+ex.getMessage());
            commonResult.setStatus(-1);
            return commonResult;

        }


    }

    /**
     * 修改专业信息
     * @param
     * @return
     */
    public CommonResult editMajor(Major updateMajor,Major pastMajor){

        //定义返回的结果
        CommonResult commonResult=new CommonResult();
        try {
            String sql="update major set year="+updateMajor.getYear()+", name='"+updateMajor.getName()+"' where year="+pastMajor.getYear()+" and name='"+pastMajor.getName()+"'";
            System.out.print(sql);
            jdbcTemplate.update(sql);
            commonResult.setStatus(1);
            commonResult.setDetail("修改成功！");
            return commonResult;

        }catch (Exception ex){

            commonResult.setDetail(ex.getMessage());
            commonResult.setStatus(-1);
            return commonResult;

        }


    }

    /**
     * 删除学院下面对应的专业
     * @param major
     * @return
     */
    public CommonResult deleteMajor(Major major){
        //定义返回的结果
        CommonResult commonResult=new CommonResult();
        try {
            String sql="DELETE FROM  major WHERE year=? AND name=? ";
            jdbcTemplate.update(sql,new Object[]{major.getYear(),major.getName()});
            commonResult.setStatus(1);
            commonResult.setDetail("专业已删除！");
            return commonResult;

        }catch (Exception ex){

            commonResult.setDetail(ex.getMessage());
            commonResult.setStatus(-1);
            return commonResult;

        }


    }

    /**
     * 获取所有专业
     * @return
     */
    public List<Major> getMajors(){

        List<Major> majors=new ArrayList<>();
        try {
            String sqlForMajors="select id,year,name from major";
            majors.addAll(jdbcTemplate.query(sqlForMajors, new RowMapper() {
                @Override
                public Major mapRow(ResultSet resultSet, int i) throws SQLException {
                    Major major = new Major(resultSet.getInt("id"), resultSet.getString("name"));
                    major.setYear(resultSet.getInt("year"));
                    return major;
                }
            }));
        }catch (Exception ex){
            logger.error("getMajors error,ex is:",ex);
        }
        return majors;
    }



}
