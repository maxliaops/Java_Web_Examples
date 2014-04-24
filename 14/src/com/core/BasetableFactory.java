package com.core;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;

import com.BasetableFactoryProxy;
import com.jspsmart.upload.Request;
import com.model.*;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2008</p>
 * <p>Company: MR</p>
 * @author BWM
 * @version 2.0
 */

public abstract class BasetableFactory {
    private static final String classname = "com.dao.DbBasetableFactory";
    private static BasetableFactory factory;

    public static BasetableFactory getInstance() {
        if (factory == null) {
            try {
                Class c = Class.forName(classname);
                factory = (BasetableFactory) c.newInstance();
            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();
            } catch (IllegalAccessException ex1) {
                ex1.printStackTrace();
            } catch (InstantiationException ex1) {
                ex1.printStackTrace();
            }
        }
        return new BasetableFactoryProxy(factory);
    }

    public abstract int getRow(String sql);

    public abstract boolean CreateUser(HttpServletRequest request);

    public abstract User SearchUser(String sql);

    public abstract Collection ListUser(int page, String sql);

    public abstract Collection ListHead(int page, String sql);

    public abstract Head SearchHead(String sql);

    public abstract boolean CreateHead(String iid, String path, int state);
    public abstract boolean DeleteHead(HttpServletRequest request,String sql);

    public abstract Collection ListAffiche(int page, String sql);
    public abstract Collection ListAffiche(String sql);

    public abstract Affiche SearchAffiche(String sql);

    public abstract boolean CreateAffiche(HttpServletRequest request);

    public abstract boolean DeleteAffiche(String sql);

    public abstract Collection ListNew(int page, String sql);

    public abstract Collection ListNew(String sql);

    public abstract New SearchNew(String sql);

    public abstract boolean CreateNew(HttpServletRequest request);

    public abstract boolean DeleteNew(String sql);

    public abstract Collection ListLink(int page, String sql);

    public abstract Link SearchLink(String sql);

    public abstract boolean CreateLink(HttpServletRequest request);

    public abstract boolean DeleteLink(String sql);

    public abstract Collection ListSoft(int page, String sql);

    public abstract Collection ListSoft(String sql);

    public abstract Soft SearchSoft(String sql);
//Ìí¼ÓÈí¼þ
    public abstract boolean CreateSoft(Request request, String path);

    public abstract boolean DeleteSoft(HttpServletRequest request,String sql);

    public abstract Collection ListSsort(int page, String sql);

    public abstract Collection ListSsort(String sql);

    public abstract Ssort SearchSsort(String sql);

    public abstract boolean CreateSsort(HttpServletRequest request);

    public abstract boolean DeleteSsort(String sql);

    public abstract Collection ListResolvent(String sql);

    public abstract Collection ListResolvent(int page, String sql);

    public abstract Resolvent SearchResolvent(String sql);

    public abstract boolean CreateResolvent(Request request, String iid);

    public abstract boolean DeleteResolvent(String sql);

    public abstract Collection ListQuestion(int page, String sql);

    public abstract Collection ListQuestion(String sql);

    public abstract Question SearchQuestion(String sql);

    public abstract boolean CreateQuestion(HttpServletRequest request);

    public abstract boolean DeleteQuestion(String sql);
    public abstract Collection ListGuestboard(int page, String sql);

    public abstract Collection ListGuestboard(String sql);

    public abstract Guestboard SearchGuestboard(String sql);

    public abstract boolean CreateGuestboard(HttpServletRequest request);

    public abstract boolean DeleteGuestboard(String sql);
    public abstract Collection ListMend(int page, String sql);

    public abstract Collection ListMend(String sql);

    public abstract Mend SearchMend(String sql);

    public abstract boolean CreateMend(Request request,String path);

    public abstract boolean DeleteMend(HttpServletRequest request,String sql);

}
