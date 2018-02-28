<%-- 
    Document   : SeachProduct
    Created on : Feb 28, 2018, 2:24:55 PM
    Author     : Tanawat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search  Toy</title>
    </head>
    
    <body>      
        <h1>Search  Toy</h1>
        Select age              Select gender<br>
        <form action="SearchToyServlet">
            <select name="SearchAge">
            <option>Toddler</option>
            <option>Baby</option>
            <option>3_to_5</option>
            <option>6_to_8</option>
            <option>over8</option>
        </select>
        
        <select name="SearchGender" >
            <option>Neutral</option>
            <option>Male</option>
            <option>Female</option>
        </select>
        <input type="submit" value="Search" id="SearchButton" />  <br>
        toys found
        </form>
   </body>
</html>