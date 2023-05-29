package com.mycart.servlets;

import java.io.IOException;


import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.ha.backend.Sender;

import com.mycart.dao.UserDao;
import com.mycart.entity.User;
import com.mycart.helper.FactoryProvider;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   PrintWriter out = response.getWriter();
		try {
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			// validation  
			System.out.println(email);
			System.out.println(password);
			// authenticating user
			 UserDao userDao=new UserDao(FactoryProvider.getFactory());
			 User user = userDao.getUserByEmailAndPassword(email, password);
			  
			HttpSession session = request.getSession(); 
			session.setAttribute("email", email);
			session.setAttribute("password", password);
			 
			if(user==null) {
				//out.println("<h1>Invalid Details</h1>");
				session.setAttribute("message", "Invalid deatails !!  Try Again");
				response.sendRedirect("login.jsp");
				return;
			}
			else
			{
				out.println("<h1>Welcome  "+user.getUserName()+"</h1>");
				session.setAttribute("current-user", user);
				if(user.getUserType().equals("admin")) {
					response.sendRedirect("admin.jsp");
				}
				
				else if(user.getUserType().equals("normal")) {
					response.sendRedirect("normal.jsp");
				}
				else {
					out.print("we have not identified user type");
				}
				
			}
			
			
		}
		catch(Exception e) {
			
		}
		
	}

}
