package org.andy.kmap.model.dao;

import java.sql.*;
import javax.sql.DataSource;

import org.andy.kmap.model.entity.*;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository("PropertyDaoImpl")
public class PropertyDaoImpl implements PropertyDao {

    @Autowired
    @Qualifier("dataSource")
    private BasicDataSource dataSource;



    /**
     * This method gets the property of a certain course.
     * @param course
     * @return
     */
    public Property getProperty(Course course) {

        Connection connection = null;
        PreparedStatement statement = null;
        SQLException exception = null;

        Property property = null;

        try {
            connection = this.dataSource.getConnection();
            statement = connection.prepareStatement("SELECT property.id, property.name FROM course, property WHERE property.id = course.property AND course.id = ?");

            statement.setInt(1, course.getId());

            ResultSet result = statement.executeQuery();

            if (result.next()) {
               property = new Property(result.getInt(1), result.getString(2));
            }
        } catch (SQLException ex) {
            exception = ex;
        } finally {
            ConnectionCloser.close(connection, statement, exception);
        }

        return property;
    }
}
