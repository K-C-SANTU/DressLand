package com.servlets;
import com.classes.fileupload;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class kc extends HttpServlet 
{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter())
        {           
            if(request.getParameter("fileupload")!=null)
            {
                try
                {
                    Part file1 = null;
                    for(int i =1;i<=3; i++)
                    {
                        file1 = request.getPart("file1"+i);
                        if(file1 != null)
                        {
                            fileupload f = new fileupload();
                            String ss = f.fileupload(file1, "file"+i, "santosh");
                            System.out.println(ss);
                        }
                        else
                        {
                            System.out.println("santosh");
                        }
                    }
                    request.getRequestDispatcher("santosh.jsp").forward(request, response);
                }
                catch(Exception e)
                {
                    System.out.println("santosh");
                }
            }
            else
            {
                request.getRequestDispatcher("santosh.jsp").forward(request, response);
            }
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() 
    {
        return "Short description";
    }

}
