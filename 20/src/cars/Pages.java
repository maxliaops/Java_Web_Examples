package cars;
import java.sql.*;

/**
 * <p>Title: 华奥汽车销售集团网站</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: 明日科技有限公司</p>
 * @author not attributable
 * @version 1.0
 */

public class Pages {

  private ResultSet rs2;
  public int page;
  public int size;
  private int i;
  public int avg;
  public int sum;
  private int nows;

  public Pages() {
  }

  public ResultSet getrs(ResultSet rs1){
    try{
      rs2=rs1;
      rs2.last();
      sum=rs2.getRow();
      avg=sum/size;
      if(sum%size!=0){
        avg=avg+1;
      }
      nows=(page-1)*size;
      rs2.beforeFirst();
      for(i=0;i<nows;i++){
        if(rs2.next()){

        }
        else{
          break;
        }
      }
      return rs2;
    }
    catch(Exception ex){
      ex.printStackTrace();
    }
    return null;
  }
   public int getavg(){
     return avg;
   }

}