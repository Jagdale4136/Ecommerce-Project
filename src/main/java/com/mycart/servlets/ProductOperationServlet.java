package com.mycart.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.eclipse.jdt.internal.compiler.env.IModule.IService;

import com.mycart.dao.CategoryDao;
import com.mycart.dao.ProductDao;
import com.mycart.entity.Category;
import com.mycart.entity.Product;
import com.mycart.helper.FactoryProvider;

@MultipartConfig
@WebServlet("/ProductOperationServlet")
public class ProductOperationServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {
			String op = request.getParameter("operation");
			if (op.trim().equals("addCategory")) {
				String categoryTitle = request.getParameter("catTitle");
				String categoryDesc = request.getParameter("catDescription");
				// System.out.println(categoryTitle + " " + categoryDesc);
				Category category = new Category();
				category.setCategoryTitle(categoryTitle);
				category.setCategoryDescription(categoryDesc);

				CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
				int catId = catDao.saveCategory(category);

				// out.print("<h1>Category saved</h1>");
				HttpSession session = request.getSession();
				session.setAttribute("message", "Category added Successfully");
				response.sendRedirect("admin.jsp");
				return;

			} else if (op.trim().equals("addProduct")) {
				String pName = request.getParameter("pName");
				String pDesc = request.getParameter("pDesc");
				int price = Integer.parseInt(request.getParameter("pPrice"));
				int discount = Integer.parseInt(request.getParameter("pDis"));
				int quantity = Integer.parseInt(request.getParameter("pQuantity"));
				int category = Integer.parseInt(request.getParameter("catId"));
				Part part = request.getPart("pPic");
				 
				Product p=new Product();
				p.setpName(pName);
				p.setpDesc(pDesc);
				p.setpPrice(price);
				p.setpDiscount(discount);
				p.setpQuantity(quantity);
				p.setpPhoto(part.getSubmittedFileName());
				//fetching category by id
				CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
				Category cat=catDao.getCategory(category);
				p.setCategory(cat);
				
				//product saving
				ProductDao pDao=new ProductDao(FactoryProvider.getFactory());
                   pDao.saveProduct(p);
                    
                   // picture upload 
				//find out the path to upload photo.
				
				String path=request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
				System.out.println(path);
				
				//uploading image
				FileOutputStream fos=new FileOutputStream(path);
				InputStream is=part.getInputStream();
				
				//reading image
				byte []data=new byte[is.available()];
				is.read(data);
				
				//writing data
				fos.write(data);
				fos.close();
				
				
				
				HttpSession session = request.getSession();
				session.setAttribute("message", "Product Added Successfully");
				response.sendRedirect("admin.jsp");
				return;
			}

		}

		catch (Exception e) {
			e.printStackTrace();
		}

	}
}
