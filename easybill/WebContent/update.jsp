<%-- 
    Document   : update
    Created on : Apr 5, 2012, 9:15:31 PM
    Author     : Sai Srinivas
--%>

<html>

    <head>
        <title>Profile Update</title>
    </head>

    <body>
        <div id="header" style="background-color:GoldenRod">
            <p style="text-align:center; font-size:24"> 
                Update Profile 
            </p>
        </div>
        <br>
        <br>
        <div>
            <form action = "update.do" method = "POST" enctype="multipart/form-data">
                <br/>
                <br/>
                <b> First Name</b> : <input type="text" name="firstName" value="${updateForm.getFirstName()}"/><br/><br/>
                <b> Last Name</b> : <input type="text" name="lastName" value="${updateForm.getLastName()}"/><br/><br/>
                <b> Password</b> : <input type="text" name="password" value=""/><br/><br/>
                <input type="submit" name="profileUpdate" value="Update">
            </form>
        </div>

    </body>

</html>

