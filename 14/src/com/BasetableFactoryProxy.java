package com;

import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import com.model.*;
import com.core.BasetableFactory;
import com.jspsmart.upload.Request;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: MR</p>
 * @author BWM
 * @version 1.0
 */
public class BasetableFactoryProxy extends BasetableFactory {
    private BasetableFactory factory;
    public BasetableFactoryProxy(BasetableFactory factory) {
        this.factory = factory;
    }

    public int getRow(String sql) {
        return factory.getRow(sql);
    }

    public boolean CreateUser(HttpServletRequest request) {
         System.out.print("BasetableFactoryProxy.java÷–:"+request+"Ω· ¯");
        return factory.CreateUser(request);
    }

    public User SearchUser(String sql) {
        return factory.SearchUser(sql);
    }

    public Collection ListHead(int page, String sql) {
        return factory.ListHead(page, sql);
    }

    public Collection ListUser(int page, String sql) {
        return factory.ListUser(page, sql);
    }

    public Head SearchHead(String sql) {
        return factory.SearchHead(sql);
    }

    public boolean CreateHead(String iid, String name,int state) {
        return factory.CreateHead(iid, name, state);
    }

    public Collection ListAffiche(int page, String sql) {
        return factory.ListAffiche(page, sql);
    }

    public Affiche SearchAffiche(String sql) {
        return factory.SearchAffiche(sql);
    }

    public boolean CreateAffiche(HttpServletRequest request) {
        return factory.CreateAffiche(request);
    }

    public boolean DeleteAffiche(String sql) {
        return factory.DeleteAffiche(sql);
    }

    public Collection ListNew(int page, String sql) {
        return factory.ListNew(page, sql);
    }

    public New SearchNew(String sql) {
        return factory.SearchNew(sql);
    }

    public boolean CreateNew(HttpServletRequest request) {
        return factory.CreateNew(request);
    }

    public boolean DeleteNew(String sql) {
        return factory.DeleteNew(sql);
    }

    public Collection ListLink(int page, String sql) {
        return factory.ListLink(page, sql);
    }

    public Link SearchLink(String sql) {
        return factory.SearchLink(sql);
    }

    public boolean CreateLink(HttpServletRequest request) {
        return factory.CreateLink(request);
    }

    public boolean DeleteLink(String sql) {
        return factory.DeleteLink(sql);
    }

    public Collection ListSsort(int page, String sql) {
        return factory.ListSsort(page, sql);
    }
    
    public Collection ListSsort(String sql) {
        return factory.ListSsort(sql);
    }
    
    public Ssort SearchSsort(String sql) {
        return factory.SearchSsort(sql);
    }

    public boolean CreateSsort(HttpServletRequest request) {
        return factory.CreateSsort(request);
    }

    public boolean DeleteSsort(String sql) {
        return factory.DeleteSsort(sql);
    }

    public Collection ListSoft(int page, String sql) {
        return factory.ListSoft(page,sql);
    }

    public Soft SearchSoft(String sql) {
        return factory.SearchSoft(sql);
    }

    public boolean CreateSoft(Request request,String path) {
        return factory.CreateSoft(request,path);
    }

    public boolean DeleteSoft(HttpServletRequest request,String sql) {
        return factory.DeleteSoft(request,sql);
    }

    public Collection ListResolvent(String sql) {
        return factory.ListResolvent(sql);
    }

    public Resolvent SearchResolvent(String sql) {
        return factory.SearchResolvent(sql);
    }

    public boolean CreateResolvent(Request request,String iid) {
        return factory.CreateResolvent(request,iid);
    }

    public boolean DeleteResolvent(String sql) {
        return factory.DeleteResolvent(sql);
    }

    public Collection ListSoft(String sql) {
        return factory.ListSoft(sql);
    }

    public Collection ListResolvent(int page, String sql) {
        return factory.ListResolvent(page,sql);
    }

    public Collection ListQuestion(int page, String sql) {
        return factory.ListQuestion(page,sql);
    }

    public Question SearchQuestion(String sql) {
        return factory.SearchQuestion(sql);
    }

    public boolean CreateQuestion(HttpServletRequest request) {
        return factory.CreateQuestion(request);
    }

    public boolean DeleteQuestion(String sql) {
        return factory.DeleteQuestion(sql);
    }

    public Collection ListNew(String sql) {
        return factory.ListNew(sql);
    }

    public Collection ListQuestion(String sql) {
        return factory.ListQuestion(sql);
    }

    public Collection ListGuestboard(int page, String sql) {
        return factory.ListGuestboard(page,sql);
    }

    public Collection ListGuestboard(String sql) {
        return factory.ListGuestboard(sql);
    }

    public Guestboard SearchGuestboard(String sql) {
        return factory.SearchGuestboard(sql);
    }

    public boolean CreateGuestboard(HttpServletRequest request) {
        return factory.CreateGuestboard(request);
    }

    public boolean DeleteGuestboard(String sql) {
        return factory.DeleteGuestboard(sql);
    }

    public Collection ListMend(int page, String sql) {
        return factory.ListMend(page,sql);
    }

    public Collection ListMend(String sql) {
        return factory.ListMend(sql);
    }

    public Mend SearchMend(String sql) {
        return factory.SearchMend(sql);
    }

    public boolean CreateMend(Request request,String path) {
        return factory.CreateMend(request,path);
    }

    public boolean DeleteMend(HttpServletRequest request,String sql) {
        return factory.DeleteMend(request,sql);
    }

    public boolean DeleteHead(HttpServletRequest request, String sql) {
        return factory.DeleteHead(request,sql);
    }

//    public Collection ListFsort(int page, String sql) {
//        return factory.ListFsort(page,sql);
//    }
//
//    public Collection ListFsort(String sql) {
//        return factory.ListFsort(sql);
//    }
//
//    public Fsort SearchFsort(String sql) {
//        return factory.SearchFsort(sql);
//    }
//
//    public boolean CreateFsort(HttpServletRequest request) {
//        return factory.CreateFsort(request);
//    }
//
//    public boolean DeleteFsort(String sql) {
//        return factory.DeleteFsort(sql);
//    }


    public Collection ListAffiche(String sql) {
        return factory.ListAffiche(sql);
    }
}
