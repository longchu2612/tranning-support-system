/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ClassDAO;
import dao.ScheduleDAO;
import dao.SettingDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import model.Schedule;
import model.User;
import model.Class;
import model.Room;
import model.Setting;
import model.Slot;

/**
 *
 * @author Giang Dong PC
 */
public class ScheduleController extends HttpServlet {

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
        String url = request.getRequestURI().substring(request.getContextPath().length());
        if (url.equals("/Dashboard/schedule-list")) {
            scheduleListGet(request, response);
        }
        if (url.equals("/Dashboard/schedule-detail")) {
            scheduleDetailGet(request, response);
        }
        if (url.equals("/Dashboard/schedule-add")) {
            scheduleAddGet(request, response);
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
        String url = request.getRequestURI().substring(request.getContextPath().length());
        if (url.equals("/Dashboard/schedule-list")) {
            scheduleListGet(request, response);
        }
        if (url.equals("/Dashboard/schedule-detail")) {
            scheduleDetailPost(request, response);
        }
        if (url.equals("/Dashboard/schedule-add")) {
            scheduleAddPost(request, response);
        }
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

    private void scheduleListGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ScheduleDAO scheduleDAO = new ScheduleDAO();
        ClassDAO classDAO = new ClassDAO();
        ArrayList<Schedule> scheduleList;
        ArrayList<Class> classList = new ArrayList<>();
        HttpSession session = request.getSession(false);
        String linkUrl = request.getRequestURL().toString() + "?";
        User user = null;
        if (session != null) {
            user = (User) session.getAttribute("acc");
        } else {

        }
        boolean add = false;
        if (request.getParameter("add") != null && request.getParameter("add").equalsIgnoreCase("true")) {
            add = true;
        }
        request.setAttribute("add", add);
        int page = 1;
        int totalpage = 0;
        int sort = 6;
        boolean order = true;
        int classId = 0;
        boolean role = false;
        if (user != null) {
            if (user.getRole().equalsIgnoreCase("Client")) {
                classList = classDAO.getTraineeClassList(user.getId());
            } else {
                role = true;
                classList = classDAO.getClassList(user.getId());
            }
        }
        request.setAttribute("role", role);
        classId = classList.get(0).getClass_id();
        try {
            classId = Integer.parseInt(request.getParameter("classId"));
            request.setAttribute("selected_class", classId);
            linkUrl += "classId=" + classId;
        } catch (Exception e) {

        }
        try {
            sort = Integer.parseInt(request.getParameter("sort"));
            linkUrl += "&sort=" + sort;
        } catch (Exception e) {
        }
        request.setAttribute("sort", sort);
        if (request.getParameter("order") != null) {
            if (request.getParameter("order").equalsIgnoreCase("false")) {
                order = false;
                linkUrl += "&order=FALSE";
            } else {
                linkUrl += "&order=TRUE";
            }
        }
        request.setAttribute("order", order);
        request.setAttribute("class_list", classList);
        String search = request.getParameter("search");
        if (search != null) {
            linkUrl += "&search=";
            String[] searchs = search.split(" ");
            for (String search1 : searchs) {
                linkUrl += "+" + search1;
            }
            linkUrl = linkUrl.substring(0,linkUrl.length()-2);
            
        }
        request.setAttribute("search", search);
        try {
            page = Integer.parseInt(request.getParameter("page"));
            totalpage = scheduleDAO.countPage(classId, search);
        } catch (Exception ex) {
            
        }
        scheduleList = scheduleDAO.getScheduleList(user.getId(), classId, sort, order, page, search);
        totalpage = scheduleDAO.countPage(classId, search);
        request.setAttribute("schedule_list", scheduleList);
        request.setAttribute("totalpage", totalpage);
        if (page > totalpage) {
            request.setAttribute("page", totalpage);
            page = totalpage;
        } else {
            request.setAttribute("page", page);
        }
        request.setAttribute("website_url", request.getContextPath());
        request.setAttribute("url", linkUrl);
        scheduleDAO.closeConnection();
        classDAO.closeConnection();
        request.getRequestDispatcher("scheduleList.jsp").forward(request, response);

    }

    private void scheduleDetailGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ScheduleDAO scheduleDAO = new ScheduleDAO();
        SettingDAO settingDAO = new SettingDAO();
        ArrayList<Setting> slots = settingDAO.getSlotList();
        ArrayList<Setting> rooms = settingDAO.getRoomList();
        request.setAttribute("slot_list", slots);
        request.setAttribute("room_list", rooms);
        int id = 0;
        boolean save = false;
        if (request.getParameter("save") != null && request.getParameter("save").equalsIgnoreCase("true")) {
            save = true;
        }
        request.setAttribute("save", save);
        try {
            id = Integer.parseInt(request.getParameter("scheduleId"));
        } catch (Exception e) {
        }
        Schedule schedule = scheduleDAO.getSchedule(id);
        request.setAttribute("schedule", schedule);
        scheduleDAO.closeConnection();
        settingDAO.closeConnection();   
        request.setAttribute("website_url", request.getContextPath());
        request.getRequestDispatcher("scheduleDetail.jsp").forward(request, response);
    }

    private void scheduleDetailPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ScheduleDAO scheduleDAO = new ScheduleDAO();
        Schedule schedule = new Schedule();
        try {
            schedule.setSchedule_id(Integer.parseInt(request.getParameter("id")));

        } catch (Exception e) {
        }
        schedule.setTopic(request.getParameter("topic"));
        Setting slot = new Setting();
        try {
            slot.setSetting_id(Integer.parseInt(request.getParameter("slot")));
        } catch (Exception e) {
        }
        schedule.setSlot(slot);
        Setting room = new Setting();
        try {
            room.setSetting_id(Integer.parseInt(request.getParameter("room")));
        } catch (Exception e) {
        }
        schedule.setRoom(room);
        schedule.setDate(Date.valueOf(request.getParameter("date")));
        schedule.setFrom_time(Time.valueOf(request.getParameter("fromTime") + ":00"));
        schedule.setTo_time(Time.valueOf(request.getParameter("toTime") + ":00"));
        if (request.getParameter("status").equals("1")) {
            schedule.setStatus(true);
        } else {
            schedule.setStatus(false);
        }
        scheduleDAO.updateSchedule(schedule);
        scheduleDAO.closeConnection();
        response.sendRedirect(request.getContextPath() + "/Dashboard/schedule-detail?scheduleId=" + schedule.getSchedule_id() + "&save=TRUE");
    }

    private void scheduleAddGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ScheduleDAO scheduleDAO = new ScheduleDAO();
        ClassDAO classDAO = new ClassDAO();
        
        User user = null;
        HttpSession session = request.getSession(false);
        if (session != null) {
            user = (User) session.getAttribute("acc");
        } else {

        }
        SettingDAO settingDAO = new SettingDAO();
        ArrayList<Setting> slots = settingDAO.getSlotList();
        ArrayList<Setting> rooms = settingDAO.getRoomList();
        request.setAttribute("slot_list", slots);
        request.setAttribute("room_list", rooms);
        ArrayList<Class> classList = classDAO.getClassList(user.getId());
        request.setAttribute("class_list", classList);
        scheduleDAO.closeConnection();
        classDAO.closeConnection();
        request.getRequestDispatcher("scheduleAdd.jsp").forward(request, response);
    }

    private void scheduleAddPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ScheduleDAO scheduleDAO = new ScheduleDAO();
        Schedule schedule = new Schedule();
        schedule.setTopic(request.getParameter("topic"));
        Setting slot = new Setting();
        try {
            slot.setSetting_id(Integer.parseInt(request.getParameter("slot")));
        } catch (Exception e) {
        }
        Class class_ = new Class();
        try {
            class_.setClass_id(Integer.parseInt(request.getParameter("class")));
            schedule.setClassId(class_);
        } catch (Exception e) {
        }
        schedule.setSlot(slot);
        schedule.setClassId(class_);
        Setting room = new Setting();
        try {
            room.setSetting_id(Integer.parseInt(request.getParameter("room")));
        } catch (Exception e) {
        }
        schedule.setRoom(room);
        schedule.setDate(Date.valueOf(request.getParameter("date")));
        schedule.setFrom_time(Time.valueOf(request.getParameter("fromTime") + ":00"));
        schedule.setTo_time(Time.valueOf(request.getParameter("toTime") + ":00"));
        if (request.getParameter("status").equals("1")) {
            schedule.setStatus(true);
        } else {
            schedule.setStatus(false);
        }
        scheduleDAO.addSchedule(schedule);
        scheduleDAO.closeConnection();
        response.sendRedirect(request.getContextPath() + "/Dashboard/schedule-list?classId" + schedule.getClassId().getClass_id() + "&add=TRUE");
    }

}
