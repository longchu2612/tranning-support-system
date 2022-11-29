/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AssignmentDAO;
import dao.EvalCriteriaDAO;
import dao.MileStoneDAO;
import dao.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Assignment;
import model.MileStone;
import model.Subject;

/**
 *
 * @author ACER
 */
//@WebServlet(name = "EvalCriteria", urlPatterns = {"/eval-criteria"})
public class EvalCriteriaController extends HttpServlet {

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
            out.println("<title>Servlet EvalCriteria</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EvalCriteria at " + request.getContextPath() + "</h1>");
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
        PrintWriter o = response.getWriter();

        EvalCriteriaDAO ed = new EvalCriteriaDAO();
        AssignmentDAO ad = new AssignmentDAO();
        MileStoneDAO md = new MileStoneDAO();

        String id_search = request.getParameter("id_search");
        String page = request.getParameter("page");
        String id_detail = request.getParameter("id_eval");
        String id_delete = request.getParameter("delete");
        String id_add = request.getParameter("id_add");
        String id_update = request.getParameter("assignment");
        String id_change_status = request.getParameter("id_change_status");

        if (id_search != null) {
            doSearch(request, response);
        } else if (page != null) {
            doPage(request, response);
        } else if (id_delete != null) {
            doDelete_raw(request, response);
        } else if (id_update != null) {
            doUpdate(request, response);
        } else if (id_detail != null) {
            doDetail(request, response);
        } else if (id_add != null) {
            doAdd(request, response);
        } else if (id_change_status != null) {
            doChangeStatus(request, response);
        } else {
            doAction(request, response);

        }
//       
    }

    protected void doSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter o = response.getWriter();

        EvalCriteriaDAO ed = new EvalCriteriaDAO();
        SubjectDAO sd = new SubjectDAO();
        ArrayList<model.EvalCriteria> list_search = ed.getAllCriteria();
        ArrayList<model.EvalCriteria> data_search = new ArrayList<>();
        ArrayList<Subject> list_subject = sd.getAll();

        int id_subject = Integer.parseInt(request.getParameter("filter_subject"));
        int status = Integer.parseInt(request.getParameter("filter_status"));
        boolean stt;
        String search = request.getParameter("search");

        //change status
        if (status == 1) {
            stt = true;
        } else {
            stt = false;
        }

        for (model.EvalCriteria criteria : list_search) {
            if (criteria.getAss_id().getSubject_id().getSubject_id() == id_subject && criteria.isStatus() == stt && criteria.getCriteria_name().contains(search)) {
                data_search.add(criteria);
            }
        }
//        o.println(id_subject+"|"+status+"|"+search);
        if (data_search.size() > 0) {
            request.setAttribute("data_search", data_search);
            request.setAttribute("list_subject", list_subject);
            request.setAttribute("key_search", search);
            request.getRequestDispatcher("EvalCriteriaList.jsp").forward(request, response);
        } else {
            request.setAttribute("mess_not_found", "Không tìm thấy!");
            request.setAttribute("list_subject", list_subject);
            request.setAttribute("key_search", search);
            request.getRequestDispatcher("EvalCriteriaList.jsp").forward(request, response);
        }

//        PrintWriter out = response.getWriter();
//        for (evalCriteria criteria : list_search) {
//            out.println(criteria.getCriteria_id());
//        }
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

    private void doPage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int page = Integer.parseInt(request.getParameter("page"));
        EvalCriteriaDAO ed = new EvalCriteriaDAO();
        SubjectDAO sd = new SubjectDAO();
        ArrayList<Subject> list_subject = sd.getAll();
        int start;
        if (page == 1) {
            start = 0;
        } else {

            start = (page * 5) - 5;
        }

        int countRows = ed.getTotalEval();
        int totalPage = countRows / 5;
        if (countRows % 5 != 0) {
            totalPage++;
        }
        ArrayList<model.EvalCriteria> page_list = ed.pagingCriteria(start, 5);

        request.setAttribute("list_subject", list_subject);
        request.setAttribute("total_page", totalPage);

        request.setAttribute("list_criteria", page_list);
        request.getRequestDispatcher("EvalCriteriaList.jsp").forward(request, response);

    }

    private void doDelete_raw(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");

        int delete = Integer.parseInt(request.getParameter("delete"));
        PrintWriter o = response.getWriter();
        EvalCriteriaDAO ed = new EvalCriteriaDAO();

        ed.deleteCriteria(delete);
        doAction(request, response);
    }

    private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        EvalCriteriaDAO e = new EvalCriteriaDAO();
        SubjectDAO sd = new SubjectDAO();

        ArrayList<model.EvalCriteria> list_criteria = e.getAllCriteria();
        ArrayList<Subject> list_subject = sd.getAll();
        ArrayList<model.EvalCriteria> list_one = new ArrayList<>();
        list_one.add(list_criteria.get(0));
        list_one.add(list_criteria.get(1));
        list_one.add(list_criteria.get(2));
        list_one.add(list_criteria.get(3));
        list_one.add(list_criteria.get(4));

        int countRows = e.getTotalEval();
        int totalPage = countRows / 5;
        if (countRows % 5 != 0) {
            totalPage++;
        }

        request.setAttribute("total_page", totalPage);
        request.setAttribute("list_subject", list_subject);
        request.setAttribute("list_criteria", list_one);
        request.getRequestDispatcher("EvalCriteriaList.jsp").forward(request, response);
    }

    private void doUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter o = response.getWriter();
        AssignmentDAO ad = new AssignmentDAO();
        MileStoneDAO md = new MileStoneDAO();

        int criteria_id = Integer.parseInt(request.getParameter("id"));
        int ass_id = Integer.parseInt(request.getParameter("assignment"));
        int mile_id = 0;
        String criteria_name = request.getParameter("criteria_name");
        int is_team_eval = Integer.parseInt(request.getParameter("is_team_eval"));
        int evalWeight = Integer.parseInt(request.getParameter("evalWeight"));
        int max_loc = Integer.parseInt(request.getParameter("maxLoc"));
        int status = Integer.parseInt(request.getParameter("status"));
        String des = request.getParameter("description");

        EvalCriteriaDAO ed = new EvalCriteriaDAO();

        ed.updateCriteria(criteria_id, ass_id, mile_id, criteria_name, is_team_eval, max_loc, evalWeight, status, des);
        model.EvalCriteria e = ed.getCriteriaByID(criteria_id);
        ArrayList<Assignment> list_ass = ad.getAssignmentBySubjectID(e.getAss_id().getSubject_id().getSubject_id());
        ArrayList<MileStone> list_milestone = md.getMileStoneByAssID(e.getAss_id().getAss_id());

        request.setAttribute("list_mile", list_milestone);
        request.setAttribute("list_ass", list_ass);
        request.setAttribute("eval", e);
        request.setAttribute("mess", "Sửa thành công!");

        request.getRequestDispatcher("EvalCriteriaDetail.jsp").forward(request, response);
//        o.println(criteria_id+"|"+ass_id+"|"+mile_id+"|"+criteria_name+"|"+is_team_eval+"|"+evalWeight
//        +"|"+max_loc+"|"+status+"|"+des+"===");
    }

    private void doDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id_eval");
        EvalCriteriaDAO ed = new EvalCriteriaDAO();
        AssignmentDAO ad = new AssignmentDAO();
        MileStoneDAO md = new MileStoneDAO();
        int id_raw = 0;
        try {
            id_raw = Integer.parseInt(id);

        } catch (Exception e) {
            id_raw = 0;
        }
        model.EvalCriteria e = ed.getCriteriaByID(id_raw);
        ArrayList<Assignment> list_ass = ad.getAssignmentBySubjectID(e.getAss_id().getSubject_id().getSubject_id());
        ArrayList<MileStone> list_milestone = md.getMileStoneByAssID(e.getAss_id().getAss_id());

        request.setAttribute("list_mile", list_milestone);
        request.setAttribute("list_ass", list_ass);
        request.setAttribute("eval", e);
        request.getRequestDispatcher("EvalCriteriaDetail.jsp").forward(request, response);
    }

    private void doAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter o = response.getWriter();
        SubjectDAO sd = new SubjectDAO();
        AssignmentDAO ad = new AssignmentDAO();
        EvalCriteriaDAO ed = new EvalCriteriaDAO();

        ArrayList<Subject> list_subject = sd.getAll();

        String click_add = request.getParameter("click_add");
        String check = request.getParameter("check_subject");

        if (check != null) {

            int id_subject = Integer.parseInt(request.getParameter("id_subject"));
            // choose add
            Subject s = sd.getSubjectByID(id_subject);

            ArrayList<Assignment> list_assignment = ad.getAssignmentBySubjectID(id_subject);
            if (list_assignment.size() > 0) {
                request.setAttribute("list_assignment", list_assignment);
                request.setAttribute("subject", s);
                request.setAttribute("add", "add");
            } else {
                request.setAttribute("mess_error", "Tạm thời bộ môn '" + s.getSubject_name() + "' chưa có assignment nên chưa thể thêm tiêu chí! ");
                request.setAttribute("add", "add");

            }

            request.getRequestDispatcher("EvalCriteriaList.jsp").forward(request, response);
        } else if (click_add != null) {
            int ass_id = Integer.parseInt(request.getParameter("assignment_add"));
            int mile_id = 0;
            String criteria_name = request.getParameter("criteria_name");
            int is_team_eval = Integer.parseInt(request.getParameter("is_team_eval"));
            int eval_weight = Integer.parseInt(request.getParameter("evalWeight"));
            int maxLoc = Integer.parseInt(request.getParameter("maxLoc"));
            int status = Integer.parseInt(request.getParameter("status"));
            String description = request.getParameter("description");

            ed.addCriteria(ass_id, criteria_name, is_team_eval, eval_weight, maxLoc, status, description);
            request.setAttribute("mess_add", "Thêm thành công!");
            doAction(request, response);
        } else {
            request.setAttribute("add", "add");
            request.setAttribute("list_subject", list_subject);
            request.getRequestDispatcher("EvalCriteriaList.jsp").forward(request, response);
        }

    }

    private void doChangeStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EvalCriteriaDAO ed = new EvalCriteriaDAO();
        int id_eval = Integer.parseInt(request.getParameter("id_change_status"));
        int status = Integer.parseInt(request.getParameter("status"));
        ed.changeStatus(id_eval, status);
        request.setAttribute("mess_change_status", "Thay đổi trạng thái thành công!");
        doAction(request, response);
    }

}
