package com.mycart.helper;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class Helper {
   public static String get10Words(String desc) {
	   String[] str=desc.split(" ");
	 
	   if(str.length>10) {
		   String res="";
		   
		   for(int i=0;i<10;i++) 
		   {
		   res+=str[i]+" ";
		   }
		   return (res+"...");
	   }
	 
	   else {
		   return desc+"...";
	   }
	   
   }
   public static Map<String,Long> getCounts(SessionFactory factory) {
	     Session session = factory.openSession();
	     String q1="Select count(*) from User";
	     String q2="Select count(*) from Product";
	        Query querey1 = session.createQuery(q1);
	        Query querey2 = session.createQuery(q2);
	        Long userCount =(Long) querey1.list().get(0);
	        Long productCount =(Long) querey2.list().get(0);
	        Map<String,Long> map=new HashMap<String,Long>();
	        map.put("productCount", productCount);
	        map.put("userCount", userCount);
	     session.close();
	     
	     return map;
   }
	
}
