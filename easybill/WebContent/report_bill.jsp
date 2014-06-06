<%-- 
    Document   : home
    Created on : Mar 31, 2012, 6:55:46 PM
    Author     : Sai Srinivas
--%>

<%@page import="data.RecentTransactions"%>
<%@page import="formbean.ReportBillForm"%>
<%@page import="java.util.List"%>
<%@page import="data.User"%>
<html>

    <head>
        <title>Report Bill</title>
    </head>

    <div id="header" style="background-color:GoldenRod;">
        <p style="text-align:center; font-size:24"> 
            Report Bill
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
    <br>
    <br>

    <%
        Integer preview = (Integer) request.getAttribute("preview");
        System.out.println("Preview Flag:" + preview);
        if (preview == 1) {
    %>
    <div id="Your Finances" align="center" style="float:center;">
        <table border="1">
            <caption>
                <b>
                    <font size="5" face="Cambria" align="center">
                    Preview Bill
                    </font>
                </b>
            </caption>
            <tr>
                <th>Date</th>
                <th>Description</th>
                <th>Who Paid</th>
                <th>Who Participated</th>
                <th>Total</th>
            </tr>
            <%
                RecentTransactions r = (RecentTransactions) request.getAttribute("reviewBill");
                session.setAttribute("reviewbill", r);
            %>
            <tr>
                <td>
                    <font size="4" face="Cambria" align="center">
                    <%=r.getDate()%>
                    </font>
                </td>
                <td>
                    <font size="4" face="Cambria" align="center">
                    <%=r.getDescription()%>
                    </font>
                </td>
                <td>
                    <font size="4" face="Cambria" align="center">
                    <%=r.getWhoPaid()%>
                    </font>
                </td>
                <td>
                    <font size="4" face="Cambria" align="center">
                    <%
                        List<String> names = (List<String>) r.getWhoParticipated();
                        if (names != null) {
                            for (String name : names) {
                    %>        
                    <%=name%><br>
                    <%                                }
                        }
                    %>  
                    </font>
                </td>
                <td>
                    <font size="4" face="Cambria" align="center">
                    $<%=r.getTotal()%>
                    </font>
                </td>
            </tr>
        </table>
        <br>
        <font size="4" face="Cambria" color="blue" align="center">
        You can now save the bill or re-enter data and review the changed bill!
        </font>
    </div>
    <br>
    <%
        }
    %>

    <body>
        <div id="Bill_Details" align="left" >
            <form method="POST" action="reportBill.do">
                <b>Total Amount</b>: <input type="text" name="totalAmount" value="${reportbillform.getTotalAmount()}"/> (Ex: 30.02)<br><br>
                <b>Description</b>: <input type="text" name="description" value="${reportbillform.getDescription()}"/><br><br>
                <b>Date</b>: <input type="text" name="date" value="${reportbillform.getDate()}"/> (Ex: 30.02.2012)<br><br>
                <b>Who paid</b>:<br>
                <%
                    User user = (User) session.getAttribute("user");
                %>
                <input type="radio" name="whoPaid" value="<%=user.getFullName()%>" /> <%=user.getFullName()%><br>
                <%
                    User[] friendList = (User[]) request.getAttribute("friendList");
                    for (int i = 0; i < friendList.length; i++) {
                %>

                <input type="radio" name="whoPaid" value="<%=friendList[i].getFullName()%>" /> <%=friendList[i].getFullName()%><br>
                <%
                    }
                %> 
                <br>
                <b>Who participated</b>:<br>
                <input type="checkbox" name="whoParticipated" value="<%=user.getFullName()%>" /> <%=user.getFullName()%><br>
                <%
                    for (int i = 0; i < friendList.length; i++) {
                %>

                <input type="checkbox" name="whoParticipated" value="<%=friendList[i].getFullName()%>" /> <%=friendList[i].getFullName()%><br>
                <%
                    }
                %> 
                <br>
                <b>Individual Amounts</b>:
                <br>
                <%=user.getFullName()%>'s amount: <input type="text" name="amount" value="${reportbillform.getAmounts()[0]}"/>
                <input type="hidden" name="participantName" value="<%= user.getFullName()%>"/>
                <br><br>
                <%
                    ReportBillForm r = (ReportBillForm) request.getAttribute("reportbillform");
                    String[] b = (String[]) request.getAttribute("billAmounts");
                    for (int i = 0; i < friendList.length; i++) {
                %>
                <%=friendList[i].getFullName()%>'s amount: <input type="text" name="amount"/>
                <input type="hidden" name="participantName" value="<%= friendList[i].getFullName()%>"/>
                <br><br>
                <%
                    }
                %>      
                <input type="submit" name="action" value="Review"/>
                <%
                    if (preview == 1) {
                %>
                <input type="submit" name="action" value="Save"/>
                <%                    }
                %>
            </form>

            <form action ="home.do">
                <input type="submit" value="Cancel"/>
            </form>
        </div>
    </body>
</html>