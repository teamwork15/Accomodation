<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>
        Halls Officer LOGIN
    </title>
        <style>
            body{
              border:4px doubleblue;  
              background-color: buttonshadow;
            }  
            h1{
                color:red;
               font-style: italic;
            }
             </style>
    </head>
    <body>
        <h1>Provide Your  OfficerID and Password:</h1>
        <p></p>
        <p></p>
        <p></p>
        <form style="padding: 5px; font-style: italic;font-size: 200%;
              color:red;" action="hallsdbconn.jsp">
           
          OfficerID: <input type="text" name="officerid" style="border:3px double blanchedalmond;
                             font-size: 125%;"/><p></p>
           Password: <input type="password" name="password" style="border:3px double blanchedalmond;
                            font-size: 125%;"/>
       <p></p>
        <input type="submit" value="OK" name="OK" style="color: blue;font-size: 125%;"/>
           <input type="reset" value="CANCEL" name="CANCEL" style="color: blue;font-size: 125%;"/>
        </form>
    </body>
</html>
