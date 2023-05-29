package com.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mycart.entity.User;
import com.mycart.helper.FactoryProvider;
@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	              PrintWriter out = response.getWriter();
		try {
			String userName=request.getParameter("user_name");
			String userPassword=request.getParameter("user_password");
			String userEmail=request.getParameter("user_email");
			String userAddress=request.getParameter("user_address");
			String userPhone=request.getParameter("user_phone");
		
			User user=new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress,"normal");
			  Session session = FactoryProvider.getFactory().openSession();
			              Transaction tx = session.beginTransaction();
			                int  id = (Integer) (session.save(user));
			
			              tx.commit();
			              session.close();
			             
			             HttpSession httpsession = request.getSession();
			             httpsession.setAttribute("message","Registration Successfull!!"+ id);
			             response.sendRedirect("Register.jsp");
			        return;     
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
