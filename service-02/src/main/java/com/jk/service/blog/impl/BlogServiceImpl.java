package com.jk.service.blog.impl;
import com.jk.entity.ContentDO;
import com.jk.mapper.blog.DeptsMapper;
import com.jk.service.blog.SblogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BlogServiceImpl implements SblogService {

    @Autowired
    private DeptsMapper deptMapper;

    @Override
    public Map<String, Object> queryblog(int limit,int offset,ContentDO c) {
        Map<String, Object> map = new HashMap<>();
        Long total=deptMapper.queryblogtotal(c);
        List<ContentDO> list=deptMapper.queryblog(limit,offset,c);
        map.put("total",total);
        map.put("rows",list);
        return map;
    }

    @Override
    public int updateStatus(ContentDO c) {

        return deptMapper.updateStatus(c);
    }

    @Override
    public int updateStatuss(ContentDO c) {
        return deptMapper.updateStatuss(c);
    }

    @Override
    public int saveblog(ContentDO c) {
        return deptMapper.saveblog(c);
    }

    @Override
    public ContentDO get(Long cid) {

        return deptMapper.get(cid);
    }

    @Override
    public ContentDO queryhui(ContentDO c) {

        return deptMapper.queryhui(c);
    }

    @Override
    public int updates(ContentDO c) {
        return deptMapper.updates(c);
    }
}
