<%-- 
    Document   : home
    Created on : Mar 31, 2012, 6:55:46 PM
    Author     : Sai Srinivas
--%>

<%@page import="java.util.List"%>
<%@page import="data.RecentTransactions"%>
<html>

    <head>
        <title>All Bills</title>
    </head>

    <body>
        <div id="header" style="background-color:GoldenRod;">
            <p style="text-align:center; font-size:24"> 
                All Bills
            </p>
        </div>
        <div id="yourFinances" align="center" style="float:center;">
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
                    <th>Who Paid</th>
                    <th>Who Participated</th>
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
        <br>
        <br>

        <div id="returnHome" align="center" style="float:center;">
            <form action ="home.do">
                <input type="submit" value="Home"/>
            </form>
        </div>
    </body>
</html>