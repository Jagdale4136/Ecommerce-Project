package com.mycart.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.mycart.entity.Product;



public class ProductDao {
   private SessionFactory factory;

public ProductDao(SessionFactory factory) {
	this.factory = factory;
}
// saving product
  public boolean saveProduct(Product p) {
	  boolean b=false;
	  try {
		  
	  
	  Session session = this.factory.openSession();
	  Transaction tx = session.beginTransaction();
	session.save(p);
	  tx.commit();
	  session.close();
	  b=true;
	  }
	  catch(Exception e) {
		  e.printStackTrace();
		  b=false;
	  }
	 return b;
  }

  
  // fetching list of products
  
    public List<Product> getAllProdcuts(){
    	  Session session = this.factory.openSession();
    	  Query query = session.createQuery("from Product");
    	      List<Product> list = query.list();
    	      return list;
    	  
    }
    
 // fetching list of products by using category id
    public List<Product> getAllProdcutsById(int cid){
  	  Session session = this.factory.openSession();
  	  Query query = session.createQuery("from Product as p where p.category.categoryId=:id");
  	    query.setParameter("id", cid);
  	      List<Product> list = query.list();
  	      return list;
  	  
  }
    
   

}
