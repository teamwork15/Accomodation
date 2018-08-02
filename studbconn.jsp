<%@page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>STUDENT CONNECTION</title>
    </head>
    <body>
        <%!
       public class Student {
     Connection conn=null;
      PreparedStatement pre=null;
      ResultSet res=null;

      String path="jdbc:mysql://localhost:3306/Accomodationt";
      String user="root";
      String pass="";
       String dbcid;
      String dbpass;
      String sql="select * from student where regno=? and password=?";
   
public Student(){
    try{
        
     conn=DriverManager.getConnection(path, user, pass);
     pre=conn.prepareCall(sql);
}
catch(SQLException e){
e.printStackTrace();
}
}
  public ResultSet getValue(String val1,String val2){
    try{
    pre.setString(1, val1);
    pre.setString(2, val2);
    res=pre.executeQuery();
}
catch(SQLException e){
e.printStackTrace();
}
return res;
}
}
%>
   <%
     String regno=request.getParameter("regno");
     String password=request.getParameter("pass");
     
     Student std=new Student();
      ResultSet stds=std.getValue(regno, password);
     
    if(!(regno.equals(null)||regno.equals(""))&&!(password.equals(null)||password.equals(""))){
      
        if(std.res.next()){
        std.dbcid=std.res.getString("regno");
         std.dbpass=std.res.getString("password");   
        }
        if(regno.equals(std.dbcid)&&password.equals(std.dbpass)){
        session.setAttribute("regno",std.dbcid);
        session.setAttribute("password",std.dbpass);
             response.sendRedirect("welcomestud.jsp");
        }
        else
        response.sendRedirect("error.jsp");
        std.pre.close();
        std.res.close();
        
          }
        else{
        %>
        <p style="color: red"> Empty Fields!</p>
        <%
            getServletContext().getRequestDispatcher("/Student.jsp").include(request, response);
}%>
    </body>
</html