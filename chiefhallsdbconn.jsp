<%@page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CHIEF_HALLS CONNECTION</title>
    </head>
    <body>
        <%!
       public class Chief {
     Connection conn=null;
      PreparedStatement pre=null;
      ResultSet res=null;

      String path="jdbc:mysql://localhost:3306/Accomodation";
      String user="root";
      String pass="";
       String dbcid;
      String dbpass;
      String sql="select * from chiefhalls where chiefhallsid=? and password=?";
   
public Chief(){
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
     String chiefID=request.getParameter("chiefid");
     String password=request.getParameter("password");
     
     Chief chf=new Chief();
     ResultSet chief=chf.getValue(chiefID, password);
     
    if(!(chiefID.equals(null)||chiefID.equals(""))&&!(password.equals(null)||password.equals(""))){
      
        if(chf.res.next()){
        chf.dbcid=chf.res.getString("chiefhallsid");
         chf.dbpass=chf.res.getString("password");   
        }
        if(chiefID.equals(chf.dbcid)&&password.equals(chf.dbpass)){
        session.setAttribute("chiefID",chf.dbcid);
        session.setAttribute("password",chf.dbpass);
             response.sendRedirect("Welcomechief.jsp");
        }
        else
        response.sendRedirect("error.jsp");
        chf.pre.close();
        chf.res.close();
        
          }
        else{
        %>
        <p style="color: red"> Empty Fields!</p>
        <%
            getServletContext().getRequestDispatcher("/Chief_Halls_Officer.jsp").include(request, response);
}%>
    </body>
</html>