<%-- 
    Document   : search
    Created on : Apr 5, 2012, 9:04:01 PM
    Author     : Sai Srinivas
--%>

<%@page import="java.util.List"%>
<%@page import= "data.User" %>

<html>
    <head>
        <title>Search and add friends</title>
    </head>

    <body>
        <div id="header" style="background-color:GoldenRod;">
            <p style="text-align:center; font-size:24"> 
                Search Results 
            </p>
        </div>

        <div style="float:right;">
            <form action="search.do">
                <input type="text" name="searchTerm" />
                <input type="submit" value="Search">
            </form>
        </div>
        <br>
        <br>
        <div style="float:right;">
            <form action="home.do">
                <input type="submit" value="Home">
            </form>
        </div>

        <div id="result" >
            <%
                List<String> errors = (List<String>) request.getAttribute("errors");
                if (errors != null) {
                    for (String error : errors) {
            %>        
            <h3 style="color:red"> <%= error%> </h3>
            <%
                }
            } else {
                User[] searchResults = (User[]) request.getAttribute("searchResults");
                for (int i = 0; i < searchResults.length; i++) {
            %>
            <h3 style="color:red"></h3>
            <br>
            <%=searchResults[i].getFirstName()%> <%=searchResults[i].getLastName()%> (<%=searchResults[i].getUserName()%>)
            <form action="addFriend.do">
                <input type="hidden" name="friend" value="<%=searchResults[i].getUserName()%>"/>
                <input type="submit" value="Add friend"/>
            </form>
            <%
                    }
                }
            %>
            <br>	
            <br>
            <br>

        </div>

    </body>
</html>
