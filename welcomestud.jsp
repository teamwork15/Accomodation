<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WELCOME STUDENT</title>
    </head>
    <body background="matress.jpg">
        <h1>Welcome Student</h1>
        <p style="color: red;font-size: 150%;font-style: italic;">Upload Bank Statement</p>
        <p></p>
        <form method="POST" enctype="multipart/form-data" action="{pageContext.request.
              contextPath}/Uploader/halls.jsp"> 
            <input type="file" name="file" value="select image..." width="100" style="color: blue;font-size: 125%;
                   border-image-width: 2;padding: 5px;" /> 
            <p></p>
           <p></p>
          REGNO:<input type="text" name="regno" value="" style="font-size: 100%;" />
          <p></p>
          <p></p>
          <input type="submit" value="SEND" name="SEND" style="color: blue;font-size: 125%;"/>
           <input type="reset" value="CANCEL" name="CANCEL" style="color: blue;font-size: 125%;"/>
        </form>
    </body>
</html>
