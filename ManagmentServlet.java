package com.Book;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import com.Book.BookinStatus;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.ManagmentHelperClass;
import com.Book.*;

@WebServlet("/ManagmentServlet")
public class ManagmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ManagmentServlet() {
        super();
        
    }
    ManagmentHelperClass manag=new ManagmentHelperClass();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("command");
		switch(action)
		{
		case "AddSpaceCat":
			AddSpaceCategory(request,response);
			break;
			
		case "AddSpaceID":
			AddSpaceID(request,response);	
			break;
			
		case "Load":
			DisplayCategory(request,response);	
			break;
			
		case "Update":
			UpdateSpaceCategory(request,response);
			break;
			
		case "filter":
			FilterBookings(request,response);
			break;
			
		case "Cancel":
			CancelBooking(request,response);
			break;
			
		case "RemoveSpace":
			RemoveSpace(request,response);
			break;
			
		case "DeleteSpace":
			DeleteSpace(request,response);
			break;
		}
	}

	private void DeleteSpace(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id=request.getParameter("spaceID");
		String status=request.getParameter("spaceStatus");
		if(status.equals("Booked"))
		{
			response.sendRedirect("RemoveSpaceError.jsp");
		}
		else
		{
		if(manag.RemoveSpace(id))
		{
			response.sendRedirect("RemoveSuccess.jsp");
		}
		else
		{
			response.sendRedirect("login-error.jsp");
		}
		}
		
	}
	private void RemoveSpace(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cat=request.getParameter("cat");
		List<BookinStatus> list=manag.ShowVacantSpaces(cat);
		request.setAttribute("spaces", list);
		RequestDispatcher dispatcher=request.getRequestDispatcher("RemoveSpaces.jsp");
		dispatcher.forward(request, response);
		
	}
	private void CancelBooking(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id=request.getParameter("spaceID");
		if(manag.CancelBooking(id))
		{
			System.out.println("Booking Cancelled Successfully");
			response.sendRedirect("DisplayBooking.jsp");
		}
		
	}
	private void FilterBookings(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cat=request.getParameter("cat");
		String from=request.getParameter("date");
		String to=request.getParameter("date2");
		try {
			List<BookinStatus> list=manag.FilterBooking(cat,from,to);
			request.setAttribute("Result", list);
			request.setAttribute("from", from);
			request.setAttribute("to", to);
			RequestDispatcher dispatch=request.getRequestDispatcher("DisplayFilteredResult.jsp");
			dispatch.forward(request, response);
		} catch (ParseException e) {
			System.out.println(e);
		}
	}
	private void UpdateSpaceCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String cat=request.getParameter("category");
		String area=request.getParameter("area");
		String duration=request.getParameter("duration");
		String rent_type=request.getParameter("rent_type");
		int cost=Integer.parseInt(request.getParameter("cost"));
		Spaces space=new Spaces(cat,area,duration,rent_type,cost);
		
		
		if(manag.UpdateCategory(space))
		{
			response.sendRedirect("SpaceUpdateSuccess.jsp");
		}
		else
		{
			response.sendRedirect("Login-error.jsp");
		}
		
	}
	private void DisplayCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cat=request.getParameter("spaceCat");
		Spaces space=manag.PrintCat(cat);
		request.setAttribute("category", space);
		RequestDispatcher dispatcher=request.getRequestDispatcher("UpdateSpaceCategory.jsp");
		dispatcher.forward(request, response);
	}
	private void AddSpaceID(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id=request.getParameter("space_id");
		String floor=request.getParameter("floor");
		String cat=request.getParameter("space");
		
		if(manag.AddSpaceId(cat,id,floor))
		{
			response.sendRedirect("SuccessAdd.jsp");
		}
		else
		{
			response.sendRedirect("Login-error.jsp");
		}
		
	}

	private void AddSpaceCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String space_cat=request.getParameter("space_id");
		String area=request.getParameter("area");
		String duration=request.getParameter("duration");
		String type=request.getParameter("renttype");
		int cost=Integer.parseInt(request.getParameter("cost"));
		Spaces space=new Spaces(space_cat,area,duration,type,cost);
		if(manag.AddSpaceCategory(space))
		{
			response.sendRedirect("AddSpace2.jsp");
		}
		else
		{
			response.sendRedirect("Login-error.jsp");
		}
	}

}
