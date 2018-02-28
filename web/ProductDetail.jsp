<%-- 
    Document   : ProductDetail
    Created on : Feb 28, 2018, 1:51:27 PM
    Author     : ntl00194
--%>
<%@page import="model.Order"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
    </head>
    <body onload=calculate()>

        <%! String brand;
            String gender;
            String age;
            String price;
            Order order = new Order();
        %> 
        <%
            String toyId = request.getParameter("ToyId");
            Connection con;

            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://128.199.163.79:3306/Toy_Database", "root", "1qaz2wsx");
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * from Toy_Table where Toy_ID = '" + toyId + "'");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                brand = rs.getString("Brand");
                gender = rs.getString("Gender");
                age = rs.getString("Age");
                price = rs.getString("Price");

                //out.println("Brand " + username + "<hr>");
            }
        %>
        <h1>Toy Name</h1><br />
        <form action="ThankYou.jsp" method="post" name="finalForm">
            <input type="hidden" name="resultText" value="">
        </form>
        <div style="width: 100%; height: 200px;">
            <div style="float: left; width: 20%">
                <img id="ToyPicture" name="ToyPicture" style="width: 20px; height: 80px;" />
            </div>
            <div style="float: right; width: 80%">
                Brand : <label id="Brand" name="Brand" ><%=brand%></label><br />
                Gender : <label id="Gender" name="Gender" ><%=gender%></label><br />
                Age : <label id="Age" name="Age" ><%=age%></label><br />
                Price : <label id="Price" name="Price" ><%=price%></label><br />
                Shipping Method : Cash on Delivery<br /><br />
                <b>In Stock / Out Of Stock</b><br /><br />
                Quantity<select id="DetailQuantity" name="DetailQuantity" onchange=calculate()>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>            
        </div>
        <hr style="width: 500px; float: left;" /><br />
        <div style="width: 100%">
            <div style="float: left; width: 20%">

                Shipping Method : Cash on Delivery<br />
                Shipping fee: 50.00 THB
            </div>
            <div style="float: right; width: 80%" name="summaryText">
                Subtotal(<label id="DetailQuantityShow" name="DetailQuantityShow"></label> items):<label id="SubTotalPrice" name="SubTotalPrice"></label> THB<br />
                Shipping Fee: <label id="ShippingPrice" name="ShippingPrice"></label>50 THB<br />
                Total: <label id="TotalPrice" name="TotalPrice"></label> THB<br /><br />
                <input type="button" id="CheckOutBtn" name="CheckOutBtn" onclick=storeCart() value="Process to checkout" />
            </div>            
        </div>
        <script type="text/javascript">
            var textToSubmit = "";
            function storeCart()
            {

                document.forms[0].resultText.value = textToSubmit;
                document.forms[0].submit();

            }
            function calculate()
            {
                document.getElementById('DetailQuantityShow').innerHTML = document.getElementById('DetailQuantity').value;
                var subtotal = <%=price%> * document.getElementById('DetailQuantity').value;
                document.getElementById('SubTotalPrice').value = parseFloat(subtotal.toPrecision(4));
                //alert(document.getElementById('SubTotalPrice').value);
                document.getElementById('SubTotalPrice').innerHTML = document.getElementById('SubTotalPrice').value;
                document.getElementById('TotalPrice').value = 50 + document.getElementById('SubTotalPrice').value;
                document.getElementById('TotalPrice').innerHTML = document.getElementById('TotalPrice').value;
                textToSubmit = "Order total: " + document.getElementById('TotalPrice').value + " THB";

            }

        </script>
    </body>
</html>
