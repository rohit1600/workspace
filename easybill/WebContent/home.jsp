<%-- 
    Document   : home
    Created on : Mar 31, 2012, 6:55:46 PM
    Author     : Sai Srinivas
--%>

<%@page import="java.util.List"%>
<%@page import= "data.User" %>
<%@page import= "data.RecentTransactions" %>

<html>

    <head>
        <title>EasyBill Home</title>
    </head>

    <body>
        <%
            if ((session.getAttribute("user")) == null) {
        %>
        <h2 style="color:red"> You are not logged in </h2>
        Click <a href="welcome.jsp">here</a> to login.
        <%} else {
            User user = ((User) session.getAttribute("user"));
        %> 
        <div id="header" style="background-color:GoldenRod;">
            <p style="text-align:center; font-size:24"> 
                Welcome <font color="blue">
                <%=user.getFirstName()%> <%=user.getLastName()%>
                </font>
            </p>
        </div>

        <div id="Manage Profile" style="float:left; width:20%">
            <fieldset>
                <legend>Manage Profile</legend>
                <a href="update.jsp">Update Profile</a> <br>
                <a href="logout.do">Logout</a> 
            </fieldset>
        </div>
        <br>

        <div id="Your Finances" align="center" style="float:center; width: 80%">
            <font size="4" face="Cambria">
            You need to collect: 
            </font>
            <font size="4" face="Cambria" color="blue">
            <b>$ <%=user.getMCollect()%></b>
            </font>
            <br>
            <font size="4" face="Cambria">
            You need to return: 
            </font>
            <font size="4" face="Cambria" color="red">
            <b>$ <%=user.getMReturn()%></b>
            </font>
            <br>
        </div>
        <br>
        <br>
        <br>

        <div id="Manage Money" style="float:left; width:20%">
            <fieldset>
                <legend>Manage Money</legend>
                <a href="reportBill.do">Report Bill</a>
                <br>
                <a href="reportPayment.do">Report Payment</a>
                <br>
                <a href="history.do">History</a>
            </fieldset>
        </div>

        <div id="Your Finances" align="center" style="float:center; width: 80%">
            <table border="1">
                <caption>
                    <b>
                        <font size="5" face="Cambria" align="center">
                        Your Finances
                        </font>
                    </b>
                </caption>
                <tr>
                    <th>Friend</th>
                    <th>Owes You</th>
                    <th>You Owe</th>
                </tr>
                <tr>
                    <td>
                        <font size="4" face="Cambria" align="center">
                        Rohit Rajagopal
                        </font>
                    </td>
                    <td>
                        <font size="4" face="Cambria" align="center">
                        $100
                        </font>
                    </td>
                    <td>
                        <font size="4" face="Cambria" align="center">
                        $100
                        </font>
                    </td>
                </tr>
                <tr>
                    <td>
                        <font size="4" face="Cambria" align="center">
                        Abhijeeth Nuthan
                        </font>
                    </td>
                    <td>
                        <font size="4" face="Cambria" align="center">
                        $50
                        </font>
                    </td>
                    <td>
                        <font size="4" face="Cambria" align="center">
                        $10
                        </font>
                    </td>
                </tr>
            </table>
        </div>
        <br>

        <div id="Manage_Friends" style="float:left; width:20%">
            <fieldset>
                <legend>Manage Friends</legend>
                <form action="search.do">
                    <input type="text" name="searchTerm"/>
                    <input type="submit" value="Search"/>
                </form>
                <%
                    User[] friendList = (User[]) request.getAttribute("friendList");
                    for (int i = 0; i < friendList.length; i++) {
                %>
                <form action="deleteFriend.do">
                    <%=friendList[i].getFirstName()%> <%=friendList[i].getLastName()%> 
                    <input type="hidden" name="friend" value="<%= friendList[i].getUserName()%>"/>
                    <input type="submit" value="Unfriend"/>
                </form>
                <%
                    }
                %>
            </fieldset>
        </div>
        <br>
        <br>

        <div id="Recent Transactions" align="center" style="float:center; width: 80%">
            <%
                RecentTransactions[] recentTransactions = (RecentTransactions[]) request.getAttribute("recentTransactions");
                if (recentTransactions.length == 0) {
            %>
            <b>
                <font size="5" face="Cambria" align="center">
                Recent Transactions
                </font>
            </b>
            <br>
            <font size="4" color ="Red" face="Cambria" align="center">
            No bills reported yet!
            </font>
            <%            } else {
            %>
            <table border="1">
                <caption>
                    <b>
                        <font size="5" face="Cambria" align="center">
                        Recent Transactions
                        </font>
                    </b>
                </caption>
                <tr>
                    <th>Date</th>
                    <th>Description</th>
                    <th>Who paid</th>
                    <th>Who participated</th>
                    <th>Your Share</th>
                    <th>Total</th>
                </tr>
                <%
                    for (int i = 0; i < recentTransactions.length; i++) {
                %>
                <tr>
                    <td>
                        <font size="4" face="Cambria" align="center">
                        <%=recentTransactions[i].getDate()%>
                        </font>
                    </td>
                    <td>
                        <font size="4" face="Cambria" align="center">
                        <%=recentTransactions[i].getDescription()%>
                        </font>
                    </td>
                    <td>
                        <font size="4" face="Cambria" align="center">
                        <%=recentTransactions[i].getWhoPaid()%>
                        <br>
                        </font>
                    </td>
                    <td>
                        <%
                            List<String> names = (List<String>) recentTransactions[i].getWhoParticipated();
                            for (String name : names) {
                        %>
                        <font size="4" face="Cambria" align="center">
                        <%=name%>
                        <br>
                        </font>
                        <%
                            }
                        %>
                    </td>
                    <td>
                        <font size="4" face="Cambria" align="center">
                        $<%=recentTransactions[i].getYourShare()%>
                        </font>
                    </td>
                    <td>
                        <font size="4" face="Cambria" align="center">
                        $<%=recentTransactions[i].getTotal()%>
                        </font>
                    </td>
                </tr>
                <%
                        }
                    }
                %>

            </table>
        </div>
        <%
            }
        %>
    </body>
</html>