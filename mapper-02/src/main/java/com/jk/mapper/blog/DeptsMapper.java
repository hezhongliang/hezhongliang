package com.jk.mapper.blog;

import com.jk.entity.ContentDO;
import com.jk.entity.user.DeptDO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface DeptsMapper {

 /*   List<DeptDO> list(Map<String, Object> map);

    @Delete("DELETE FROM sys_dept WHERE dept_id = #{deptId}")
    int deletedept(DeptDO d);


    DeptDO querydepts(Long deptId);


    int addDept(DeptDO d);
    @Select("select name from sys_dept where dept_id = #{parentId}")
    DeptDO querydeptss(Long parentId);

    int updatedept(DeptDO d);*/

    Long queryblogtotal(ContentDO c);

    List<ContentDO> queryblog(@Param("limit") int limit, @Param("offset") int offset, @Param("c") ContentDO c);

    @Update("UPDATE blog_content b SET  b.status = 2 WHERE cid = #{cid}")
    int updateStatus(ContentDO c);

    @Update("UPDATE blog_content b SET  b.status = 2 WHERE cid in (${title})")
    int updateStatuss(ContentDO c);

    int saveblog(ContentDO c);

    ContentDO get(Long cid);

    ContentDO queryhui(ContentDO c);

    int updates(ContentDO c);

/*    long querytotal(DeptDO d);

    List<DeptDO> querydept(@Param("page") int page, @Param("rows")int rows, @Param("d") DeptDO d);*/
}
