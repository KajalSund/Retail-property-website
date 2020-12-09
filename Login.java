package com.login;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.UserLogin;
/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("uname");
		String pass=request.getParameter("password");
		
		UserLogin use =new UserLogin();
		
		if(use.check(name,pass))
		{
			request.getSession().invalidate();
			HttpSession session=request.getSession();
			session.setAttribute("username", name);
			response.sendRedirect("Welcome.jsp");
		}
		else
		{
			
			response.sendRedirect("Error.jsp");
		}
	}

}
