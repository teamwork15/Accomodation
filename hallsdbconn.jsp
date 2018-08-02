<%@page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HALLS CONNECTION</title>
    </head>
    <body>
        <%!
       public class Halls {
     Connection conn=null;
      PreparedStatement pre=null;
      ResultSet res=null;

      String path="jdbc:mysql://localhost:3306/Accomodation";
      String user="root";
      String pass="";
       String dbcid;
      String dbpass;
      String sql="select * from halls where hallsid=? and password=?";
   
public Halls(){
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
     String officerID=request.getParameter("officerid");
     String password=request.getParameter("password");
     
     Halls hall=new Halls();
     ResultSet halls=hall.getValue(officerID,password);
     
    if(!(officerID.equals(null)||officerID.equals(""))&&!(password.equals(null)||password.equals(""))){
      
        if(hall.res.next()){
        hall.dbcid=hall.res.getString("hallsid");
         hall.dbpass=hall.res.getString("password");   
        }
        if(officerID.equals(hall.dbcid)&&password.equals(hall.dbpass)){
        session.setAttribute("officerID",hall.dbcid);
        session.setAttribute("password",hall.dbpass);
             response.sendRedirect("Welcomehalls.jsp");
        }
        else
        response.sendRedirect("error.jsp");
        hall.pre.close();
        hall.res.close();
        
          }
        else{
        %>
        <p style="color: red"> Empty Fields!</p>
        <%
            getServletContext().getRequestDispatcher("/Halls_Officer.jsp").include(request, response);
}%>
    </body>
</html>