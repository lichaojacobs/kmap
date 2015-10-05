package org.andy.kmap.listener;

import javax.naming.*;
import javax.servlet.*;
import javax.sql.DataSource;

import org.andy.kmap.model.dao.*;
import org.andy.kmap.model.service.*;

public class DataSourceListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent sce) {

        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");

            DataSource dataSource = (DataSource) envContext.lookup("jdbc/kmap");

            UserService userService = new UserService();
            CourseService courseService = new CourseService();
            DetailService detailService = new DetailService();

            MajorService majorService = new MajorService(new MajorDaoImpl(dataSource));

          //  userService.setUserDao(new UserDaoImpl(dataSource));

            courseService.setCourseDao(new CourseDaoImpl(dataSource));     // For Course Information.
            courseService.setCategoryDao(new CategoryDaoImpl(dataSource)); // For Category Information.
            courseService.setPropertyDao(new PropertyDaoImpl(dataSource)); // For Property Information.

            detailService.setDetailDao(new DetailDaoImpl(dataSource));

            ServletContext context = sce.getServletContext();

            context.setAttribute("userService", userService);
            context.setAttribute("courseService", courseService);
            context.setAttribute("detailService", detailService);
            context.setAttribute("majorService", majorService);
        } catch (NamingException ex) {
            throw new RuntimeException(ex);
        }
    }

    public void contextDestroyed(ServletContextEvent sce) {

    }
}
