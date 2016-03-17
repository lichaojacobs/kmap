package org.andy.kmap.model.service;

import java.util.List;

import org.andy.kmap.model.dao.*;
import org.andy.kmap.model.entity.*;
import org.andy.kmap.model.map.DetailMap;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("DetailService")
public class DetailService {

    @Autowired
    @Qualifier("DetailDaoImpl")
    private DetailDao detailDao;


    public void setDetailDao(DetailDao detailDao) {

        this.detailDao = detailDao;
    }

    public String getDetailMap(Course course) {

        DetailMap map = new DetailMap(course);
        List<Detail> details = this.detailDao.getDetails(course);

        for (int i = 0; i < details.size(); i++) {
            Detail tail = details.get(i);
            List<Detail> heads = this.detailDao.getHeads(tail);
            List<Detail> tails = this.detailDao.getTails(tail);
            map.addNode(tail);
            if (tails.size() == 0) {
                map.addEdge(tail);
            }
            //说明有尾节点
            if (heads.size() > 0) {
                for (Detail head : heads) {
                    map.addEdge(tail, head);
                }
            }
        }
        return new Gson().toJson(map);
    }

}
