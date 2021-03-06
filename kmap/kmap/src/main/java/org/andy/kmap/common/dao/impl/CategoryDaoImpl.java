package org.andy.kmap.common.dao.impl;

import java.sql.*;

import org.andy.kmap.common.dao.CategoryDao;
import org.andy.kmap.common.dao.ConnectionCloser;
import org.andy.kmap.common.model.entity.*;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("CategoryDaoImpl")
public class CategoryDaoImpl implements CategoryDao {

    @Autowired
    @Qualifier("dataSource")
    private BasicDataSource dataSource;


    /**
     * This method gets the category of a certain course.
     * @param course
     * @return
     */
    public Category getCategory(Course course) {

        Connection connection = null;
        PreparedStatement statement = null;
        SQLException exception = null;

        Category category = null;

        try {
            connection = this.dataSource.getConnection();
            statement = connection.prepareStatement("SELECT category.id, category.name, category.color FROM course, category WHERE category.id = course.category AND course.id = ?");

            statement.setInt(1, course.getId());

            ResultSet result = statement.executeQuery();

            if (result.next()) {
                category = new Category(result.getInt(1), result.getString(2), result.getString(3));
            }
        } catch (SQLException ex) {
            exception = ex;
        } finally {
            ConnectionCloser.close(connection, statement, exception);
        }

        return category;
    }
}
