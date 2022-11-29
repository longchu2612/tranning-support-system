/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AssignmentDAO;
import dao.ClassDAO;
import dao.EvalCriteriaDAO;
import dao.MileStoneDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Formatter;
import model.Assignment;
//import model.;

/**
 *
 * @author ACER
 */
//@WebServlet(name = "MileStone", urlPatterns = {"/milestone"})
public class MileStoneController extends HttpServlet {

    static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

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
            out.println("<title>Servlet MileStone</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MileStone at " + request.getContextPath() + "</h1>");
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
//        int id = Integer.parseInt(request.getParameter("id"));
        PrintWriter o = response.getWriter();
        EvalCriteriaDAO ed = new EvalCriteriaDAO();
        AssignmentDAO ad = new AssignmentDAO();
        MileStoneDAO md = new MileStoneDAO();

        String search = request.getParameter("search");
        String page = request.getParameter("page");
        String id_detail = request.getParameter("id_detail");
        String id_delete = request.getParameter("id_delete");
        String id_add = request.getParameter("id_add");

        if (search != null) {
            doSearch(request, response);
        } else if (page != null) {
            doPage(request, response);
        } else if (id_detail != null) {
            doDetail(request, response);
        } else if (id_delete != null) {
            doDeleteMilestone(request, response);
        } else if (id_add != null) {
            doAddMileStone(request, response);
        } else {
            // show list page
            doAction(request, response);
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

    private void doSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        MileStoneDAO md = new MileStoneDAO();
        ArrayList<model.MileStone> list_search = md.searchMilestone(search);

        request.setAttribute("key_search", search);
        request.setAttribute("data_search", list_search);
        request.getRequestDispatcher("MilestoneList.jsp").forward(request, response);

    }

    private void doDetail(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private void doPage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int page = Integer.parseInt(request.getParameter("page"));
        PrintWriter o = response.getWriter();
        MileStoneDAO md = new MileStoneDAO();

        int start;
        if (page == 1) {
            start = 0;
        } else {

            start = (page * 5) - 5;
        }

        int countRows = md.getTotalMilestone();
        int totalPage = countRows / 5;
        if (countRows % 5 != 0) {
            totalPage++;
        }

        ArrayList<model.MileStone> page_list = md.pagingMilestone(start, 5);
        request.setAttribute("list_milestone", page_list);
        request.setAttribute("total_page", totalPage);
        request.getRequestDispatcher("MilestoneList.jsp").forward(request, response);
    }

    //Trang first run 
    private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MileStoneDAO md = new MileStoneDAO();
        ArrayList<model.MileStone> listAll = md.getAll();
        ArrayList<model.MileStone> page_one = new ArrayList<>();
        page_one.add(listAll.get(0));
        page_one.add(listAll.get(1));
        page_one.add(listAll.get(2));
        page_one.add(listAll.get(3));
        page_one.add(listAll.get(4));

        int countRows = md.getTotalMilestone();
        int totalPage = countRows / 5;
        if (countRows % 5 != 0) {
            totalPage++;
        }

        request.setAttribute("total_page", totalPage);
        request.setAttribute("list_milestone", page_one);
        request.getRequestDispatcher("MilestoneList.jsp").forward(request, response);
    }

    private void doDeleteMilestone(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id_delete"));
        PrintWriter o = response.getWriter();
        MileStoneDAO md = new MileStoneDAO();
        md.deleteMilestone(id);
        doAction(request, response);
    }

    private void doAddMileStone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        PrintWriter o = response.getWriter();
        AssignmentDAO ad = new AssignmentDAO();
        ClassDAO cd = new ClassDAO();
        MileStoneDAO md = new MileStoneDAO();

        ArrayList<Assignment> list_ass = ad.getAssignmentNotMileStone();
        ArrayList<model.Class> list_class = cd.getAll();

        String click_add = request.getParameter("click_add");
        //người dùng click vào thêm
        if (click_add != null) {

            int ass_id = Integer.parseInt(request.getParameter("assignment_add"));
            Assignment a = ad.getAssByID(ass_id);

            int class_id = Integer.parseInt(request.getParameter("class_add"));
            String fromdate = request.getParameter("fromdate");
            String todate = request.getParameter("todate");
            String title = request.getParameter("title");
            String ass_body = a.getAss_body();
            String des = request.getParameter("description");
            int status = Integer.parseInt(request.getParameter("status"));
            Date fromd = Date.valueOf(fromdate);
            Date tod = Date.valueOf(todate);

            if (tod.after(fromd)) {

                request.setAttribute("mess_add", "Thêm thành công!");
                md.add_milestone(ass_id, class_id, fromdate, todate, title, ass_body, des, status);
                doAction(request, response);
            } else {
                request.setAttribute("list_assignment", list_ass);
                request.setAttribute("list_class", list_class);
                request.setAttribute("add", "add!");
                request.setAttribute("mess_err_date", "Ngày bắt đầu phải trước ngày kết thúc!");
                request.getRequestDispatcher("MilestoneList.jsp").forward(request, response);
            }

        } else if (list_ass.size() == 0) {
            request.setAttribute("mess_add_error", "Tạm thời chưa thể thêm mới!Tất cả các assignment đã có mốc!");
            doAction(request, response);
        } else {
            request.setAttribute("add", "add");
            request.setAttribute("list_assignment", list_ass);
            request.setAttribute("list_class", list_class);
//            request.getRequestDispatcher("MilestoneList.jsp").forward(request, response);
            doAction(request, response);
        }
    }

}
