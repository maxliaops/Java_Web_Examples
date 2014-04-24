package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.actionForm.StockMainForm;
import com.dao.InstorageDAO;
import org.apache.struts.action.Action;
import com.dao.GoodsDAO;
import javax.servlet.http.HttpSession;

public class Instorage extends Action {
    InstorageDAO instorageDAO=null;
    public Instorage(){
        instorageDAO=new InstorageDAO();
    }
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {

        String action=request.getParameter("action");
        System.out.println("Action:"+action);
        if(action.equals("changeGoods")){  //选择物资信息时执行的操作
            return changeGoods(mapping,form,request,response);
        }else if(action.equals("stockadd")){
            return stockadd(mapping,form,request,response);
        }else if(action.equals("eligible")){
            return eligible(mapping,form,request,response);
        }else if(action.equals("uneligible")){
            return uneligible(mapping,form,request,response);
        }else{
            request.setAttribute("err","您的操作有误！");
            return mapping.findForward("error");
        }

    }

    //选择指定物资信息后的查询
    public ActionForward changeGoods(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response){
        GoodsDAO goodsDAO=new GoodsDAO();
        int goodsid=1;
        if(request.getParameter("id")!=null){
            goodsid=Integer.parseInt(request.getParameter("id"));
        }
        request.setAttribute("selGoods",goodsDAO.query(goodsid));   //获取选择的物资信息
        return mapping.findForward("stock");
    }
    //保存采购单信息
    public ActionForward stockadd(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response){
        StockMainForm stockMainForm=(StockMainForm)form;
        int rtn=instorageDAO.stockadd(stockMainForm,request);
        if(rtn==1){
            return mapping.findForward("stockaddok");
        }else{
            request.setAttribute("error","采购单信息保存失败！");
            return mapping.findForward("error");
        }
    }
    //审核入库
    public ActionForward eligible(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
        HttpSession httpsession = request.getSession();
        if(httpsession.getAttribute("username")==null){
            request.setAttribute("error","请先登录！");
            return mapping.findForward("error");
        }
        int id=Integer.valueOf(request.getParameter("id"));
        int rtn=instorageDAO.eligibleAdd(id,request);
        if(rtn==1){
            return mapping.findForward("eligibleAddok");
        }else{
            request.setAttribute("error","审核入库操作失败！");
            return mapping.findForward("error");
        }
    }
    //审核不合格处理
    public ActionForward uneligible(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
        HttpSession httpsession = request.getSession();
        if(httpsession.getAttribute("username")==null){
            request.setAttribute("error","请先登录！");
            return mapping.findForward("error");
        }
        int id=Integer.valueOf(request.getParameter("id"));
        int rtn=instorageDAO.uneligibleAdd(id,request);
        if(rtn==1){
            return mapping.findForward("eligibleAddok");
        }else{
            request.setAttribute("error","审核不合格操作失败！");
            return mapping.findForward("error");
        }
    }
}
