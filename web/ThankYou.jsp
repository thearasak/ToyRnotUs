<%-- 
    Document   : ThankYou
    Created on : Feb 28, 2018, 2:49:08 PM
    Author     : ntl00194
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.io.*,java.util.*,model.Order,model.Toy" %>
<%
    
    /* Test assign Order sesstion*/
    ArrayList<Toy> tmpToyList = new ArrayList<Toy>();
    Toy tmpToy = new Toy();   
    
    tmpToy.setToyId(7);
    tmpToy.setToyName("best friend");
    tmpToyList.add(tmpToy);

    //JList 
    
    Order tmpOrder = new Order();
    tmpOrder.setFullName("Mananya");
    tmpOrder.setToylist(tmpToyList);
    
    session.setAttribute("ProductDetail",tmpOrder); 
    
    
    
    Order modelToy = (Order)session.getAttribute("ProductDetail");
    
    //Toy modelToy = new Toy();
     /*Toy mdToy = new Toy();
    
     visitCount = (Integer)session.getAttribute(visitCountKey);*/
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanks you</title>
        <style type="text/css">
                    .divDisplay{
                        width: 45%; 
                        height: 400px; 
                        /*overflow-y: scroll; */
                        border: gray solid 1px;
                        padding-left: 20px;
                        padding-right: 20px;
}
        </style>
    </head>
    <body>
        <h1>Thank You</h1><br>
        <div style="width: 100%">
            <div class="divDisplay" style="float: left;" id="ToyDetail" name="ToyDetail">
                Product detail<br>
                 Toy Id : <% out.print(modelToy.getToylist().get(0).getToyId()); %><br>
                 Toy Name : <% out.print(modelToy.getToylist().get(0).getToyName()); %><br>
                 Quantity : 5<br>
                 Subtotal : <% out.print(modelToy.getSubtotal()); %> THB<br>
                 Shipping : <% out.print(modelToy.getShippingPrice()); %> THB<br>
                 Total : <% out.print(modelToy.getTotal()); %> THB    <br>            
            </div>
            <div class="divDisplay" style="float: right;" id="ShippingDetail" name="ShippingDetail">
                
            </div>
        </div>
    </body>
</html>
