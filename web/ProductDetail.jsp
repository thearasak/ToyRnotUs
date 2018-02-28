<%-- 
    Document   : ProductDetail
    Created on : Feb 28, 2018, 1:51:27 PM
    Author     : ntl00194
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
    </head>
    <body>
        <h1>Toy Name</h1><br />
        <div style="width: 100%; height: 200px;">
            <div style="float: left; width: 20%">
                <img id="ToyPicture" name="ToyPicture" style="width: 20px; height: 80px;" />
            </div>
            <div style="float: right; width: 80%">
                Brand : <label id="Brand" name="Brand" ></label><br />
                Gender : <label id="Gender" name="Gender" ></label><br />
                Age : <label id="Age" name="Age" ></label><br />
                Price : <label id="Price" name="Price" ></label><br />
                Shipping Method : Cash on Delivery<br /><br />
                <b>In Stock / Out Of Stock</b><br /><br />
                Quantity<select id="DetailQuantity" name="DetailQuantity">
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
            <div style="float: right; width: 80%">
                Subtotal(<label id="DetailQuantityShow" name="DetailQuantityShow"></label> items):<label id="SubTotalPrice" name="SubTotalPrice"></label>THB<br />
                Shipping Fee: <label id="ShippingPrice" name="ShippingPrice"></label>THB<br />
                Total: <label id="TotalPrice" name="TotalPrice"></label>THB<br /><br />
                <input type="button" id="CheckOutBtn" name="CheckOutBtn" value="Process to checkout" />
            </div>            
        </div>
        
    </body>
</html>
