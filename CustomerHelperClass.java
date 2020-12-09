package com.Dao;

import com.Book.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.RequestDispatcher;

public class CustomerHelperClass {
	
	public List<Spaces> Booking(){
		Connection c=null;
		PreparedStatement s=null;
		ResultSet rs=null;
		
		String sql="select * from space" ;
		ArrayList<Spaces> list=new ArrayList<Spaces>();
		try
		{
			  Class.forName("com.mysql.jdbc.Driver");
		      c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
			  s=c.prepareStatement(sql);
			  rs= s.executeQuery();
			  while(rs.next())
			  {
				  String s2=rs.getString("Area");
				  String s1=rs.getString("Space_type");
				  String s3=rs.getString("duration");
				  String s4=rs.getString("rent_type");
				  int num=rs.getInt("cost");
				  Spaces sp=new Spaces(s1,s2,s3,s4,num);
				  list.add(sp);
			  }
			  return list;
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
			
		}finally
		{
			close(c,s,rs);
		}
		
}
	
	public List<String> CategoryPrint()
	{
		Connection c=null;
		PreparedStatement s=null;
		ResultSet rs=null;
		String sql="select space_type from space" ;
		ArrayList<String> list=new ArrayList<String>();
		try
		{
			  Class.forName("com.mysql.jdbc.Driver");
		      c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
			  s=c.prepareStatement(sql);
			  rs= s.executeQuery();
			  while(rs.next())
			  {
				  String str=rs.getString("space_type");
				  list.add(str);
			  }
			  
			  return list;
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
			
		}finally
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

	public boolean CheckUser(String uname) {
		String sql="select * from userdetails where uname=?";
		try
		{
		      Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
		      java.sql.PreparedStatement s=c.prepareStatement(sql);
		      s.setString(1,uname);
			  ResultSet rs= s.executeQuery();
			  while(rs.next())
			  {
				  return false;
			  }
			 
		}catch(Exception e)
		{
			System.out.println(e);
			return false;
		}
		return true;
	}

	public boolean InsertUser(UserType u) {
		String sql="Insert into myproject.userdetails values(?,?,?,?,?,?,?,?)";
		try
		{
		      Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
			  java.sql.PreparedStatement s=c.prepareStatement(sql);
			  s.setString(1,u.getUname());
			  s.setString(2,u.getName());
			  s.setString(3,u.getEmail());
			  s.setString(4,u.getTel());
			  s.setString(5,u.getAdress());
			  s.setString(6,u.getProf());
			  s.setString(7,u.getGender());
			  s.setString(7,u.getDob());
			  s.executeUpdate();
			 return true;
		}catch(Exception e)
		{
			System.out.println(e);
			return false;
		}
	}

	public ArrayList<BookinStatus> Printstatus(String space) {
		Connection c=null;
		PreparedStatement s=null;
		ResultSet rs=null;
		
		ArrayList<BookinStatus> l=new ArrayList<>();
		String sql="select * from bookingstatus where cat=?";
		try
		{
			 c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
			 s=c.prepareStatement(sql);
			 s.setString(1, space);
			 rs=s.executeQuery();
			 l.clear();
			 while(rs.next())
			 {
				 String cat=rs.getString("cat");
			     String num=rs.getString("space_id");
			     String status=rs.getString("bookingstatus");
			     String floor=rs.getString("floor");
			     java.util.Date from=rs.getDate("from");
			     java.util.Date to=rs.getDate("to");
			     BookinStatus book=new BookinStatus(cat,num,status,floor,from,to);
			     l.add(book);
			 }
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
		}finally
		{
			close(c,s,rs);
		}
		return l;
	}

	public boolean checkBookingStatus(String id) {

		String sql="select * from bookingstatus where space_id=?";
		try
		{
			 Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
			 java.sql.PreparedStatement s=c.prepareStatement(sql);
			 s.setString(1, id);
			 ResultSet rs=s.executeQuery();
			 while(rs.next())
			 {
				 String status=rs.getString("bookingstatus");
				 if(status.equals("Available"))
					 return true;
				 else
					 return false;
			 }
		}catch(Exception e)
		{
			System.out.println(e);
			return false;
		}
		return false;

		
	}

   public int checkDays(String id, long day) {
          
	   String sql="select * from bookingstatus where space_id=?";
		try
		{
			 Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
			 java.sql.PreparedStatement s=c.prepareStatement(sql);
			 s.setString(1, id);
			 ResultSet rs=s.executeQuery();
			 while(rs.next())
			 {
				 String status=rs.getString("cat");
				 String sql1="select cost,rent_type from space where space_type=?";
				 java.sql.PreparedStatement st=c.prepareStatement(sql1);
				 st.setString(1, status);
				 ResultSet result=st.executeQuery();
				 while(result.next())
				 {
					 int cost=result.getInt("cost");
					 String type=result.getString("rent_type");
					 if(type.equals("Weekly Wise"))
					 {
						 if(day%7!=0)
						 {
							 long days=day/7 +1;
							 int cost2=(int)days*cost;
							 return cost2;
						 }
						 else
						 {
							 long days=day/7;
							 int cost2=(int)days*cost;
							 return cost2;
						 }
					 }
					 else
					 {
						 return (int)day*cost;
					 }
					 
				 }
			 }
		}catch(Exception e)
		{
			System.out.println(e);
			
		}
		return -1;
	}

   public UserType UserInfo(String uname)
   {
	   
	   Connection c=null;
	   PreparedStatement s=null;
	   ResultSet rs=null;
	   UserType user = null;
	   
	   String sql="select * from userdetails where uname=?";
	   try
	   {
		   Class.forName("com.mysql.jdbc.Driver");
		   c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
		   s=c.prepareStatement(sql);
		   s.setString(1, uname);
		   rs=s.executeQuery();
		   while(rs.next())
		   {
			    String name=rs.getString("name");
				String email=rs.getString("email");
				String prof=rs.getString("prof");
				String tel=rs.getString("tel");
				String adress=rs.getString("adress");
				String dob=rs.getString("dob");
				user=new UserType(name,email,prof,tel,adress,dob,null,uname);
		   }
		
		   return user;
	   }catch(Exception e)
	   {
		   e.printStackTrace();
	   }
	   finally
		{
			close(c,s,rs);
		}
	return user;
	   
   }

public boolean EditUser(List<String> list) {
	   Connection c=null;
	   PreparedStatement s=null;
	   ResultSet rs=null;
	  
	   String sql="Update `myproject`.`userdetails` set name=?,email=?,tel=?,adress=?,prof=?,dob=? where uname=?";
	   
	   System.out.println(list.get(2));
	   try
	   {
		   Class.forName("com.mysql.jdbc.Driver");
		   c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
		   s=c.prepareStatement(sql);
		   s.setString(1, list.get(1) );
		   s.setString(2, list.get(2) );
		   s.setString(3, list.get(3) );
		   s.setString(4, list.get(5) );
		   s.setString(5, list.get(6) );
		   s.setString(6, list.get(4) );
		   s.setString(7, list.get(0) );
		   s.executeUpdate();
       }catch(Exception e)
	   {
    	   e.printStackTrace();
    	   return false;
	   }
	   finally
		{
			close(c,s,rs);
		}
	   return true;
}

public List<BookinStatus> MyBookings(String uname)
{
	   Connection c=null;
	   PreparedStatement s=null;
	   ResultSet rs=null;
	   List<BookinStatus> list=new ArrayList<>();
	   BookinStatus book=null;
	   String sql="select pay.uname,pay.space_id,bk.cat,bk.from,bk.to from payments as pay inner join bookingstatus as bk ON pay.space_id = bk.space_id and pay.uname=?";
	   
	   try
	   {
		   Class.forName("com.mysql.jdbc.Driver");
		   c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
		   s=c.prepareStatement(sql);
		   s.setString(1,uname);
		   rs=s.executeQuery();
		   while(rs.next())
		   {
			   java.util.Date from=rs.getDate("from");
			   java.util.Date to=rs.getDate("to");
			   String cat=rs.getString("cat");
			   String id=rs.getString("pay.space_id");
			   book=new BookinStatus(cat,id,from,to,uname);
			   list.add(book);
		   }
		   
	   }catch(Exception e)
	   {
		   e.printStackTrace();
		   return null;
	   }
	   finally
		{
			close(c,s,rs);
		}
	   
	return list;
	
}

public boolean MakePayment(String uname, String to, String from, String id, int finalcost) {
	   Connection c=null;
	   PreparedStatement s=null,s2=null;
	   ResultSet rs=null;
	   
	   SimpleDateFormat formats=new SimpleDateFormat("MM/dd/yyyy");
	   
	   try {
			
			Date date1,date2;
				date1=formats.parse(from);
				date2=formats.parse(to);
			
			java.sql.Date newdate2=new java.sql.Date(date2.getTime());
			java.sql.Date newdate1=new java.sql.Date(date1.getTime());
		
			
			String sql="UPDATE bookingstatus SET bookingstatus='Booked',`from`=?,`to`=? where space_id=?";
			String sql1="Insert into payments(uname,space_id,payment) values(?,?,?)";	
			try
			{
				
					 c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
					 s=c.prepareStatement(sql);
					 s2=c.prepareStatement(sql1);
					 s.setDate(1, newdate1);
					 s.setDate(2, newdate2);
					 s.setString(3, id);
					 s2.setString(1, uname);
					 s2.setString(2, id);
					 s2.setInt(3, finalcost);
					 s.executeUpdate();
					 s2.executeUpdate();
					 return true;
					 
			}catch(Exception e)
				{
				     System.out.println(e);
				     return false;
				    
		        }
			}catch(Exception e1)
			{
				e1.printStackTrace();
			}
	return false;

	
}

}
