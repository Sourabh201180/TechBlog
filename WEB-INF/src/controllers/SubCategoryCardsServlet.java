package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.SubCategory;

@WebServlet("/sub_category_cards.do")
public class SubCategoryCardsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException {
        HttpSession session = request.getSession();
        
        Integer cId = Integer.parseInt(request.getParameter("cId"));

        ArrayList<SubCategory> subCats = SubCategory.CollectAllSubsequentSubCategories(cId);
        session.setAttribute("subCats", subCats);
        
        request.getRequestDispatcher("sub_category_cards.jsp").forward(request, response);
    }  
}