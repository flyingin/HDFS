package Servlet;

import File.HdfsDAO;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletResponse;
/**
 * Created by yml on 16-7-2.
 */
public class ListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String filePath = new String(request.getParameter("filePath").getBytes("ISO-8859-1"),"GB2312");
        HdfsDAO hdfs = new HdfsDAO();
        FileStatus[] list = hdfs.ls(filePath);
        request.setAttribute("list",list);
        request.getRequestDispatcher("index.jsp").forward(request,response);

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
