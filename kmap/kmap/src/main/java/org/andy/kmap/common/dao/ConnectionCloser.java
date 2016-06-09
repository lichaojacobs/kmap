package org.andy.kmap.common.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;

public class ConnectionCloser {

    public static void close(Connection connection, PreparedStatement statement, SQLException exception) {

        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException ex) {
                if (exception == null)
                    exception = ex;
            }
        }

        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {
                if (exception == null)
                    exception = ex;
            }
        }

        if (exception != null) {
            throw new RuntimeException(exception);
        }
    }
}
