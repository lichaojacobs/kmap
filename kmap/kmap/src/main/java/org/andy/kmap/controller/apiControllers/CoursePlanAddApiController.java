package org.andy.kmap.controller.apiControllers;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.andy.kmap.model.entity.CommonResult;
import org.andy.kmap.model.map.CourseMap;
import org.andy.kmap.model.map.CourseRelations;
import org.andy.kmap.model.service.apiService.APICoursePlanService;
import org.json.JSONString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;
/**
 * Created by li on 2015/10/30.
 */
@Controller
@RequestMapping("/API/CoursePlan/")
public class CoursePlanAddApiController {

    @Autowired
    private APICoursePlanService apiCoursePlanService;

    @RequestMapping("GetDropDownModel")
    public @ResponseBody Object getDropDownModel(HttpServletRequest request){
       String type= request.getParameter("type");
        return apiCoursePlanService.getDropDownModels(Integer.valueOf(type));

    }
    @RequestMapping("GetCoursesByAcademy")
    public @ResponseBody Object GetCoursesByAcademy(HttpServletRequest request){
        try {
            request.setCharacterEncoding("UTF-8");
            String academyName=request.getParameter("academyname");
            return apiCoursePlanService.GetCoursesByAcademy(academyName);
        }catch (Exception ex)
        {
            return null;
        }
    }
    @RequestMapping("AddCoursePlan")
    public  @ResponseBody Object AddCoursePlan(HttpServletRequest request){

        try {
            //转换为UTF-8格式
            request.setCharacterEncoding("UTF-8");
            String jsonStr=request.getParameter("CoursePlanMap");
            if(jsonStr==null||jsonStr=="")
            {
                CommonResult commonResult=new CommonResult();
                commonResult.setDetail("参数有误,稍候再试");
                commonResult.setStatus(-1);
                return commonResult;
            }
            else {
                List<CourseRelations> courseMaps=new ArrayList<CourseRelations>();
                JSONArray jsonArray =new JSONArray(jsonStr);
                for (int i=0;i<jsonArray.length()-1;i++){
                    JSONObject courseMap=(JSONObject)jsonArray.get(i);
                    CourseRelations temp=new CourseRelations();
                    temp.head=courseMap.getString("head");
                    temp.tail=courseMap.getString("tail");
                    courseMaps.add(temp);
                }
                JSONObject courseBelong=(JSONObject)jsonArray.get(jsonArray.length()-1);
                String academy=courseBelong.getString("college");
                String major=courseBelong.getString("major");
                String year=courseBelong.getString("year");
                return apiCoursePlanService.AddCoursePlan(courseMaps,academy,major,year);
            }

        }catch (Exception ex){

            CommonResult commonResult=new CommonResult();
            commonResult.setDetail("网络故障,请稍候再试");
            commonResult.setStatus(0);
            return commonResult;
        }

    }

    @RequestMapping("Search")
    public @ResponseBody Object Search(HttpServletRequest request){
        try {
            String college=request.getParameter("college");
            String major=request.getParameter("major");
            String year=request.getParameter("year");
            return apiCoursePlanService.getSearchResults(college,major,year);
        }catch (Exception ex){
            return null;
        }
    }

}
