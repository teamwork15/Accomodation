<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FIRST</title>
    </head>
    <body background="3d-wallpaper-of-Lion_UsKydaq.jpg" >
            <h1 style="font-weight:bold; font-style:italic; color:greenyellow">
           MATTRESS AND EFFECT ALLOCATION SYSTEM. 
        </h1> 
        <p></p>
        <p></p>
        <p></p>
        <p></p>
        <p style="color:red;font-style:italic;font-size:200%;">
            Choose Your Role From the Menu Below:
        </p>
        <p></p>
   
        <form method='POST'>
           ROLE:<select name="role" style="border:3px double black;padding: 5px; font-size:200%;
                    color:blueviolet" onchange="javascript:handleSelect(this)">
                <option value="role"></option>
            <option value="Chief_Halls_Officer">Chief_Halls_Officer</option>
            <option value="Halls_Officer">Halls_Officer</option>
            <option value="Custodian">Custodian</option>
            <option value="StoreKeeper">StoreKeeper</option>
            <option value="Student">Student</option>
                
            </select>
            <<script type="text/javascript">
                function handleSelect(elm)
                {
                    window.location=elm.value+".jsp";
                }
            </script>
            </form>
        </body>
</html>
