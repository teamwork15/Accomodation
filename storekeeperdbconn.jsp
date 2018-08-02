<%@page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>STORE CONNECTION</title>
    </head>
    <body>
         <%!
       public class Storekeeper {
     Connection conn=null;
      PreparedStatement pre=null;
      ResultSet res=null;

      String path="jdbc:mysql://localhost:3306/Accomodation";
      String user="root";
      String pass="";
       String dbcid;
      String dbpass;
      String sql="select * from store where storeKeeperid=? and password=?";
   
public Storekeeper(){
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
     String storeID=request.getParameter("keeper");
     String password=request.getParameter("password");
     
     Storekeeper stk=new Storekeeper();
      ResultSet stks=stk.getValue(storeID, password);
     
    if(!(storeID.equals(null)||storeID.equals(""))&&!(password.equals(null)||password.equals(""))){
      
        if(stk.res.next()){
        stk.dbcid=stk.res.getString("storeKeeperid");
         stk.dbpass=stk.res.getString("password");   
        }
        if(storeID.equals(stk.dbcid)&&password.equals(stk.dbpass)){
            session.setAttribute("storeID",stk.dbcid);
            session.setAttribute("password",stk.dbpass);
             response.sendRedirect("welcomestore.jsp");
        }
        else
        response.sendRedirect("error.jsp");
        stk.pre.close();
        stk.res.close();
          }
        else{
        %>
        <p style="color: red"> Empty Fields!</p>
        <%
            getServletContext().getRequestDispatcher("/StoreKeeper.jsp").include(request, response);
}%>
    </body>
</html>