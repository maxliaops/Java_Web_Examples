package com.dao;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import com.model.*;
import com.core.BasetableFactory;
import com.core.Database;
import com.core.FileUtils;
import com.core.FinalConstants;
import com.jspsmart.upload.Request;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2008</p>
 * <p>Company: MR</p>
 * @version 1.0
 * 具体工厂
 */

public class DbBasetableFactory extends BasetableFactory {
    public DbBasetableFactory() {//构造方法
    }
    //获取记录总数
    public int getRow(String sql) {
        return Database.getRow(sql);
    }
//创建用户
    public boolean CreateUser(HttpServletRequest request) {
        return (new Dbuser(request)).Insert();
    }
//获取用户信息
    public User SearchUser(String sql) {
        return new Dbuser(sql);
    }
//查询用户信息列表
    public Collection ListUser(int page, String sql) {
        return new Dbuser().Select(page, sql);
    }
//查询头像列表
    public Collection ListHead(int page, String sql) {
        return new Dbhead().Select(page, sql);
    }
//获取头像信息
    public Head SearchHead(String sql) {
        return new Dbhead(sql);
    }
//添加头像信息
    public boolean CreateHead(String iid, String path, int state) {
        return new Dbhead(iid, path, state).Insert();
    }
//查询公告信息列表
    public Collection ListAffiche(int page, String sql) {
        return new Dbaffiche().Select(page, sql);
    }
    public Collection ListAffiche(String sql) {
        return new Dbaffiche().Select(sql);
    }
//添加公告信息
    public boolean CreateAffiche(HttpServletRequest request) {
        return new Dbaffiche(request).Insert();
    }
//获取公告信息
    public Affiche SearchAffiche(String sql) {
        return new Dbaffiche(sql);
    }
//删除公告信息
    public boolean DeleteAffiche(String sql) {
        return Database.Delete(FinalConstants.DELETE_AFFICHE + sql);
    }
//查询新闻列表
    public Collection ListNew(int page, String sql) {
        return new Dbnew().Select(page, sql);
    }
//获取新闻信息
    public New SearchNew(String sql) {
        return new Dbnew(sql);
    }
    //添加新闻信息
    public boolean CreateNew(HttpServletRequest request) {
        return new Dbnew(request).Insert();
    }
    //删除新闻信息
    public boolean DeleteNew(String sql) {
        return Database.Delete(FinalConstants.DELETE_NEW + sql);
    }
    //查询友情链接信息列表
    public Collection ListLink(int page, String sql) {
        return new Dblink().Select(page, sql);
    }
    //获取友情链接信息
    public Link SearchLink(String sql) {
        return new Dblink(sql);
    }
    //添加友情链接信息
    public boolean CreateLink(HttpServletRequest request) {
        return new Dblink(request).Insert();
    }
    //删除友情链接信息
    public boolean DeleteLink(String sql) {
        return Database.Delete(FinalConstants.DELETE_LINK + sql);
    }
    //查询软件类别信息列表
    public Collection ListSsort(int page, String sql) {
        return new Dbssort().Select(page, sql);
    }
    //获取软件类别信息
    public Ssort SearchSsort(String sql) {
        return new Dbssort(sql);
    }
    //添加软件类别信息
    public boolean CreateSsort(HttpServletRequest request) {
        return new Dbssort(request).Insert();
    }
    //删除软件类别信息
    public boolean DeleteSsort(String sql) {
        return Database.Delete(FinalConstants.DELETE_SSORT + sql);
    }
    //查询软件资源信息列表
    public Collection ListSoft(int page, String sql) {
        return new Dbsoft().Select(page, sql);
    }
    //获取软件资源信息列表
    public Soft SearchSoft(String sql) {
        return new Dbsoft(sql);
    }
    //添加软件资源信息列表
    public boolean CreateSoft(Request request, String path) {
        return new Dbsoft(request, path).Insert();
    }
    //删除软件资源信息列表
    public boolean DeleteSoft(HttpServletRequest request,String sql) {
        if (!FileUtils.FileDel(request, "upload\\"+SearchSoft(sql).getPath())) {
            System.out.println("文件删除失败");  //删除上传的文件
        }
        if (Database.Delete(FinalConstants.DELETE_SOFT + sql)) {
            return true;
        }
        return false;
    }
    //获取软件类别信息
    public Collection ListSsort(String sql) {
        return new Dbssort().Select(sql);
    }
    //获取解决方案信息
    public Resolvent SearchResolvent(String sql) {
        return new Dbresolvent(sql);
    }
    //添加解决方案信息
    public boolean CreateResolvent(Request request, String iid) {
        return new Dbresolvent(request, iid).Insert();
    }
    //删除解决方案信息
    public boolean DeleteResolvent(String sql) {
        return Database.Delete(FinalConstants.DELETE_RESOLVENT + sql);
    }
    //查询软件资源信息列表
    public Collection ListSoft(String sql) {
        return new Dbsoft().Select(sql);
    }
    //查询解决方案信息列表
    public Collection ListResolvent(String sql) {
        return new Dbresolvent().Select(sql);
    }
    //查询解决方案信息列表（包括分页）
    public Collection ListResolvent(int page, String sql) {
        return new Dbresolvent().Select(page, sql);
    }
    //查询常见问题列表（包括分页）
    public Collection ListQuestion(int page, String sql) {
        return new Dbquestion().Select(page, sql);
    }
    //获取常见问题信息
    public Question SearchQuestion(String sql) {
        return new Dbquestion(sql);
    }

    public boolean CreateQuestion(HttpServletRequest request) {
        return new Dbquestion(request).Insert();
    }

    public boolean DeleteQuestion(String sql) {
        return Database.Delete(FinalConstants.DELETE_QUESTION + sql);
    }

    public Collection ListNew(String sql) {
        return new Dbnew().Select(sql);
    }

    public Collection ListQuestion(String sql) {
        return new Dbquestion().Select(sql);
    }

    public Collection ListGuestboard(int page, String sql) {
        return new Dbguestboard().Select(page, sql);
    }

    public Collection ListGuestboard(String sql) {
        return new Dbguestboard().Select(sql);
    }
    //获取留言簿信息
    public Guestboard SearchGuestboard(String sql) {
        return new Dbguestboard(sql);
    }

    public boolean CreateGuestboard(HttpServletRequest request) {
        return new Dbguestboard(request).Insert();
    }

    public boolean DeleteGuestboard(String sql) {
        return Database.Delete(FinalConstants.DELETE_GUESTBOARD + sql);
    }

    public Collection ListMend(int page, String sql) {
        return new Dbmend().Select(page, sql);
    }

    public Collection ListMend(String sql) {
        return new Dbmend().Select(sql);
    }
    //获取工具补丁下载信息
    public Mend SearchMend(String sql) {
        return new Dbmend(sql);
    }

    public boolean CreateMend(Request request, String path) {
        return new Dbmend(request, path).Insert();
    }

    public boolean DeleteMend(HttpServletRequest request,String sql) {
        if (!FileUtils.FileDel(request, "upload"+SearchMend(sql).getPath())) {
            System.out.println("工具/补丁删除失败");
        }
        return Database.Delete(FinalConstants.DELETE_MEND + sql);
    }

    public boolean DeleteHead(HttpServletRequest request, String sql) {
        if (!FileUtils.FileDel(request, SearchHead(sql).getPath())) {
            System.out.println("图片删除失败");
        }
        if (Database.Delete(FinalConstants.DELETE_HEAD + sql)) {
            return true;
        }
        return false;
    }
}
