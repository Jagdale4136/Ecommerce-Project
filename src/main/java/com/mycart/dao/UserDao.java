package com.mycart.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.mycart.entity.User;

public class UserDao {
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		this.factory = factory;
	}

	// get user by email and password..
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;
		try {
			 String query = "from User where userEmail =:userEmail and userPassword=:userPassword";
			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("userEmail", email);
			q.setParameter("userPassword", password);
			user = (User) q.uniqueResult();
		
			session.close();

		} catch (Exception e) {

		}
		return user;

	}
	
	public User getUserBYId(int id) {
		User user = null;
		try {
			 String query = "from User where userId =:userId";
			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("userId", id);
			user=(User)q.uniqueResult();
			session.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	
	public User updateUser(User u) {
		Session session = this.factory.openSession();
		Transaction tx = null;
		 try {
		        tx = session.beginTransaction();

		        User user = session.get(User.class, u.getUserId());
		        user.setUserName(u.getUserName());
		        user.setUserEmail(u.getUserEmail());
		        user.setUserPassword(u.getUserPassword());
		        user.setUserPhone(u.getUserPhone());
                user.setUserAddress(u.getUserAddress());
		        session.update(user);
		        tx.commit();
		        return user;

		    } catch (RuntimeException e) {
		        if (tx != null) tx.rollback();
		        throw e;
		    }		


	}
}
