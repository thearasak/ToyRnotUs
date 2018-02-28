<%-- 
    Document   : ShippingAddr
    Created on : Feb 28, 2018, 2:22:12 PM
    Author     : ntl00194
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shipping Address</title>
    </head>
    <body>
        <h1>Shipping Address</h1><br />
        Full name<br>
        <input type="text" id="Full Name" name="FullName" style="width: 500px;" /><br>
        Address 1<br>
        <input type="text" id="Address1" name="Address1" style="width: 500px;" /><br>
        Address 2<br>
        <input type="text" id="Address2" name="Address2" style="width: 500px;" /><br>
        City&emsp;&emsp;&emsp;&emsp;&emsp;Province&emsp;&emsp;&emsp;&emsp;Post code<br>
        <input type="text" id="City" name="City" style="width: 100px;" />
        <input type="text" id="Province" name="Province" style="width: 110px;" />
        <input type="text" id="PostCode" name="PostCode" style="width: 100px;" /><br><br>
        <input type="button" id="DeliveryBtn" name="DeliveryBtn" value="Delivery to this address" />
    </body>
</html>
