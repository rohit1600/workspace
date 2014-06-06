<%-- 
    Document   : report_payment
    Created on : Apr 5, 2012, 9:45:26 PM
    Author     : Sai Srinivas
--%>

<html>

    <head>
        <title>Report Payment</title>
    </head>
    <body>
        <div id="header" style="background-color:GoldenRod;">
            <p style="text-align:center; font-size:24"> 
                Report Payment
            </p>
        </div>
        <br>
        <br>
        <b> Payment done to</b>:
        <form>
            <input type="radio" name="vehicle" value="Rohit" /> Rohit<br>
            <input type="radio" name="vehicle" value="Sai" /> Sai<br>
        </form>
        <b> Amount</b> : <input type="text" name="lastName" value=""/><br/><br/>
        <b> Description</b> : <input type="text" name="password" value=""/><br/><br/>
        <input type="submit" value="Save"/>
        <input type="submit" value="Cancel"/>
    </body>
</html>