package com.mycart.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.mycart.entity.Category;

public class CategoryDao {
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		this.factory = factory;
	}

// save the category to database  
	public int saveCategory(Category cat) {
       Session session = this.factory.openSession();
		  Transaction tx = session.beginTransaction();
		int catId= (Integer)session.save(cat);
		  tx.commit();
		  session.close();
		return catId;
	}
	
	//fetching all categories from the database
  public List<Category> getCategories(){
	  Session session = this.factory.openSession();
	  Query query = session.createQuery("From Category");
	  List<Category> cat=query.list();
	  session.close();
	  return cat;
	  
  }
  
	//fetching category by id
   public Category getCategory(int cid) {
	   Category cat =null;
	   try {
	   Session session = this.factory.openSession();
	   cat=session.get(Category.class,cid);
	   session.close();
	   }
	   catch(Exception e) {
		   e.printStackTrace();
	   }
	   return cat;
	   
   }
  
  
}
