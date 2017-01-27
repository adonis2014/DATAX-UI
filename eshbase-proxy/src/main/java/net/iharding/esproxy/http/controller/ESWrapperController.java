package net.iharding.esproxy.http.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.iharding.esproxy.exchange.Response;
import net.iharding.esproxy.http.manager.ESBatchManager;
import net.iharding.esproxy.http.manager.ESWrapperManager;
import net.iharding.esproxy.model.SearchModel;

/**
 * ES wrapper
 * Created by Jason峰 on 2014/12/26.
 */
@Controller
public class ESWrapperController extends MyBaseController {

    @Autowired
    private ESWrapperManager esWrapperManager;
    @Autowired
    private ESBatchManager esBatchManager;


    //    @ResponseBody
//    @RequestMapping(value = "/**", produces = "application/json;charset=utf-8")
    @RequestMapping(value = "/esRoot")
    public void es(Model model, HttpServletRequest request, HttpServletResponse res) throws ParseException, IOException {
        Response response = esWrapperManager.root(new SearchModel(request));

        res.setStatus(response.getStatus());
        res.setContentType(response.getContentType());

        res.getWriter().print(response.getMsg());
        res.getWriter().flush();

    }

    @RequestMapping(value = "/es/**/_source")
    public void source(Model model, HttpServletRequest request, HttpServletResponse res) throws ParseException, IOException {
        logger.info("source request:" + request.getRequestURI());
        Response response = esWrapperManager.search(new SearchModel(request));

        res.setStatus(response.getStatus());
        res.setContentType(response.getContentType());

        res.getWriter().print(response.getMsg());
        res.getWriter().flush();

    }

    @RequestMapping(value = "/es/**/_mget")
    public void mget(Model model, HttpServletRequest request, HttpServletResponse res) throws ParseException, IOException {
        logger.info("mget request:" + request.getRequestURI());
        Response response = esWrapperManager.search(new SearchModel(request));

        res.setStatus(response.getStatus());
        res.setContentType(response.getContentType());

        res.getWriter().print(response.getMsg());
        res.getWriter().flush();

    }

    @RequestMapping(value = "/es/**/_search")
    public void search(Model model, HttpServletRequest request, HttpServletResponse res) throws ParseException, IOException {
//        logger.info("search request:" + request.getRequestURI());
        Response response = esWrapperManager.search(new SearchModel(request));

        res.setStatus(response.getStatus());
        res.setContentType(response.getContentType());

        res.getWriter().print(response.getMsg());
        res.getWriter().flush();

    }

    @RequestMapping(value = "/es/**/_msearch")
    public void msearch(Model model, HttpServletRequest request, HttpServletResponse res) throws ParseException, IOException {
//        logger.info("msearch request:" + request.getRequestURI());
        Response response = esBatchManager.search(new SearchModel(request));

        res.setStatus(response.getStatus());
        res.setContentType(response.getContentType());

        res.getWriter().print(response.getMsg());
        res.getWriter().flush();

    }

  
    
    @RequestMapping(value = "/es/**/_bulk")
    public void bulk(Model model, HttpServletRequest request, HttpServletResponse res) throws ParseException, IOException {

        Response response = esBatchManager.write(new SearchModel(request));

        res.setStatus(response.getStatus());
        res.setContentType(response.getContentType());

        res.getWriter().print(response.getMsg());
        res.getWriter().flush();

    }

    //查询操作
    @RequestMapping(value = "/es/**", method = {RequestMethod.GET, RequestMethod.HEAD})
    public void get(Model model, HttpServletRequest request, HttpServletResponse res) throws ParseException, IOException {
//        logger.info("Http get request:" + request.getRequestURI());
        Response response = esWrapperManager.search(new SearchModel(request));

        res.setStatus(response.getStatus());
        res.setContentType(response.getContentType());

        res.getWriter().print(response.getMsg());
        res.getWriter().flush();

    }

    //写入操作
    @RequestMapping(value = "/es/**", method = {RequestMethod.PUT, RequestMethod.HEAD})
    public void searchAll(Model model, HttpServletRequest request, HttpServletResponse res) throws ParseException, IOException {

        Response response = esWrapperManager.write(new SearchModel(request));

        res.setStatus(response.getStatus());
        res.setContentType(response.getContentType());

        res.getWriter().print(response.getMsg());
        res.getWriter().flush();

    }

}
