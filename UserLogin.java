package com.Dao;

import java.sql.*;



public class UserLogin {

   
	public boolean check(String uname, String pass)
	{
		String sql="select * from login where uname=? and pass=?" ;
	try
	{
		  Class.forName("com.mysql.jdbc.Driver");
	      Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
		  PreparedStatement s=c.prepareStatement(sql);
		  s.setString(1, uname);
		  s.setString(2,pass);
		  ResultSet rs= s.executeQuery();
		  while(rs.next())
		  {
			  return true;
		  }
	}catch(Exception e)
	{
		System.out.println(e);
		return false;
	}
         return false;
	}
	

public boolean checkUser(String uname, String pass)
{
	String sql="Insert into myproject.login values(?,?)";
try
{
	 Class.forName("com.mysql.jdbc.Driver");
     Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject"+"?useSSl=false","root","Superkings@123");
	 PreparedStatement s=c.prepareStatement(sql);
	  s.setString(1, uname);
	  s.setString(2, pass);
	  s.executeUpdate();
		  return true;
	  
}catch(SQLIntegrityConstraintViolationException e)
{
	System.out.println(e);
	return false;
}catch(Exception e)
{
	System.out.println(e);
	return false;
}
}
}
