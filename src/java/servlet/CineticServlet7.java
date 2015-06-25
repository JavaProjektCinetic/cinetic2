/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.LanguageSelector;

/**
 *
 * @author Sarah
 */
@WebServlet(name = "CineticServlet7", urlPatterns = {"/CineticServlet7"})
public class CineticServlet7 extends HttpServlet {

    LinkedList<String> reservateSeats = new LinkedList<>();
    String lang;
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
            /* TODO output your page here. You may use following sample code. */
            lang = LanguageSelector.selectLang(request, response);
            HttpSession s = request.getSession();
            s.setAttribute("reservateSeats", reservateSeats);
            request.getRequestDispatcher("/jsp/" + lang + "/ReservationPage.jsp").forward(request, response);
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
        String str = request.getParameter("room");
        String stri = request.getParameter("glamour");
        String stra = request.getParameter("cozy");
        if (reservateSeats.contains(str)) {
            reservateSeats.remove(str);
        } else {
            reservateSeats.add(str);
        }

        if (reservateSeats.contains(stri)) {
            reservateSeats.remove(stri);
        } else {
            reservateSeats.add(stri);
        }

        if (reservateSeats.contains(stra)) {
            reservateSeats.remove(stra);
        } else {
            reservateSeats.add(stra);
        }
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
