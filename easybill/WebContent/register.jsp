<%-- 
    Document   : welcome
    Created on : Mar 31, 2012, 6:11:45 PM
    Author     : Sai Srinivas
--%>

<%@page import="java.util.List"%>
<html>

    <head>
        <title>Welcome to EasyBill. Register page</title>
    </head>

    <body>
        <div id="header" style="background-color:GoldenRod;">
            <p style="text-align:center; font-size:24"> 
                Just a few steps away from becoming a member!!!
            </p>
        </div>
        <%
            List<String> errors = (List<String>) request.getAttribute("errors");
            if (errors != null) {
                for (String error : errors) {
        %>        
        <h3 style="color:red"> <%= error%> </h3>
        <%
                }
            }
        %>    

        <div id="Register"
             style="float: right;">
            <form action="register.do" method="POST">
                <fieldset>
                    <legend>New User information:</legend>
                    <b>First Name</b> : <br>
                    <input type="text" name="firstName" value="${registerform.getFirstName()}" /><br><br>
                    <b>Last Name</b> : <br>
                    <input type="text" name="lastName" value="${registerform.getLastName()}" /><br><br>
                    <b>User Name</b> : <br>
                    <input type="text" name="userName" value="" /><br><br>
                    <b>Password</b> : <br>
                    <input type="password" name="password" /><br><br> 
                    <input type="submit" name="action" value="Register"/><br><br>
                </fieldset>
            </form>
        </div>
    </body>
</html>

