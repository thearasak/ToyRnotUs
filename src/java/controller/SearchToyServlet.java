/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import model.Toy;

/**
 *
 * @author basza
 */
@WebServlet(name = "SearchToyServlet", urlPatterns = {"/SearchToyServlet"})
public class SearchToyServlet extends HttpServlet {

    @Resource(name = "Toy_Database")
    private DataSource toy_Database;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            ArrayList<Toy> toys = new ArrayList<Toy>();
            String age = (String) request.getParameter("SearchAge");
            String gender = (String) request.getParameter("SearchGender");

            Connection databaseConnection = toy_Database.getConnection();
            Statement queryStatement = databaseConnection.createStatement();
            String query_statement = "SELECT * FROM Toy_Table WHERE Age = '" + age + "' AND gender = '" + gender + "';";
            ResultSet queryResults = queryStatement.executeQuery(query_statement);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/SeachProduct.jsp");
            requestDispatcher.include(request, response);
            out.print("<table><thead>\n"
                    + "                <tr>\n"
                    + "                    <th>Toy ID</th>\n"
                    + "                    <th>Toy Name</th>\n"
                    + "                    <th>Price</th>\n"
                    + "                    <th></th>\n"
                    + "                </tr>\n"
                    + "            </thead>\n"
                    + "            <tbody>\n");

            while (queryResults.next()) {
                out.println("<form action=\"/ToyRnotUs/ProductDetail.jsp\">");
                out.println("<tr><td>" + queryResults.getString("Toy_ID") + "</td><td>" + queryResults.getString("Toy_Name") + "</td><td>" + queryResults.getString("Price") + "</td><td><input type=\"submit\" value=\"select\" name=\"ToyId" + queryResults.getString("Toy_ID") + "\" /></td></tr>");
                out.print("<input  type = \"hidden\" name = \"ToyId\" value = \""+queryResults.getString("Toy_ID")+"\" >");
                out.println("</form>");
            }
            out.println("</tbody></table>");
        } catch (SQLException ex) {
            Logger.getLogger(SearchToyServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
