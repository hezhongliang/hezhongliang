package com.jk.controller;


import com.jk.entity.ContentDO;

import com.jk.service.blog.SblogService;
import com.jk.util.DateUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("blog")
public class BlogController {

    @Autowired
    private SblogService sblogService;

    @RequestMapping("bComments")
    public String tobComments(){

        return "blog/bContent/bContent";
    }

    /*queryblog*/
    @RequestMapping("queryblog")
    @ResponseBody
    public Map<String , Object> queryblog(int limit,int offset,ContentDO c){
        Map <String , Object> map=new HashMap<>();
        map =sblogService.queryblog(limit,offset,c);
        return map;
    }

    /*updateStatus*/
    @RequestMapping("updateStatus")
    @ResponseBody
    public Object updateStatus(ContentDO c){
        int falg=sblogService.updateStatus(c);
        return falg;
    }
    /*updateStatuss*/
    @RequestMapping("updateStatuss")
    @ResponseBody
    public Object updateStatuss(ContentDO c){
        int falg=sblogService.updateStatuss(c);
        return falg;
    }

    /*toadd*/
    @RequestMapping("toadd")
    public String toadd(){

        return "blog/bcomments/add";
    }

    /*saveblog*/
    @RequestMapping("saveblog")
    @ResponseBody
    public Object saveblog(ContentDO c){
        int falg=sblogService.saveblog(c);
        return falg;
    }

    @GetMapping("/open/post/{cid}")
    String post(@PathVariable("cid") Long cid, Model model) {
        ContentDO bContentDO = sblogService.get(cid);
        model.addAttribute("bContent", bContentDO);
        model.addAttribute("gtmModified", DateUtils.format(bContentDO.getGtmModified()));
        return "blog/index/post";
    }
    /*queryhui*/
    @RequestMapping("queryhui")
    public ModelAndView queryhui(ContentDO c){
        Map<String , Object> map=new HashMap<>();
        c=sblogService.queryhui(c);
        map.put("bContent",c);
        return  new ModelAndView("blog/bContent/edit",map);

    }

    /*updates*/
    @RequestMapping("updates")
    @ResponseBody
    public Object updates(ContentDO c){
        int falg=sblogService.updates(c);
        return falg;
    }

    }




