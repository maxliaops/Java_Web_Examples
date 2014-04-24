package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.actionForm.GoodsForm;
import com.dao.*;
import org.apache.struts.action.Action;

public class Goods extends Action {
    private GoodsDAO goodsDAO=null;
    public Goods(){
        goodsDAO=new GoodsDAO();
    }
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {

        String action=request.getParameter("action");

        if(action.equals("") || action==null){
            request.setAttribute("error","您的操作有误！");
            return mapping.findForward("error");
        }else if(action.equals("goodsRequest")){
            return goodsQuery(mapping,form,request,response);
        }else if(action.equals("goodsadd")){
            return goodsAdd(mapping,form,request,response);
        }else if(action.equals("goodsMquery")){
            return goodsModiQuery(mapping,form,request,response);
        }else if(action.equals("goodsmodify")){
            return goodsModify(mapping,form,request,response);
        }else if(action.equals("goodsdel")){
            return goodsdel(mapping,form,request,response);
        }
        request.setAttribute("error","您的操作有误！");
        return mapping.findForward("error");
    }
    public ActionForward goodsQuery(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
        String str=null;
        int ifdel=0;   //获取未被删除的物资
        request.setAttribute("goodslist0",goodsDAO.query(str,ifdel));
        ifdel=1;   //获取已被删除的物资
        request.setAttribute("goodslist1",goodsDAO.query(str,ifdel));
        return mapping.findForward("goodsQuery");
    }
    //添加物资信息
    public ActionForward goodsAdd(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
        GoodsForm goodsForm = (GoodsForm) form;
//        goodsForm.setName(chStr.toChinese(goodsForm.getName()));
//        goodsForm.setSpec(chStr.toChinese(goodsForm.getSpec()));
//        goodsForm.setUnit(chStr.toChinese(goodsForm.getUnit()));
//        goodsForm.setProducer(chStr.toChinese(goodsForm.getProducer()));
        int rtn=goodsDAO.insert(goodsForm);
        if (rtn == 1) {
            return mapping.findForward("goodsaddok");
        } else if (rtn == 2) {
            request.setAttribute("error", "该物资信息已经添加！");
            return mapping.findForward("error");
        } else {
            request.setAttribute("error", "物资信息添加失败！");
            return mapping.findForward("error");
        }
    }
    //修改物资信息的查询
    public ActionForward goodsModiQuery(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        request.setAttribute("goodsForm",goodsDAO.query(id));
        return mapping.findForward("goodsModiQuery");
    }
    //修改物资信息
    public ActionForward goodsModify(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
        GoodsForm goodsForm = (GoodsForm) form;
        int rtn=goodsDAO.update(goodsForm);
        if (rtn == 1) {
            return mapping.findForward("goodsmodifyok");
        }else {
            request.setAttribute("error", "物资信息修改失败！");
            return mapping.findForward("error");
        }
    }
    //删除/恢复物资信息
    public ActionForward goodsdel(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
    int id=Integer.parseInt(request.getParameter("id"));
    byte val=Byte.parseByte(request.getParameter("val"));
    int rtn=goodsDAO.del(id,val);
    if(rtn==1){
         return mapping.findForward("goodsdelok");
    }else{
        request.setAttribute("error", "物资信息删除/恢复失败！");
        return mapping.findForward("error");
    }
}

}
