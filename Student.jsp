<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>
        STUDENT LOGIN
    </title>
        <style>
            body{
              border:4px doubleblue; 
              background-color: greenyellow;
            }  
            h1{
                color:red;
       font-style: italic;
            }
             </style>
    </head>
    <body>
        <h1>Provide Your Registration Number and Password:</h1>
        <p></p>
        <p></p>
        <p></p>
        <form style="padding: 5px; font-style: italic;font-size: 200%;
              color:red;" action="studbconn.jsp">
           
          RegNumber: <input type="text" name="regno" style="border:3px double blanchedalmond;
                             font-size: 125%;"/><p></p>
           Password: <input type="password" name="pass" style="border:3px double blanchedalmond;
                            font-size: 125%;"/><p></p>
           <input type="submit" value="OK" name="OK" style="color: blue;font-size: 125%;"/>
           <input type="reset" value="CANCEL" name="CANCEL" style="color: blue;font-size: 125%;"/>
        </form>
    </body>
</html>
