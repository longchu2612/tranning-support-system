/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SubjectDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Subject;
import model.User;

/**
 *
 * @author ACER
 */
@WebServlet(name = "dashboard", urlPatterns = {"/dashboard"})
public class DashboardController extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");

        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet dashboard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet dashboard at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        SubjectDAO s = new SubjectDAO();
        UserDAO u = new UserDAO();
        ArrayList<User> listAcc = null;
        try {
            listAcc = u.getAll();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DashboardController.class.getName()).log(Level.SEVERE, null, ex);
        }

        int option = Integer.parseInt(request.getParameter("option"));
        ArrayList<Subject> list = null;

        list = s.getAll();

        if (option == 2) {

            request.setAttribute("list", list);
            request.setAttribute("option", option);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);

        }
        if (option == 3) {
            response.sendRedirect("dashboard.jsp");
        }
        if (option == 4) {
//            out.print("helo");
//            for (User user : listAcc) {
////                out.print(user.getFull_name());
//
//            }
            request.setAttribute("listAcc", listAcc);
            request.setAttribute("option", option);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        }
        if (option == 5) {
//            for (User user : listAcc) {
//                out.print(user.getFull_name());
            request.setAttribute("listAcc", listAcc);
            request.setAttribute("option", option);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
//            }
        }
        if (option == 6) {
//            for (User user : listAcc) {
//                out.print(user.getFull_name());
            request.setAttribute("listAcc", listAcc);
            request.setAttribute("option", option);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
//            }
        }

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
