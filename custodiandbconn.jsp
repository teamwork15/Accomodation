<%@page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CUSTODIAN CONNECTION</title>
    </head>
    <body>
        <%!
       public class Custodian {
     Connection conn=null;
      PreparedStatement pre=null;
      ResultSet res=null;

      String path="jdbc:mysql://localhost:3306/Accomodation";
      String user="root";
      String pass="";
       String dbcid;
      String dbpass;
      String sql="select * from custodian where custodianid=? and password=?";
   
public Custodian(){
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
     String custID=request.getParameter("custodianid");
     String password=request.getParameter("password");
     
     Custodian cust=new Custodian();
     ResultSet custodian=cust.getValue(custID,password);
     
    if(!(custID.equals(null)||custID.equals(""))&&!(password.equals(null)||password.equals(""))){
      
        if(cust.res.next()){
        cust.dbcid=cust.res.getString("custodianid");
         cust.dbpass=cust.res.getString("password");   
        }
        if(custID.equals(cust.dbcid)&&password.equals(cust.dbpass)){
        session.setAttribute("custID",cust.dbcid);
        session.setAttribute("password",cust.dbpass);
             response.sendRedirect("Welcomecust.jsp");
        }
        else
        response.sendRedirect("error.jsp");
        cust.pre.close();
        cust.res.close();
        
          }
        else{
        %>
        <p style="color: red"> Empty Fields!</p>
        <%
            getServletContext().getRequestDispatcher("/Custodian.jsp").include(request, response);
}%>
    </body>
</html>
