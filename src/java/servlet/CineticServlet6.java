/*
 * Author:      Sarah Resch
 * Date:        16.06.2015
 * Projectname: Cinetic
 */
package servlet;

import beans.ShowAnzeige;
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

@WebServlet(name = "CineticServlet6", urlPatterns = {"/CineticServlet6"})
public class CineticServlet6 extends HttpServlet {

    String lang;
    DB_Access dba = null; 
    LinkedList<String> reservatedSeat;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config); //To change body of generated methods, choose Tools | Templates.
        try {
            dba = DB_Access.getTheInstance();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CineticServlet6.class.getName()).log(Level.SEVERE, null, ex);
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
            ShowAnzeige sh = (ShowAnzeige) s.getAttribute("choosenShow");
            int resID = (Integer)s.getAttribute("reservationID");
            
            try {
                dba.newReservation( resID, (String) s.getAttribute("username"), (String) s.getAttribute("tel"), sh.getShowid(), sh.getRoomName(), (LinkedList<String>) s.getAttribute("reservateSeats"));
                reservatedSeat = (LinkedList<String>) s.getAttribute("reservateSeats");
                reservatedSeat.clear();
                s.setAttribute("reservateSeats", reservatedSeat);               
            } catch (Exception ex) {
                Logger.getLogger(CineticServlet6.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("/jsp/"+lang+"/RealLastPage.jsp").forward(request, response);
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
