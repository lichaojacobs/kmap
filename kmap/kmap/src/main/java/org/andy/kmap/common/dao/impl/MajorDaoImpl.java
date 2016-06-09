package org.andy.kmap.common.dao.impl;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

import org.andy.kmap.common.dao.ConnectionCloser;
import org.andy.kmap.common.dao.MajorDao;
import org.andy.kmap.common.model.entity.Major;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("MajorDaoImpl")
public class MajorDaoImpl implements MajorDao {

    @Autowired
    @Qualifier("dataSource")
    private BasicDataSource dataSource;

    /**
     * This method adds a major object into the database.
     * @param major
     */
    public void addMajor(Major major) {

        Connection connection = null;
        PreparedStatement statement = null;
        SQLException exception = null;

        try {
            connection = this.dataSource.getConnection();
            statement = connection.prepareStatement("INSERT INTO major(year, name) VALUES(?, ?)");

            statement.setInt(1, major.getYear());
            statement.setString(2, major.getName());

            statement.executeUpdate();
        } catch (SQLException ex) {
            exception = ex;
        } finally {
            ConnectionCloser.close(connection, statement, exception);
        }
    }


    /**
     * This method gets a list of major objects in the system.
     * @return a list of major objects.
     */
    public List<Major> getMajor() {

        List<Major> majors = new ArrayList<>();

        Connection connection = null;
        PreparedStatement statement = null;
        SQLException exception = null;

        try {
            connection = this.dataSource.getConnection();
            statement = connection.prepareStatement("SELECT year, name FROM major");

            ResultSet result = statement.executeQuery();

            while(result.next()) {
                Major major = new Major(result.getInt(1), result.getString(2));
                majors.add(major);
            }
        } catch (SQLException ex) {
            exception = ex;
        } finally {
            ConnectionCloser.close(connection, statement, exception);
        }

        return majors;
    }
   public Major getMajorByUserId(String email){
       Major major=null;
       Connection connection = null;
       PreparedStatement statement = null;
       SQLException exception = null;
       try {
           connection = this.dataSource.getConnection();
           statement = connection.prepareStatement("SELECT major from user where email=?");
           statement.setString(1,email);
           ResultSet result = statement.executeQuery();
           int majorId=0;
           while(result.next()) {
               majorId=result.getInt(1);
           }
           statement=connection.prepareStatement("SELECT * FROM major where id=?");
           statement.setInt(1,majorId);
           result=statement.executeQuery();
           while (result.next()){
               major = new Major(Integer.valueOf(result.getString(2)), result.getString(3));
               major.setId(result.getInt(1));
           }
       } catch (SQLException ex) {
           exception = ex;
       } finally {
           ConnectionCloser.close(connection, statement, exception);
       }
       return major;
   }
}
