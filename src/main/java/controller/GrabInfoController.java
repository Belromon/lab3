package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(urlPatterns = "/get/arrays")
public class GrabInfoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String matrix = req.getParameter("matrix");
        String criteriaArray = req.getParameter("criteriaArray");
        String rows = req.getParameter("rows");
        String columns = req.getParameter("columns");
        String optDirString = req.getParameter("optDir");

        boolean optDir = optDirString.equals("on");
        String[] amountOfReceivedMatrixElements = matrix.split(",");



        boolean[] ar = convertStringToBoolArray(criteriaArray);



    }

    public boolean[] convertStringToBoolArray(String criteriaArray){
        String[] splitedCriteriaArray = criteriaArray.split(",");
        boolean[] boolCriteriaArray = new boolean[splitedCriteriaArray.length];

        for (int i = 0; i < splitedCriteriaArray.length; i++) {
            boolCriteriaArray[i] = splitedCriteriaArray[i].equals("1");
        }
        return boolCriteriaArray;
    }
}
