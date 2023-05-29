package com.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mycart.dao.UserDao;
import com.mycart.entity.User;
import com.mycart.helper.FactoryProvider;
@WebServlet("/update")
public class UserRecordUpdate extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   PrintWriter out = resp.getWriter();
	   resp.setContentType("text/html"); 
	   try {
		   int id=Integer.parseInt(req.getParameter("userId"));
		   String name=req.getParameter("username");
		   String email=req.getParameter("email");
		   String phone=req.getParameter("phone");
		   String pass=req.getParameter("password");
		   String address=req.getParameter("address");
		   
		   User u= new User(id, name, email,pass,phone,"default.jpg",address,"normal");
		   
		   UserDao dao=new UserDao(FactoryProvider.getFactory());
		   User user=dao.updateUser(u);
		   String key="success";
		  HttpSession session = req.getSession();
		  session.setAttribute("key", key);
		   if(user!=null) {
			   req.setAttribute("message", "Record updated successfully");
			 RequestDispatcher rd = req.getRequestDispatcher("update.jsp");
			   rd.include(req, resp);
			  
			  
		   }
		   else {
			   req.setAttribute("message", "update Record");	 
				resp.sendRedirect("update.jsp");
		   }
		
		  // System.out.println(id);
	   }
	   catch(Exception e) {
		   e.printStackTrace();
	   }
		
	}
	
}
