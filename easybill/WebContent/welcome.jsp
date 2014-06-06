<%-- 
    Document   : welcome
    Created on : Mar 31, 2012, 6:11:45 PM
    Author     : Sai Srinivas
--%>

<%@page import="data.User"%>
<%@page import="java.util.List"%>

<html>

    <head>
        <title>Welcome to EasyBill. Login page</title>
    </head>

    <body>
        <div id="header" style="background-color:GoldenRod;">
            <p style="text-align:center; font-size:24"> 
                Welcome to EasyBill 
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

        <div id="Login"
             style="float: right;">
            <form action="login.do" method="POST">
                <fieldset>
                    <legend>Login information:</legend>
                    <b>User Name</b> : <br>
                    <input type="text" name="userName" value="${form.getUserName()}" /><br><br>
                    <b>Password</b> : <br>
                    <input type="password" name="password" /><br><br> 
                    <input type="submit" name="action" value="Login"><br><br>
                    New to EasyBill? <a href="register.do"> Click Here</a>
                </fieldset>
            </form>
        </div>
    </body>
</html>

