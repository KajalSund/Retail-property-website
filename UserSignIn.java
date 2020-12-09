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
 * Servlet implementation class UserSignIn
 */
@WebServlet("/UserSignIn")
public class UserSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSignIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("uname");
		String pass=request.getParameter("password");
		String confpass=request.getParameter("Cpassword");
		
		if(!pass.equals(confpass))
		{
			response.sendRedirect("Error.jsp");
		}
		else
		{
			UserLogin user=new UserLogin();
			if(user.checkUser(uname, pass))
			{
				request.getSession().invalidate();
				HttpSession session=request.getSession();
				session.setAttribute("username", uname);
				response.sendRedirect("Welcome.jsp");
			}
			else
			{
				response.sendRedirect("Error.jsp");
			}
			
		}
	}

}
