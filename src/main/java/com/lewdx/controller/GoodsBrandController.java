package com.lewdx.controller;

import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.entity.GoodsBrand;
import com.lewdx.service.IGoodsBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("goodsBrand")
public class GoodsBrandController {

    @Autowired
    private IGoodsBrandService goodsBrandService;

    //根据条件查询品牌列表
    @RequestMapping("getGoodsBrandListByCondition")
    public String getGoodsBrandListByCondition(Page page, String gbrandName, ModelMap map){
        PageInfo<GoodsBrand> pageInfo = goodsBrandService.getGoodsBrandListByCondition(page, gbrandName);
        map.put("pageInfo", pageInfo);
        //回显品牌名称
        map.put("gbrandName", gbrandName);
        map.put("url","goodsBrand/getGoodsBrandListByCondition");

        Gson gson = new Gson();
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("gbrandName", gbrandName);
        map.put("params",gson.toJson(paramMap));

        return "back/goodsbrand/goodsbrand-list";
    }

    //删除商品品牌信息
    @RequestMapping("deleteGoodsBrandById")
    @ResponseBody
    public SysResult deleteGoodsBrandById(Integer id){
        SysResult sysResult = goodsBrandService.deleteGoodsBrandById(id);
        return sysResult;
    }

    //停用商品品牌
    @RequestMapping("stopGoodsBrand")
    @ResponseBody
    public SysResult stopGoodsBrand(Integer id){
        SysResult sysResult = goodsBrandService.stopGoodsBrand(id);
        return sysResult;
    }

    //启用商品品牌
    @RequestMapping("startGoodsBrand")
    @ResponseBody
    public SysResult startGoodsBrand(Integer id){
        SysResult sysResult = goodsBrandService.startGoodsBrand(id);
        return sysResult;
    }

    //展示添加商品品牌界面
    @RequestMapping("toAdd")
    public String toAdd(){
        return "back/goodsbrand/goodsbrand-add";
    }

    //添加商品品牌信息
    @RequestMapping("addGoodsBrand")
    @ResponseBody
    public SysResult addGoodsBrand(@RequestParam("gbrandName") String gbrandName, @RequestParam("gbrandDesc") String gbrandDesc,
                                @RequestParam("gbrandLogo") MultipartFile gbrandLogo,@RequestParam("gbrandLogoThum") MultipartFile gbrandLogoThum ,
                                HttpServletRequest request) throws IOException {
        GoodsBrand goodsBrand = new GoodsBrand();
        goodsBrand.setGbrandName(gbrandName);
        goodsBrand.setGbrandDesc(gbrandDesc);

        //获取上传路径
        String uploadPath = request.getSession().getServletContext().getRealPath("/uploadfiles/brand");
        //String uploadPath = "E:\\JavaDemo\\IjWorld\\src\\main\\webapp\\uploadfiles\\brand";
        //获取目标路径
        String target1 = uploadPath+ File.separator+gbrandLogo.getOriginalFilename();
        String target2 = uploadPath+ File.separator+gbrandLogoThum.getOriginalFilename();
        //将文件上传到目标路径
        FileCopyUtils.copy(gbrandLogo.getInputStream(), new FileOutputStream(target1));
        FileCopyUtils.copy(gbrandLogoThum.getInputStream(), new FileOutputStream(target2));

        goodsBrand.setGbrandLogo(gbrandLogo.getOriginalFilename());
        goodsBrand.setGbrandLogoThum(gbrandLogoThum.getOriginalFilename());
        System.out.println(goodsBrand);
        SysResult sysResult = goodsBrandService.addGoodsBrand(goodsBrand);
        return sysResult;
    }

    //根据ID获取指定商品品牌信息（编辑初始化）
    @RequestMapping("toUpdate")
    public String toUpdate(Integer id, ModelMap map){
        GoodsBrand goodsBrand = goodsBrandService.selectByPrimaryKey(id);
        map.put("goodsBrand",goodsBrand);
        return "back/goodsbrand/goodsbrand-update";
    }

    //编辑商品品牌信息
    @RequestMapping("updateGoodsBrand")
    @ResponseBody
    public SysResult updateGoodsBrand(@RequestParam("id") Integer id,@RequestParam("gbrandName") String gbrandName,
                                   @RequestParam("gbrandDesc") String gbrandDesc, @RequestParam("gbrandLogo") MultipartFile gbrandLogo,
                                   @RequestParam("gbrandLogoThum") MultipartFile gbrandLogoThum , HttpServletRequest request) throws IOException {
        GoodsBrand goodsBrand = new GoodsBrand();
        goodsBrand.setId(id);
        goodsBrand.setGbrandName(gbrandName);
        goodsBrand.setGbrandDesc(gbrandDesc);

        //获取上传路径
        String uploadPath = request.getSession().getServletContext().getRealPath("/uploadfiles/brand");
        //String uploadPath = "E:\\JavaDemo\\IjWorld\\src\\main\\webapp\\uploadfiles\\brand";

        //获取目标路径
        String target1 = uploadPath+ File.separator+gbrandLogo.getOriginalFilename();
        String target2 = uploadPath+ File.separator+gbrandLogoThum.getOriginalFilename();

        //将文件上传到目标路径
        FileCopyUtils.copy(gbrandLogo.getInputStream(), new FileOutputStream(target1));
        FileCopyUtils.copy(gbrandLogoThum.getInputStream(), new FileOutputStream(target2));

        goodsBrand.setGbrandLogo(gbrandLogo.getOriginalFilename());
        goodsBrand.setGbrandLogoThum(gbrandLogoThum.getOriginalFilename());
        System.out.println(goodsBrand);
        SysResult sysResult = goodsBrandService.updateGoodsBrand(goodsBrand);
        return sysResult;

    }
}
