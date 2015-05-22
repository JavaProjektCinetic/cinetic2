/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.Movie;
import database.DB_Access;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Laura
 */
@WebServlet(name = "CineticServlet", urlPatterns = {"/CineticServlet"})
public class CineticServlet extends HttpServlet {

    DB_Access dba = null;
    LinkedList<String> genreListE = null;
    LinkedList<String> genreListD = null;
//    HashMap<Integer,String> desc = null;
//    HashMap<Integer,String> title = null;
//    HashMap<Integer,String> path = null;
//    HashMap<Integer,Integer> rate = null;
    
    LinkedList<Movie> movieList = null;
    LinkedList<Movie> actualList = null;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            dba = DB_Access.getTheInstance();
            genreListE = dba.getGenres("e");
            genreListD = dba.getGenres("d");
//            desc = dba.getDesc();
//            title = dba.getTitle();
//            path = dba.getPath();
//            rate=dba.getRate();
            
            movieList = dba.getMovieList("","");
            actualList = dba.getMovieList("","");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CineticServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(CineticServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            //String path = this.getServletContext().getRealPath("jsp/en/WelcomePage.jsp");
            
            String t = request.getParameter("titlefilter");
            String g = request.getParameter("genrefilter");
            if (t == null) {
                t = "";
            }
            if (g == null) {
                g = "";
            }
            try {
                actualList.clear();
                actualList = dba.getMovieList(t, g);
            } catch (Exception ex) {
                System.out.println(ex.toString());
            }
            
            System.out.println("######## \nt: " + t + "\ng: " + g+"\n");
            for (Movie m : actualList) {
                System.out.println(m.getTitleEnglish());
            }
            System.out.println("Filtered List size: " + actualList.size());
            request.setAttribute("movieList", movieList);
            request.setAttribute("actualList", actualList);
            request.setAttribute("genreListE", genreListE);
            request.setAttribute("genreListD", genreListD);
            //request.setAttribute("movieList",movieList);
            //response.sendRedirect("/jsp/en/WelcomePage.jsp");
            request.getRequestDispatcher("/jsp/en/WelcomePage.jsp").forward(request, response);
            //request.getRequestDispatcher("/jsp/en/MoviePage.jsp").forward(request, response);
            //request.getRequestDispatcher(path).forward(request, response);
            
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
