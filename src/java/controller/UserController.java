/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SettingDAO;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.User;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UserController extends HttpServlet {

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
        if (url.equals("/Dashboard/user-list")) {
            userListGet(request, response);
        }
        if (url.equals("/Dashboard/user-detail")) {
            userDetailGet(request, response);
        }
        if (url.equals("/Dashboard/user-add")) {
            userAddGet(request, response);
        }
    }

    private void userListGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO user_DAO = new UserDAO();
        SettingDAO settingDAO = new SettingDAO();
        if (request.getParameter("action") != null) {
            String action = request.getParameter("action");
            if (action.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("userId"));
                String count = "&action=delete&userId=" + id;
                user_DAO.deleteAcc(id);
                String completeURL = request.getRequestURL().toString() + "?" + request.getQueryString().substring(0,request.getQueryString().length() - count.length() );
                user_DAO.closeConnection();
                settingDAO.closeConnection();
                response.sendRedirect(completeURL);
            }
        } else {
            int page = 1;
            int totalpage = 1;
            int sort = 0;
            boolean order = true;
            ArrayList<User> user_list;
            String linkUrl = request.getRequestURL().toString() + "?";
            request.setAttribute("website_url", request.getContextPath());
            boolean add = false;
            if (request.getParameter("add") != null && request.getParameter("add").equalsIgnoreCase("true")) {
                add = true;
            }
            request.setAttribute("add", add);
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (Exception ex) {
            }
            String search = request.getParameter("search");
            if (search != null) {
                linkUrl += "&search=";
                String[] searchs = search.split(" ");
                for (String search1 : searchs) {
                    linkUrl += "+" + search1;
                }
                linkUrl = linkUrl.substring(0, linkUrl.length() - 2);
            }
            request.setAttribute("search", search);
            try {
                sort = Integer.parseInt(request.getParameter("sort"));
                linkUrl += "&sort=" + sort;
            } catch (Exception e) {
            }
            if (request.getParameter("order") != null) {
                if (request.getParameter("order").equalsIgnoreCase("false")) {
                    order = false;
                    linkUrl += "&order=FALSE";
                } else {
                    linkUrl += "&order=TRUE";
                }
            }
            request.setAttribute("order", order);
            request.setAttribute("sort", sort);
            user_list = user_DAO.getUserListPaging(page, search, sort, order);
            totalpage = user_DAO.countPageSearch(search);
            request.setAttribute("totalpage", totalpage);
            if (page > totalpage) {
                request.setAttribute("page", totalpage);
                page = totalpage;
            } else {
                request.setAttribute("page", page);
            }
            request.setAttribute("url", linkUrl + "&");
            request.setAttribute("user_list", user_list);
            user_DAO.closeConnection();
            settingDAO.closeConnection();
            request.getRequestDispatcher("userList.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getRequestURI().substring(request.getContextPath().length());
        System.out.println(url);
        if (url.equals("/Dashboard/user-detail")) {
            userDetailPost(request, response);
        }
        if (url.equals("/Dashboard/user-add")) {
            userAddPost(request, response);
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

    private void userDetailGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        SettingDAO settingDAO = new SettingDAO();
        request.setAttribute("website_url", request.getContextPath());
        int id = 0;
        try {
            id = Integer.parseInt(request.getParameter("userId"));
        } catch (Exception e) {
        }
        User user = userDAO.getUser(id);
        request.setAttribute("user", user);
        boolean save = false;
        request.setAttribute("role_list", settingDAO.getRoleList());
        if (request.getParameter("save") != null && request.getParameter("save").equalsIgnoreCase("true")) {
            save = true;
        }
        request.setAttribute("save", save);
        userDAO.closeConnection();
        settingDAO.closeConnection();
        request.getRequestDispatcher("userDetail.jsp").forward(request, response);
    }

    private void userDetailPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        try {
            UserDAO userDAO = new UserDAO();
            SettingDAO settingDAO = new SettingDAO();
            User user = new User();
            request.setAttribute("website_url", request.getContextPath());
            user.setId(Integer.parseInt(request.getParameter("id")));
            user.setFull_name(request.getParameter("fullname"));
            user.setMobile(request.getParameter("mobile"));
            user.setGmail(request.getParameter("gmail"));
            String status = request.getParameter("status");
            if (status.equals("1")) {
                user.setStatus(1);
            } else {
                if (status.equals("0")) {
                    user.setStatus(0);
                } else {
                    user.setStatus(-1);
                }

            }
            int role = Integer.parseInt(request.getParameter("role"));
            user.setSetting_id(role);
            settingDAO.updateUserRole(user.getId(), user.getSetting_id());
            user.setNote(request.getParameter("note"));
            userDAO.updateUser(user);
            userDAO.closeConnection();
            settingDAO.closeConnection();
            response.sendRedirect(request.getContextPath() + "/Dashboard/user-detail?userId=" + user.getId() + "&save=TRUE");
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/Dashboard/user-detail?userId=" + id);
        }
    }

    private void userAddPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            UserDAO userDAO = new UserDAO();
            SettingDAO settingDAO = new SettingDAO();
            User user = new User();
            request.setAttribute("website_url", request.getContextPath());
            user.setFull_name(request.getParameter("fullname"));
            user.setMobile(request.getParameter("mobile"));
            user.setGmail(request.getParameter("gmail"));
            String status = request.getParameter("status");
            if (status.equals("1")) {
                user.setStatus(1);
            } else {
                if (status.equals("0")) {
                    user.setStatus(0);
                } else {
                    user.setStatus(-1);
                }
            }
            int role = Integer.parseInt(request.getParameter("role"));
            user.setSetting_id(role);
            settingDAO.addUserRole(user.getId(), user.getSetting_id());
            user.setNote(request.getParameter("note"));
            userDAO.addUser(user);
            userDAO.closeConnection();
            settingDAO.closeConnection();
            response.sendRedirect(request.getContextPath() + "/Dashboard/user-list?" + "add=TRUE");
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/Dashboard/user-add");
        }
    }

    private void userAddGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        SettingDAO settingDAO = new SettingDAO();
        request.setAttribute("website_url", request.getContextPath());
        boolean save = false;
        request.setAttribute("role_list", settingDAO.getRoleList());
        if (request.getParameter("save") != null && request.getParameter("save").equalsIgnoreCase("true")) {
            save = true;
        }
        request.setAttribute("save", save);
        settingDAO.closeConnection();
        request.getRequestDispatcher("userAdd.jsp").forward(request, response);
    }
}
