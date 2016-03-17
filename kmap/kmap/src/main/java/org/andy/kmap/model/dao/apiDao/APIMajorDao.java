package org.andy.kmap.model.dao.apiDao;

import org.andy.kmap.model.entity.AddMajorViewModel;
import org.andy.kmap.model.entity.CommonResult;
import org.andy.kmap.model.entity.Major;

import java.util.List;

/**
 * Created by li on 2015/10/13.
 */
public interface APIMajorDao {

    public List<AddMajorViewModel> GetMajorsPerGrade();
    public CommonResult addMajor(Major major);
    public CommonResult editMajor(Major updateMajor,Major pastMajor);
    public CommonResult deleteMajor(Major major);



}
