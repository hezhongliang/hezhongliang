package com.jk.service.blog;

import com.jk.entity.ContentDO;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public interface SblogService {

    Map<String,Object> queryblog(int limit, int offset, ContentDO c);

    int updateStatus(ContentDO c);

    int updateStatuss(ContentDO c);

    int saveblog(ContentDO c);

    ContentDO get(Long cid);

    ContentDO queryhui(ContentDO c);

    int updates(ContentDO c);
}
