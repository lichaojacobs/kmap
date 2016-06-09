package org.andy.kmap.common.dao.api;

import org.andy.kmap.common.model.entity.AddMajorViewModel;
import org.andy.kmap.common.model.entity.CommonResult;
import org.andy.kmap.common.model.entity.Major;

import java.util.List;

/**
 * Created by li on 2015/10/13.
 */
public interface APIMajorDao {

    public List<AddMajorViewModel> GetMajorsPerGrade();
    public CommonResult addMajor(Major major);
    public CommonResult editMajor(Major updateMajor,Major pastMajor);
    public CommonResult deleteMajor(Major major);
    public List<Major> getMajors();



}
