package org.andy.kmap.tools;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.RowMapperResultSetExtractor;

import java.util.Collection;
import java.util.List;

/**
 * Created by lichao on 16/6/9.
 */
public class MyJdbcTemplate extends JdbcTemplate {

  @Override
  public <T> T queryForObject(String sql, Object[] args, RowMapper<T> rowMapper)
      throws DataAccessException {
    List<T> results = query(sql, args, new RowMapperResultSetExtractor<T>(rowMapper, 1));
    return MyJdbcTemplate.requiredSingleResult(results);
  }

  public static <T> T requiredSingleResult(Collection<T> results)
      throws IncorrectResultSizeDataAccessException {
    int size = (results != null ? results.size() : 0);
    if (size == 0) {
      return null;
    }
    if (results.size() > 1) {
      throw new IncorrectResultSizeDataAccessException(1, size);
    }
    return results.iterator().next();
  }
}
