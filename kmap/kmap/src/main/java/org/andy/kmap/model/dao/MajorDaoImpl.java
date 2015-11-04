package org.andy.kmap.model.dao;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import javax.sql.DataSource;

import org.andy.kmap.model.entity.Major;
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
}
