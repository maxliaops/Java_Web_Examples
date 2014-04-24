package cars;

/**
 * <p>Title: 华奥汽车销售集团网站</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: 明日科技有限公司</p>
 * @author not attributable
 * @version 1.0
 */

public class Bean3 {
  String url;
  String email;
  String number1;
  public Bean3() {
  }
  public String seturl(String name,String http){
    try{
      url="<a style='color:#000000;' href="+http+">"+name+"</a>";
      return url;
    }
    catch(Exception e){
    }
    return null;
  }
  public String setemail(String email1){
    try{
      email="E-mail:<a style='color:#000000;' href=mailto:"+email1+">"+email1+"</a>";
      return email;
    }
    catch(Exception e1){
    }
    return null;
  }
  public String setnumbers(String phone){
    try{
      number1="&nbsp;&nbsp;&nbsp;&nbsp; 客服热线:"+phone;
      return number1;
    }
    catch(Exception e2){
    }
    return null;
  }
}