package org.andy.kmap.model.dao;

import java.sql.*;
import javax.sql.DataSource;

import org.andy.kmap.model.entity.*;

public class CategoryDaoImpl implements CategoryDao {

    private DataSource dataSource;


    public CategoryDaoImpl(DataSource dataSource) {

        this.dataSource = dataSource;
    }


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
