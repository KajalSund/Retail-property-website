package com.Book;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.CustomerHelperClass;

/**
 * Servlet implementation class CustomerServlet
 */
@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CustomerServlet() {
        super();
        
    }

	CustomerHelperClass customer=new CustomerHelperClass();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("command");
		
		switch(action)
		{
		case "RegisterUser" :
			RegisterUser(request,response);
			break;
			
		case "CheckBooking" :
			CheckBooking(request,response);
			break;
		
	case "EditUser" :
		EditUser(request,response);
		break;
		
	case "CheckRegisterUser":
		CheckRegisterUser(request,response);
		break;
		
	case "MakePayment":
		MakePayment(request,response);
		break;
	}
		
	}


	private void MakePayment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String to=request.getParameter("to");
		String from=request.getParameter("from");
		String id=request.getParameter("ID");
		String cost=request.getParameter("cost");
		String cost2=cost.substring(0, cost.length()-3);
		int finalcost=Integer.parseInt(cost2);
		String uname=(String)request.getSession(false).getAttribute("username");
		
		if(customer.MakePayment(uname,to,from,id,finalcost))
		{
			response.sendRedirect("BookingSuccess.jsp");
		}
		else
			 response.sendRedirect("Login-error.jsp");
		
	}


	private void CheckRegisterUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String space=request.getParameter("space");
		String uname=(String)request.getSession(false).getAttribute("username");
		if(!customer.CheckUser(uname))
		{

			ArrayList<BookinStatus> list=customer.Printstatus(space);
			request.setAttribute("book",list);
			RequestDispatcher dispatch=request.getRequestDispatcher("ConfirmBooking.jsp");
			dispatch.forward(request,response);
		}
		else
		{
			response.sendRedirect("NotRegistered.jsp");
		}
	}


	private void EditUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String prof=request.getParameter("prof");
		String tel=request.getParameter("tel");
		String adress=request.getParameter("adress");
		String dob=request.getParameter("dob");
		String uname=(String)request.getSession(false).getAttribute("username");
		List<String> list=new ArrayList<>();
		list.add(uname);
		list.add(name);
		list.add(email);
		list.add(tel);
		list.add(dob);
		list.add(adress);
		list.add(prof);
		
		if(customer.EditUser(list))
		{
			response.sendRedirect("UserInfo.jsp");
		}
		else
		{
			response.sendRedirect("Login-error.jsp");
		}
		
	}


	private void CheckBooking(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id=request.getParameter("space_id");
		String to=request.getParameter("date");
		
		if(customer.checkBookingStatus(id))
		{

			SimpleDateFormat formats=new SimpleDateFormat("MM/dd/yyyy");
			Date date=new Date();
			Date date1,date2;
			String str=formats.format(date);
			try {
				 date1=formats.parse(str);
				 date2=formats.parse(to);
				if(date1.compareTo(date2)>0)
					response.sendRedirect("Login-error.jsp");
				else if(date1.compareTo(date2)<0)
				{
					long noOfday=date2.getTime() - date1.getTime();
					long day=TimeUnit.DAYS.convert(noOfday,TimeUnit.MILLISECONDS);  // Total days
					int cost=customer.checkDays(id,day); //total cost
					request.setAttribute("days", day);
					request.setAttribute("cost", cost);
					request.setAttribute("todate", to);
					request.setAttribute("fromdate", str);
					request.setAttribute("space_id", id);
					RequestDispatcher dispatch=request.getRequestDispatcher("makepayment.jsp");
					dispatch.forward(request, response);
					
				}
				else
					response.sendRedirect("Login-error.jsp");
				
				
					
			} catch (ParseException e) {
				e.printStackTrace();
				response.sendRedirect("Login-error.jsp");
			}
			
		}
		else
		{
			response.sendRedirect("Login-error.jsp");
		}
		}



	private void RegisterUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<UserType> l=new ArrayList<UserType>();
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String prof=request.getParameter("prof");
		String tel=request.getParameter("tel");
		String adress=request.getParameter("adress");
		String dob=request.getParameter("date");
		String space=request.getParameter("space");
		String gender=request.getParameter("radio");
		String uname=(String)request.getSession(false).getAttribute("username");
		if(!customer.CheckUser(uname))
		{
		          response.sendRedirect("AlreadyRegisterError.jsp");	
		}
		else
		{
			UserType u=new UserType(name,email,prof,tel,adress,dob,gender,uname);
			l.add(u);
			if(customer.InsertUser(u))
			{
				ArrayList<BookinStatus> list=customer.Printstatus(space);
				request.setAttribute("book",list);
				RequestDispatcher dispatch=request.getRequestDispatcher("ConfirmBooking.jsp");
				dispatch.forward(request,response);
			}
			else
			{
				response.sendRedirect("Login-error.jsp");
			}
		}
		
	}
	
	

}
