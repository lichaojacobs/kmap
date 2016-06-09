package org.andy.kmap.common.service;

import org.andy.kmap.common.dao.CourseCommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lichao on 6/2/16.
 */
@Service
public class CourseCommentService {
  @Autowired
  CourseCommentDao courseCommentDao;
}
