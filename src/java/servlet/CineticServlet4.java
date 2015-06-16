/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.Movie;
import beans.Room;
import database.DB_Access;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.LanguageSelector;

/**
 *
 * @author Laura
 */
@WebServlet(name = "CineticServlet4", urlPatterns = {"/CineticServlet4"})
public class CineticServlet4 extends HttpServlet {

    LinkedList<Movie> movieList = null;
    LinkedList<Room> roomList = null;
    LinkedList<String> reservateSeats = new LinkedList<>();
    DB_Access dba = null;
    String lang;
    
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            dba = DB_Access.getTheInstance();
            movieList = dba.getMovieList("","");
            roomList = dba.getRoomList();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CineticServlet3.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(CineticServlet3.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
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
            s.setAttribute("movieList", movieList);
            s.setAttribute("roomList", roomList);
            s.setAttribute("reservateSeats", reservateSeats);
            
            request.getRequestDispatcher("/jsp/"+lang+"/ReservationPage.jsp").forward(request, response);
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
        System.out.println(str);
        reservateSeats.add(str);
        
        
        
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
