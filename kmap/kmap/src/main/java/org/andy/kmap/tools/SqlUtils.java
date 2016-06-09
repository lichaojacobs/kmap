package org.andy.kmap.tools;

import org.andy.kmap.common.model.entity.Major;
import org.apache.log4j.Logger;

import java.sql.PreparedStatement;
import java.util.List;
/**
 * Created by lichao on 16/5/10.
 */
public class SqlUtils {

    private static Logger logger = Logger.getLogger(SqlUtils.class);


    private static   List<Integer> courseIds;

    public static List<Integer> getCourseIds() {
        return courseIds;
    }

    public static void setCourseIds(List<Integer> courseIds) {
        SqlUtils.courseIds = courseIds;
    }

    /**

     * 拼接成SQL语句
     * @param
     * @return
     */
    public static PreparedStatement generateInSqlStr(java.sql.Connection connection, PreparedStatement statement, Major major){
        StringBuffer buffer=new StringBuffer();

        try {
            for (int i = 0; i < courseIds.size(); i++)
            {
                buffer.append("?, ");
            }
            buffer.deleteCharAt(buffer.length() - 1);
            buffer.deleteCharAt(buffer.length() - 1);

            String sql = "SELECT course.id, course.name, mc.credit FROM course, mc WHERE mc.major = ? AND mc.course = course.id AND course.id in (" + buffer.toString() +")  ";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, major.getId());
            logger.info("执行getcourse函数:"+statement.toString());

            for (int i = 0; i < courseIds.size(); i++)
            {
                statement.setInt(i + 2, courseIds.get(i));
            }

        }catch (Exception ex){
            logger.error("generateInSqlStr err:",ex);
        }

        return statement;
    }

    public static String generateIdStrs(){

        StringBuffer buffer=new StringBuffer();

        for (int i = 0; i < courseIds.size(); i++)
        {
            buffer.append("?, ");
        }
        buffer.deleteCharAt(buffer.length() - 1);
        buffer.deleteCharAt(buffer.length() - 1);

        return buffer.toString();
    }

}
