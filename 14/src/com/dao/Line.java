package com.dao;

import java.util.Collection;
import java.util.Iterator;

import com.model.Mend;
import com.model.Soft;

/**
 * <p>Title: mingrisoft</p>
 * <p>Description: 明日科技门户网站</p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: MR</p>
 * @author BWM
 * @version 1.0
 */

public class Line {

    public int[] softToArray(){
        int[] soft=null;
        Collection softcoll=new Dbsoft().Select("");
        if(softcoll==null||softcoll.size()<=0||softcoll.isEmpty()){
            return null;
        }else{
            soft=new int [softcoll.size()];
            Iterator it=softcoll.iterator();
            for(int i=0;i<softcoll.size()&&it.hasNext();i++){
                Soft s=(Soft)it.next();
                soft[i]=s.getLoadnum();
           }
        }
        return soft;
    }
    private int[] mendToArray(){
        int[] mend=null;
        Collection softcoll=new Dbmend().Select("ORDER BY loadnum DESC");
        if(softcoll==null||softcoll.size()<=0||softcoll.isEmpty()){
            return null;
        }else{
            mend=new int [softcoll.size()];
            Iterator it=softcoll.iterator();
            for(int i=0;i<softcoll.size()&&it.hasNext();i++){
                Mend s=(Mend)it.next();
                mend[i]=s.getLoadnum();
            }
        }
        return mend;
    }
    public int[] getCountLine(){
        int soft[]=softToArray();
        int mend[]=mendToArray();
        int count[]=new int [soft.length+mend.length];
        for(int i=0;i<soft.length;i++){
            count[i]=soft[i];
            System.out.println(soft[i]+" soft[i]");
        }
        for(int j=0;j<mend.length;j++){
            count[soft.length+j]=mend[j];
            System.out.println(mend[j]+" mend[i]");
        }
        return count;
    }
}