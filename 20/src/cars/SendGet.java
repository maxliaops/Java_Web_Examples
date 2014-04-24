package cars;

import javax.servlet.*;
import java.io.*;

/**
 * <p>Title: 华奥汽车销售集团网站</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: 明日科技有限公司</p>
 * @author not attributable
 * @version 1.0
 */

public class SendGet{

  /*数据流对象,用来存储用户上传的二进制数据流 */
  DataInputStream datas;
   /*存储REQUEST对象提起的客户端上传的二进制数据流*/
  ServletInputStream input;
  /*用于转换二进制数据流的字符数组*/
  byte[] buffer;
  private static String str="\r\n";
  int start,end,size,begin;
  String path;
  String all;
  int counts=0;
  int strs=0;
  int sum;

  public SendGet() {

  }

/*
   *提取用户上传的二进制数据流
   *参数为二进制数据流,数据流的大小
 **/

public void setdata(ServletInputStream inputs,int len){
  try{
  input=inputs;
  begin=0;
  size=len;
  byte[] buf=new byte[size];
  buffer=new byte[size];
  while(strs<size){
  sum = inputs.read(buf);
  for (int i = 0; i < sum; i++) {
  buffer[strs+i] = buf[i];
    }
  strs = strs + sum;
   }

  all=new String(buffer);
  path=all.substring(0,all.indexOf(str));
  int lengths=path.length();
  String repla=all;
  while(repla.indexOf(path,begin)!=-1){
    begin=repla.indexOf(path,begin);
    begin=begin+lengths;
    counts++;
  }
  begin=0;
  counts=counts-1;
  }
  catch(Exception e){
    e.printStackTrace();
  }
}


/*
  *提取指定顺序的表单数据
**/

  public String getdatas(int i){
    try{
      if (i > counts) {
        return null;
      }
      else{
        String rel=all;
        for(int j=0;j<i;j++){
           begin=rel.indexOf(path,begin);
           begin=begin+path.length();
        }
        start=rel.indexOf(str+str,begin)+2*str.length();
        end=rel.indexOf(path,begin);
        rel=rel.substring(start,end);
        start=0;
        end=0;
        begin=0;
        return rel;
      }
    }
    catch(Exception e){
      e.printStackTrace();
    }
    return null;
  }

  /*
    *提取指定顺序的表单组件的名称
  **/

 public String getformname(int i){
   try{
     if (i > counts) {
     return "wrong";
   }
   else{
     String rel=all;
     for(int j=0;j<i;j++){
        begin=rel.indexOf(path,begin);
        begin=begin+path.length();
     }
     start=rel.indexOf("name",begin)+6;
     end=rel.indexOf(str+str,begin);
     rel=rel.substring(start,end);
     rel=rel.substring(0,rel.indexOf("\""));
     start=0;
     end=0;
     begin=0;
     return rel;
   }
   }
   catch(Exception e){
     e.printStackTrace();
   }
   return null;
 }

public int getcounts(){
   return counts;
 }

 public String getall(){
   return all;
 }


}

