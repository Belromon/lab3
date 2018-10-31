package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/get/dimension")
public class BuildInputsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        String rows = req.getParameter("rows");
        String columns = req.getParameter("columns");

        resp.setContentType("text/plain");
        resp.getWriter().write(rows + " " + columns);
        resp.getWriter().flush();

    }
}
