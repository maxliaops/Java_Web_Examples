package cars;
import java.io.*;

public class OrderHelp {
  String table;
  String fla;
  File files;
  String title;
  String names;
  int size;
  int height1;
  int height2;

  public OrderHelp() {

  }

  public void setfile(String path,String name){
    try{
    files=new File(path,name);
    size=(int)files.length();
    FileInputStream filein=new FileInputStream(files);
    byte[] buffer=new byte[size];
    filein.read(buffer);
    fla=new String(buffer);
    }
    catch(Exception e){
      e.printStackTrace();
    }
  }

  public void setname(String name,String name2){
    title=name;
    names=name2;
  }

  public void setsize(int ht,int ht2){
    height1=ht;
    height2=ht2;
  }

  public String gettable(){
    try{
      table="";
      table=table+"<table width='580' height='"+height1+"' border='1' cellpadding='0' cellspacing='0'>";
      table=table+"<tr bgcolor='#FFCC99'>";
      table=table+"<td height='20'>&nbsp;<a href='#'  style='color:#000000 '>"+title+"</a> --&gt;&gt; "+names+"</td>";
      table=table+"</tr><tr><td>";
      table=table+"<table width='480' height='"+height2+"' border='0' align='center' cellpadding='0' cellspacing='0'>";
      table=table+"<tr><td height='40' align='center'>";
      table=table+"<div align='center' class='bottm' style='font-size: 16px;color: #FF0000;font-weight: bold;width:130;'>"+names+"</div></td>";
      table=table+"</tr><tr><td height=20>&nbsp;</td></tr><tr><td valign='top'>&nbsp;<pre> ";
      table=table+fla+"</pre></td></tr></table></td></tr></table>";
      return table;
    }
    catch(Exception e){
      e.printStackTrace();
    }
    return null;
  }

}