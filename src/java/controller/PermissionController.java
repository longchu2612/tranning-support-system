/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.PermissionDAO;
import dao.SettingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Permission;
import model.Setting;

/**
 *
 * @author Giang Dong PC
 */
public class PermissionController extends HttpServlet {

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
            out.println("<title>Servlet PermissionController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PermissionController at " + request.getContextPath() + "</h1>");
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
        String url = request.getRequestURI().substring(request.getContextPath().length());
        if (url.equals("/Dashboard/permission")) {
            permissionGet(request, response);
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
        if (url.equals("/Dashboard/permission")) {
            permissionPost(request, response);
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

    private void permissionGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PermissionDAO permissionDAO = new PermissionDAO();
        SettingDAO settingDAO = new SettingDAO();
        ArrayList<Setting> roleList = settingDAO.getRoleList();
        request.setAttribute("role_list", roleList);
        int page = 1;
        int totalpage = 0;
        String path = request.getRequestURL().toString() + "?";
        request.setAttribute("url", path);
        request.setAttribute("website_url", request.getContextPath());
        totalpage = permissionDAO.countPage();
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (Exception ex) {

            request.setAttribute("totalpage", totalpage);
            if (page > totalpage) {
                request.setAttribute("page", totalpage);
                page = totalpage;
            } else {
                request.setAttribute("page", page);
            }
        }
        request.setAttribute("totalpage", totalpage);
        ArrayList<ArrayList<Permission>> permissionList = permissionDAO.getPermissionPaging(page);
        request.setAttribute("permission_list", permissionList);
        permissionDAO.closeConnection();
        settingDAO.closeConnection();
        request.getRequestDispatcher("permission.jsp").forward(request, response);
    }

    private void permissionPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
        PermissionDAO permissionDAO = new PermissionDAO();
        SettingDAO settingDAO = new SettingDAO();
        ArrayList<Setting> roles = settingDAO.getRoleList();
        ArrayList<Permission> permissionList = new ArrayList<>();      
        String[] screen_id = request.getParameterValues("screens_id");
        for (int i = 0; i < screen_id.length; i++) {
            String screenString = screen_id[i];
            for (Setting role : roles) {
                System.out.println(request.getParameter(screenString+"-"+ role.getSetting_id() + "-"+ "1")+request.getParameter(screenString+"-"+ role.getSetting_id() + "-"+ "2")+request.getParameter(screenString+"-"+ role.getSetting_id() + "-"+ "3")+request.getParameter(screenString+"-"+ role.getSetting_id() + "-"+ "4"));
                Permission permission = new Permission();
                Setting setting = new Setting();
                setting.setSetting_id(Integer.parseInt(screenString));
                setting.setType_id(role.getSetting_id());
                permission.setSetting(setting);
                if(request.getParameter(screenString+"-"+ role.getSetting_id() + "-"+ "1") == null){
                    permission.setGet_all_data(false);
                } else{
                    permission.setGet_all_data(true);
                }
                if(request.getParameter(screenString+"-"+ role.getSetting_id() + "-"+ "2") == null){
                    permission.setCan_add(false);
                } else{
                    permission.setCan_add(true);
                }
                if(request.getParameter(screenString+"-"+ role.getSetting_id() + "-"+ "3") == null){
                    permission.setCan_edit(false);
                } else{
                    permission.setCan_edit(true);
                }
                if(request.getParameter(screenString+"-"+ role.getSetting_id() + "-"+ "4") == null){
                    permission.setCan_delete(false);
                } else{
                    permission.setCan_delete(true);
                }
                permissionList.add(permission);
            }
        }
        permissionDAO.updatePermission(permissionList);
        permissionDAO.closeConnection();
        settingDAO.closeConnection();
        response.sendRedirect(request.getParameter("screen_url"));
    }

}
