/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AssignmentDAO;
import dao.ClassDAO;
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
import model.EvalCriteria;
import model.MileStone;
import model.Subject;

/**
 *
 * @author ACER
 */
//@WebServlet(name="ClassEvalCriteriaController", urlPatterns={"/class_evalcriteria"})
public class ClassEvalCriteriaController extends HttpServlet {

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
            out.println("<title>Servlet ClassEvalCriteriaController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClassEvalCriteriaController at " + request.getContextPath() + "</h1>");
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

        String id_page = request.getParameter("page");
        String id_search = request.getParameter("id_search");
        String id_sort = request.getParameter("id_sort");
        String id_change_status = request.getParameter("id_change_status");
        String id_delete = request.getParameter("delete");
        String id_add = request.getParameter("id_add");
        String id_clone = request.getParameter("id_clone");
        String id_detail = request.getParameter("id_eval");
        String id_update = request.getParameter("id_update");

        if (id_page != null) {
            doPage(request, response);
        } else if (id_search != null) {
            doSearch(request, response);
        } else if (id_sort != null) {
            doSort(request, response);
        } else if (id_change_status != null) {
            doUpdateStatus(request, response);
        } else if (id_delete != null) {
            doDelete_raw(request, response);
        } else if (id_update != null) {
            doUpdate(request, response);
        } else if (id_detail != null) {
            doDetail(request, response);
        } else if (id_add != null) {
            doAdd(request, response);
        } else if (id_clone != null) {
            doClone(request, response);
        } else {
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

    private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EvalCriteriaDAO e = new EvalCriteriaDAO();
        SubjectDAO sd = new SubjectDAO();
        ClassDAO cd = new ClassDAO();

        ArrayList<model.EvalCriteria> list_criteria = e.getCriteriaMileIdNotNull();
        ArrayList<model.Class> list_class = cd.getAll();
        ArrayList<model.EvalCriteria> list_one = new ArrayList<>();
        list_one.add(list_criteria.get(0));
        list_one.add(list_criteria.get(1));
        list_one.add(list_criteria.get(2));
        list_one.add(list_criteria.get(3));
        list_one.add(list_criteria.get(4));

        int countRows = e.getTotalEvalMileIdNull();
        int totalPage = countRows / 5;
        if (countRows % 5 != 0) {
            totalPage++;
        }

        request.setAttribute("total_page", totalPage);
        request.setAttribute("list_class", list_class);
        request.setAttribute("list_class_criteria", list_one);
        request.getRequestDispatcher("ClassEvalCriteriaList.jsp").forward(request, response);
    }

    private void doPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = Integer.parseInt(request.getParameter("page"));
        EvalCriteriaDAO ed = new EvalCriteriaDAO();
        ClassDAO cd = new ClassDAO();

        int start;
        if (page == 1) {
            start = 0;
        } else {

            start = (page * 5) - 5;
        }

        int countRows = ed.getTotalEvalMileIdNull();
        int totalPage = countRows / 5;
        if (countRows % 5 != 0) {
            totalPage++;
        }
        ArrayList<model.EvalCriteria> page_list = ed.pagingCriteriaMileIdNull(start, 5);
        ArrayList<model.Class> list_class = cd.getAll();

        request.setAttribute("list_class", list_class);
        request.setAttribute("total_page", totalPage);

        request.setAttribute("list_class_criteria", page_list);
        request.getRequestDispatcher("ClassEvalCriteriaList.jsp").forward(request, response);
    }

    private void doSearch(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        PrintWriter o = response.getWriter();
        ClassDAO cd = new ClassDAO();
        EvalCriteriaDAO ed = new EvalCriteriaDAO();

        String key_search = request.getParameter("search");
        int class_id = Integer.parseInt(request.getParameter("filter_id_class"));
        int status = Integer.parseInt(request.getParameter("filter_status"));
        boolean stt;
        if (status == 0) {
            stt = false;
        } else {
            stt = true;
        }
        ArrayList<EvalCriteria> list_search = new ArrayList<>();
        ArrayList<EvalCriteria> list_eval_all = ed.getCriteriaMileIdNotNull();
        ArrayList<model.Class> list_class = cd.getAll();

        //chỉ lọc status
        if (class_id == 0 && status != 2) {
            for (EvalCriteria e : list_eval_all) {
                if (e.isStatus() == stt && e.getCriteria_name().contains(key_search)) {
                    list_search.add(e);
                }
            }
        } //chỉ lọc class
        else if (status == 2 && class_id != 0) {
            for (EvalCriteria e : list_eval_all) {
                if (e.getMilestone_id().getClass_id().getClass_id() == class_id && e.getCriteria_name().contains(key_search)) {
                    list_search.add(e);
                }
            }
        } // chi loc name
        else if (class_id == 0 && status == 2) {
            for (EvalCriteria e : list_eval_all) {
                if (e.getCriteria_name().contains(key_search)) {
                    list_search.add(e);
                }
            }
        } else {
            for (EvalCriteria e : list_eval_all) {
                if (e.getMilestone_id().getClass_id().getClass_id() == class_id && e.isStatus() == stt && e.getCriteria_name().contains(key_search)) {
                    list_search.add(e);
                }
            }
        }

        if (list_search.size() > 0) {
            request.setAttribute("data_search", list_search);
            request.setAttribute("class_id", class_id);
            request.setAttribute("status_s", status);
            request.setAttribute("list_class", list_class);
            request.setAttribute("key_search", key_search);
            request.getRequestDispatcher("ClassEvalCriteriaList.jsp").forward(request, response);

        } else {

            request.setAttribute("mess_not_found", "notfound");
            request.setAttribute("class_id", class_id);
            request.setAttribute("status_s", status);
            request.setAttribute("list_class", list_class);
            request.setAttribute("key_search", key_search);
            request.getRequestDispatcher("ClassEvalCriteriaList.jsp").forward(request, response);
        }
    }

    private void doSort(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EvalCriteriaDAO ed = new EvalCriteriaDAO();
        ClassDAO cd = new ClassDAO();
        String id_sort = request.getParameter("id_sort");
        String sql = null;

        ArrayList<EvalCriteria> list_sort = new ArrayList<>();
        ArrayList<model.Class> list_class = cd.getAll();
        //sort eval name
        if (id_sort.equals("name_up")) {
            sql = "SELECT *\n"
                    + "FROM eval_criteria where milestone_id is not null\n"
                    + "ORDER BY criteria_name asc ;";
            list_sort = ed.sort(sql);
            request.setAttribute("action_sort", 1);

        } else if (id_sort.equals("name_down")) {
            sql = "SELECT *\n"
                    + "FROM eval_criteria where milestone_id is not null\n"
                    + "ORDER BY criteria_name desc ;";
            list_sort = ed.sort(sql);
            request.setAttribute("action_sort", 0);
        }

        //sort weval-weight
        if (id_sort.equals("weight_up")) {
            sql = "SELECT *\n"
                    + "FROM eval_criteria where milestone_id is not null\n"
                    + "ORDER BY eval_weight asc ;";
            list_sort = ed.sort(sql);
            request.setAttribute("action_sort", 1);

        } else if (id_sort.equals("weight_down")) {
            sql = "SELECT *\n"
                    + "FROM eval_criteria where milestone_id is not null\n"
                    + "ORDER BY eval_weight desc ;";
            list_sort = ed.sort(sql);
            request.setAttribute("action_sort", 0);

        }

        request.setAttribute("list_class", list_class);
        request.setAttribute("list_class_criteria", list_sort);
        request.getRequestDispatcher("ClassEvalCriteriaList.jsp").forward(request, response);
    }

    private void doUpdateStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EvalCriteriaDAO ed = new EvalCriteriaDAO();
        int id_eval = Integer.parseInt(request.getParameter("id_change_status"));
        int status = Integer.parseInt(request.getParameter("status"));
        ed.changeStatus(id_eval, status);
        request.setAttribute("mess_change_status", "Thay đổi trạng thái thành công!");
        doAction(request, response);
    }

    private void doDelete_raw(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");

        int delete = Integer.parseInt(request.getParameter("delete"));
        PrintWriter o = response.getWriter();
        EvalCriteriaDAO ed = new EvalCriteriaDAO();

        ed.deleteCriteria(delete);
        request.setAttribute("mess_delete", "Xóa thành công");
        doAction(request, response);
    }

    private void doAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter o = response.getWriter();

        AssignmentDAO ad = new AssignmentDAO();
        EvalCriteriaDAO ed = new EvalCriteriaDAO();
        ClassDAO cd = new ClassDAO();
        SubjectDAO sd = new SubjectDAO();
        MileStoneDAO md = new MileStoneDAO();
        ArrayList<MileStone> list_milestone = md.getAll();

        String click_add = request.getParameter("click_add");
        String check_milestone = request.getParameter("check_milestone");
        String check_ass = request.getParameter("check_ass");
        String check_eval = request.getParameter("check_eval");

        if (check_milestone != null) {
            int mile_id = Integer.parseInt(request.getParameter("mile_id"));

            MileStone ms = md.getMileStoneByID(mile_id);

            request.setAttribute("add", "add");
            request.setAttribute("mile_check", ms);

            request.setAttribute("list_mile", list_milestone);
            request.getRequestDispatcher("ClassEvalCriteriaList.jsp").forward(request, response);

        } else {

            if (click_add != null) {
//                int id_eval = Integer.parseInt(request.getParameter("eval_check"));
                String criteria_name = request.getParameter("criteria_name");
                int is_team_eval = Integer.parseInt(request.getParameter("is_team_eval"));
                int eval_weight = Integer.parseInt(request.getParameter("evalWeight"));
                int maxLoc = Integer.parseInt(request.getParameter("maxLoc"));
                int status = Integer.parseInt(request.getParameter("status"));
//                int ass_id = Integer.parseInt(request.getParameter("ass_id"));
                int milestone_id = Integer.parseInt(request.getParameter("milestone_id"));
                String description = request.getParameter("description");

//            ==================Object==================
//                EvalCriteria e = ed.getCriteriaByID(id_eval);
//            ==================LIST====================

                if (eval_weight > 100) {
//            ============Set Attribute================

                    request.setAttribute("name", criteria_name);
                    request.setAttribute("maxloc", maxLoc);
                    request.setAttribute("description", description);
                    request.setAttribute("mess_eval_weight", "Vui lòng nhập số từ 0-100!");
                    request.setAttribute("add", "add");
                    request.setAttribute("id_add", "add");

                    request.setAttribute("list_mile", list_milestone);
                    request.getRequestDispatcher("ClassEvalCriteriaList.jsp").forward(request, response);

                } else {
                    ed.classAddCriteria(milestone_id, criteria_name, is_team_eval, maxLoc, eval_weight, status, description);
                    request.setAttribute("mess_add", "Thêm thành công!");
                    doAction(request, response);
                }
            } else {
                request.setAttribute("add", "add");
                request.setAttribute("id_add", "add");
                request.setAttribute("list_mile", list_milestone);
                request.getRequestDispatcher("ClassEvalCriteriaList.jsp").forward(request, response);
            }
        }

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
        EvalCriteria e = ed.getCriteriaByID(id_raw);
//        ArrayList<Assignment> list_ass = ad.getAssignmentBySubjectID(e.getAss_id().getSubject_id().getSubject_id());
        ArrayList<MileStone> list_milestone = md.getMileStoneByAssID(e.getAss_id().getAss_id());

        request.setAttribute("list_mile", list_milestone);
//        request.setAttribute("list_ass", list_ass);
        request.setAttribute("eval", e);
        request.getRequestDispatcher("ClassEvalCriteriaDetail.jsp").forward(request, response);
    }

    private void doUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter o = response.getWriter();
        AssignmentDAO ad = new AssignmentDAO();
        MileStoneDAO md = new MileStoneDAO();
        EvalCriteriaDAO ed = new EvalCriteriaDAO();

        int criteria_id = Integer.parseInt(request.getParameter("id"));

        String criteria_name = request.getParameter("criteria_name");

        int is_team_eval = Integer.parseInt(request.getParameter("is_team_eval"));
        int evalWeight = Integer.parseInt(request.getParameter("evalWeight"));

        if (evalWeight <= 100) {
            int max_loc = Integer.parseInt(request.getParameter("maxLoc"));
            int status = Integer.parseInt(request.getParameter("status"));
            String des = request.getParameter("description");

            ed.updateClassCriteria(criteria_id, criteria_name, is_team_eval, max_loc, evalWeight, status, des);
            EvalCriteria e = ed.getCriteriaByID(criteria_id);
            request.setAttribute("eval", e);
            request.setAttribute("mess", "Sửa thành công!");

        } else {
            EvalCriteria e = ed.getCriteriaByID(criteria_id);
            request.setAttribute("mess_err_weight", "a");
            request.setAttribute("eval", e);
        }
        request.getRequestDispatcher("ClassEvalCriteriaDetail.jsp").forward(request, response);

    }

    private void doClone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id_clone"));

        EvalCriteriaDAO ed = new EvalCriteriaDAO();
        AssignmentDAO ad = new AssignmentDAO();
        MileStoneDAO md = new MileStoneDAO();

        EvalCriteria e = ed.getCriteriaByID(id);
        ArrayList<MileStone> list_milestone = md.getMileStoneByAssID(e.getAss_id().getAss_id());

        request.setAttribute("list_mile", list_milestone);
        request.setAttribute("eval", e);
        request.setAttribute("add", "add");
        request.setAttribute("id_clone", "add");
        request.getRequestDispatcher("ClassEvalCriteriaList.jsp").forward(request, response);
    }
}
