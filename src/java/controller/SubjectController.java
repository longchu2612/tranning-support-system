/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import dao.SubjectDAO;
import model.Subject;

/**
 *
 * @author Giang Dong PC
 */
public class SubjectController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SubjectController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubjectController at " + request.getContextPath() + "</h1>");
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
        SubjectDAO subject_DAO = new SubjectDAO();
        int totalpage = 1;
        int page = 1;
        String url = request.getRequestURL().toString() + "?";
        request.setAttribute("website_url", request.getContextPath());
        ArrayList<Subject> subject_list = null;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (Exception ex) {

        }
        String search = request.getParameter("search");

        if (search == null) {
            subject_list = subject_DAO.getSubjectListPaging(page);
            totalpage = subject_DAO.countPage();
        } else {
            subject_list = subject_DAO.search(page, search);
            String[] searchs = search.split(" ");
            url = url + "search=";
            for (String search1 : searchs) {
                url = url + search1;
            }
            url = url + "&";
            totalpage = subject_DAO.countPageSearch(search);
        }
        request.setAttribute("totalpage", totalpage);
        if (page > totalpage) {
            request.setAttribute("page", totalpage);
            page = totalpage;
        } else {
            request.setAttribute("page", page);
        }
        request.setAttribute("path", request.getContextPath() + "/dashboard/subject-detail?subjectId=");
        request.setAttribute("subject_list", subject_list);
        request.setAttribute("url", url);
        request.setAttribute("website_url", request.getContextPath());
        request.getRequestDispatcher("subjectList.jsp").forward(request, response);
    }

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
