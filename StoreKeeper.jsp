<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>
        StoreKeeper LOGIN
    </title>
        <style>
            body{
              border:4px doubleblue;  
              background-color:burlywood;
            }  
            h1{
                color:red;
               font-style: italic;
            }
             </style>
    </head>
    <body background="color:greenyellow ">
        <h1>Provide Your  StoreKeeperID and Password:</h1>
        <p></p>
        <p></p>
        <p></p>
        <form style="padding: 5px; font-style: italic;font-size: 200%;
              color:red;" action="storekeeperdbconn.jsp">
           
          KeeperID: <input type="text" name="keeper" style="border:3px double blanchedalmond;
                             font-size: 125%;"/><p></p>
           Password: <input type="password" name="password" style="border:3px double blanchedalmond;
                            font-size: 125%;"/>
       <p></p>
        <input type="submit" value="OK" name="OK" style="color: blue;font-size: 125%;"/>
           <input type="reset" value="CANCEL" name="CANCEL" style="color: blue;font-size: 125%;"/>
        </form>
    </body>
</html>
