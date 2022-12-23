/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dao.DAO;
import entity.Account;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author datla
 */
@WebServlet(name = "CategoryControl", urlPatterns = {"/category"})
public class CategoryControl extends HttpServlet {

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
        DAO dao = new DAO();
        
        
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        List<Category> listC = dao.getAllCategory();
        String cateID = request.getParameter("cid");
        Product last = dao.getLast();
       

        if (a == null || a.getIsAdmin() == 1||(a.getIsAdmin()==0&&a.getIsSell()==0)) {
            listC = dao.getAllCategory();
             last = dao.getLast();
//            request.setAttribute("listP", dao.getAllproduct());
            List<Product> list = dao.getProductByCID(cateID);
            request.setAttribute("listCC", listC);
            request.setAttribute("listP", list);
            request.setAttribute("p", last);
            request.getRequestDispatcher("Home.jsp").forward(request, response);
        } else {
            listC = dao.getAllCategory();
            int sid = a.getId();
             last = dao.getLast();
            List<Product> list = dao.getProductByCIDandSellID(Integer.parseInt(cateID),sid);
            //b2: set data to jsp
            request.setAttribute("listP", list);
            request.setAttribute("listCC", listC);

            request.setAttribute("p", last);
            request.getRequestDispatcher("Home.jsp").forward(request, response);
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
