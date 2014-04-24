package com.hiernate.util;
public class Test {
   public static void main(String args[]){
	   int intmethod;                       //定义int型变量
	   for(int i = 0 ;i < 200 ;i++ ){       
		   intmethod  = (int)( (((Math.random())*11))-1);   //按照我们的想法将Math.random()做乘10减1操作，之后赋值给变量 
		   if(intmethod == 10){             //对intmethod是否得10做重点判断
			   System.out.println("ok");     
		   }
		   System.out.print(intmethod+",");  //在控制台上打印变量，来检查赋值是否合理
		}
	  }
  }
