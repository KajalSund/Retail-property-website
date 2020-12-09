package com.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;

import com.Book.BookinStatus;
import com.Book.Spaces;

public class ManagmentHelperClass {

	Connection c=null;
	PreparedStatement s=null,s2=null;
	ResultSet rs=null;
	public List<String> getCategory()
	{
		
		List<String> list=new ArrayList<String>();
		try
		{
			String sql="select * from space";
			 Class.forName("com.mysql.jdbc.Driver");
			 c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
		     s=c.prepareStatement(sql);
		     rs=s.executeQuery();
		     while(rs.next())
		     {
		    	 String cat=rs.getString(1);
		    	 list.add(cat);
		     }
			return list;
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
		finally
		{
			close(c,s,rs);
		}
		
	}

	public boolean AddSpaceCategory(Spaces space) {
		Connection c=null;
		PreparedStatement s2=null;
		ResultSet rs=null;
		try
		{
              String sql2="Insert into space values(?,?,?,?,?)";
              Class.forName("com.mysql.jdbc.Driver");
		      c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
		      s2=c.prepareStatement(sql2);
		      s2.setString(1,space.getSpace() );
		      s2.setString(2,space.getArea() );
		      s2.setString(3,space.getDuration() );
		      s2.setString(4,space.getRent_type() );
		      s2.setInt(5,space.getCost() );
		      System.out.println("yaha bhi aa raha he");
			  s2.executeUpdate();
                 return true;
		}catch(Exception e)
		{
			System.out.println("abe kya he");
			return false;
		}
		finally
		{
			close(c,s,rs);
		}
	}
	
	

	private void close(Connection c, PreparedStatement s, ResultSet rs) {
		try
		{
			if(rs!=null)
				rs.close();
			
			if(s != null)
				s.close();
			
			if(c != null)
				c.close();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

	public boolean AddSpaceId(String cat, String id, String floor) {
		
		Connection c=null;
		PreparedStatement s=null,s2=null;
		ResultSet rs=null;
		try
		{
              String sql="Insert into bookingstatus(cat,space_id,Floor) values(?,?,?)";
              Class.forName("com.mysql.jdbc.Driver");
		      c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
		      s=c.prepareStatement(sql);
		      s.setString(1,cat);
		      s.setString(2, id);
		      s.setString(3, floor);
			  s.executeUpdate();
                 return true;
		}catch(Exception e)
		{
			System.out.println(e);
			return false;
		}
		finally
		{
			close(c,s,rs);
		}
		
	}

	public List<Spaces> PrintCategory()
	{
		
		Connection c=null;
		PreparedStatement s=null;
		ResultSet rs=null;
		List<Spaces> list=new ArrayList<Spaces>();
		String sql="select * from space" ;
		try
		{
			  Class.forName("com.mysql.jdbc.Driver");
		      c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
			  s=c.prepareStatement(sql);
			  rs= s.executeQuery();
			  while(rs.next())
			  {
				  String s21=rs.getString("Area");
				  String s1=rs.getString("Space_type");
				  String s3=rs.getString("duration");
				  String s4=rs.getString("rent_type");
				  int num=rs.getInt("cost");
				  Spaces sp=new Spaces(s1,s21,s3,s4,num);
				  list.add(sp);
			  }
			  
		}catch(Exception e)
		{
			System.out.println(e);
			
		}finally
		{
			close(c,s,rs);
		}
		return list;
	}

	
	public Spaces PrintCat(String cat) {
		Spaces space=null;
		Connection c=null;
		PreparedStatement s=null;
		ResultSet rs=null;
		
	
		try
		{
			  String sql="select * from space where space_type=?" ;
			  Class.forName("com.mysql.jdbc.Driver");
		      c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
			  s=c.prepareStatement(sql);
			  s.setNString(1, cat);
			  rs= s.executeQuery();
			  while(rs.next())
			  {
				  String s21=rs.getString("Area");
				  String s1=rs.getString("Space_type");
				  String s3=rs.getString("duration");
				  String s4=rs.getString("rent_type");
				  int num=rs.getInt("cost");
				  space=new Spaces(s1,s21,s3,s4,num);
			  }
			  return space;
			  
		}catch(Exception e)
		{
			System.out.println(e);
			
		}finally
		{
			close(c,s,rs);
		}
		return space;
	}

	public boolean UpdateCategory(Spaces space) {
		Connection c=null;
		PreparedStatement s2=null;
		ResultSet rs=null;
		
		try
		{
              String sql="update space set Area=?,duration=?,rent_type=?,cost=? where space_type=? ";
              Class.forName("com.mysql.jdbc.Driver");
		      c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
		      s2=c.prepareStatement(sql);
		      s2.setString(1,space.getArea() );
		      s2.setString(2,space.getDuration() );
		      s2.setString(3,space.getRent_type() );
		      s2.setInt(4,space.getCost() );
		      s2.setString(5, space.getSpace());
			  s2.executeUpdate();
                 return true;
		}catch(Exception e)
		{
			System.out.println(e);
			return false;
		}
		finally
		{
			close(c,s2,rs);
		}
		
	}
	
	
	public List<BookinStatus> DisplayBookings()
	{
		Connection c=null;
		PreparedStatement s=null;
		ResultSet rs=null;
		List<BookinStatus> list=new ArrayList<BookinStatus>();
		try
		{
			 String sql="select * from payments as pay inner join bookingstatus as bs ON pay.space_id=bs.space_id and bs.bookingstatus='Booked'";
		      c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
		      s= c.prepareStatement(sql);
		      rs=s.executeQuery();
		      while(rs.next())
		      {
		    	  String cat=rs.getString("bs.cat");
		    	  String space_id=rs.getString("bs.space_id");
		    	  String status=rs.getString("bs.bookingstatus");
		    	  String uname=rs.getString("pay.uname");
		    	  String floor=rs.getString("bs.Floor");
		    	  Date from=rs.getDate("bs.from");
		    	  Date to=rs.getDate("bs.to");
		    	  int payment=rs.getInt("pay.payment");
		    	  BookinStatus booking=new BookinStatus(cat,space_id,status,floor,from,to,uname,payment);
		    	  list.add(booking);
		      }
			return list;
		}catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}finally
		{
			close(c,s,rs);
		}
	}

	
	
	public List<BookinStatus> FilterBooking(String cat2, String from, String to) throws ParseException {
		List<BookinStatus> list=new ArrayList<BookinStatus>();
		String sql;
		if(from.isEmpty() || to.isEmpty())
		{
			sql="select * from payments as pay inner join bookingstatus as bs ON pay.space_id=bs.space_id and bs.bookingstatus='Booked' and bs.cat='"+cat2+"'";
		}
		else if (cat2.equals("none"))
		{
			 SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		      Date parsed = format.parse(from);
		      Date parsed2 = format.parse(to);
		      java.sql.Date sqlfrom = new java.sql.Date(parsed.getTime());
		      java.sql.Date sqlto = new java.sql.Date(parsed2.getTime());
			  sql="select * from payments as pay inner join bookingstatus as bs ON pay.space_id=bs.space_id and bs.bookingstatus='Booked' "
					+ "and `from` <= '"+sqlto+"' and `to` >= '"+sqlfrom+"'";
		}
		else
		{
			SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		      Date parsed = format.parse(from);
		      Date parsed2 = format.parse(to);
		      java.sql.Date sqlfrom = new java.sql.Date(parsed.getTime());
		      java.sql.Date sqlto = new java.sql.Date(parsed2.getTime());
			 sql="select * from payments as pay inner join bookingstatus as bs ON pay.space_id=bs.space_id and bs.bookingstatus='Booked' "
					+ "and `from` <= '"+sqlto+"' and `to` >= '"+sqlfrom+"' and bs.cat='"+cat2+"'";
		}
		
		try
		{
			  Class.forName("com.mysql.jdbc.Driver");
			  Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
		      PreparedStatement s= c.prepareStatement(sql);
		      ResultSet rs=s.executeQuery();
		      while(rs.next())
		      {
		    	  String category=rs.getString("bs.cat");
		    	  String space_id=rs.getString("bs.space_id");
		    	  String status=rs.getString("bs.bookingstatus");
		    	  String uname=rs.getString("pay.uname");
		    	  String floor=rs.getString("bs.Floor");
		    	  Date from2=rs.getDate("bs.from");
		    	  Date to2=rs.getDate("bs.to");
		    	  int payment=rs.getInt("pay.payment");
		    	  BookinStatus booking=new BookinStatus(category,space_id,status,floor,from2,to2,uname,payment);
		    	  list.add(booking);
		      }
			return list;
			
		}catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}finally
		{
			close(c,s,rs);
		}
		
	}

	public boolean CancelBooking(String id) {
		Connection c=null;
		PreparedStatement s=null;
		ResultSet rs=null;
		
		try
		{
			String sql="UPDATE bookingstatus SET `from`=NULL ,`to`=NULL , `bookingstatus`='Available' where `space_id`=? ";
			 Class.forName("com.mysql.jdbc.Driver");
			 c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
		     s= c.prepareStatement(sql);
		     s.setString(1, id);
		     s.executeUpdate();
		     Statement s2=c.createStatement();
		     s2.executeUpdate("Delete from payments where space_id='"+id+"'");
		     return true;
			
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}finally
		{
			close(c,s,rs);
		}
		
	}

	public List<BookinStatus> ShowVacantSpaces(String cat) {
		Connection c=null;
		PreparedStatement s=null;
		ResultSet rs=null;
		List<BookinStatus> l=new ArrayList<>();
		String sql=" select * from bookingstatus where cat=?";
		
		try
		{
			
			 Class.forName("com.mysql.jdbc.Driver");
			 c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
		     s= c.prepareStatement(sql);
		     s.setString(1, cat);
		     rs=s.executeQuery();
		    while(rs.next())
		    {
		    	
		    	String status=rs.getString("bookingstatus");
		    	String floor=rs.getString("Floor");
		    	String id=rs.getString("space_id");
		    	BookinStatus book=new BookinStatus(cat,id,status,floor);
		    	l.add(book);
		    }
			
		}catch(Exception e)
		{
			e.printStackTrace();
			
		}finally
		{
			close(c,s,rs);
		}
		return l;
		
	}

	public boolean RemoveSpace(String id) {
		Connection c=null;
		PreparedStatement s=null;
		ResultSet rs=null;
		
		String sql="delete from bookingstatus where space_id=? ";
		try
		{
			 Class.forName("com.mysql.jdbc.Driver");
			 c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
		     s= c.prepareStatement(sql);
		     s.setString(1, id);
		     s.executeUpdate();
		     return true;
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
		finally
		{
			close(c,s,rs);
		}
		
		
	}

	

}
