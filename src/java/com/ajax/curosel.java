package com.ajax;
import com.classes.connection;
import com.classes.filelocation;
import com.classes.fileupload;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
@MultipartConfig
public class curosel extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, JSONException, SQLException 
    {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        connection con = new connection();
        fileupload f = new fileupload();
        try (PrintWriter out = response.getWriter()) 
        {
            if(request.getParameter("enter")!=null)
            {
                String type =(String) request.getParameter("type");
                if(type.equals("women"))
                {
                    JSONObject obj = new JSONObject();
                    JSONArray array = new JSONArray();
                    ArrayList<filelocation> file = con.getloc(type, con);
                    if(file.size() > 0)
                    {
                        Iterator<filelocation> itr =file.iterator();
                        while(itr.hasNext())
                        {
                            JSONObject s = new JSONObject();
                            filelocation f1 = itr.next();
                            s.put("filename",f1.getlocation());
                            array.put(s);
                        }
                        
                        obj.put("jsondata", array);
                        out.print(obj); 
                    }
                    else
                    {
                        obj.put("status","No data");
                        out.print(obj);
                    }
                }
                if(type.equals("men"))
                {
                    JSONObject obj = new JSONObject();
                    JSONArray array = new JSONArray();
                    ArrayList<filelocation> file = con.getloc(type, con);
                    if(file.size() > 0)
                    {
                        Iterator<filelocation> itr =file.iterator();
                        while(itr.hasNext())
                        {
                            JSONObject s = new JSONObject();
                            filelocation f1 = itr.next();
                            s.put("filename",f1.getlocation());
                            array.put(s);
                        }
                        obj.put("jsondata", array);
                        out.print(obj);
                    }
                    else
                    {
                        obj.put("status","No data");
                        out.print(obj);
                    }
                }
                if(type.equals("kidboy"))
                {
                    JSONObject obj = new JSONObject();
                    JSONArray array = new JSONArray();
                    ArrayList<filelocation> file = con.getloc(type, con);
                    if(file.size() > 0)
                    {
                        Iterator<filelocation> itr =file.iterator();
                        while(itr.hasNext())
                        {
                            JSONObject s = new JSONObject();
                            filelocation f1 = itr.next();
                            s.put("filename",f1.getlocation());
                            array.put(s);
                        }
                        obj.put("jsondata", array);
                        out.print(obj);
                    }
                    else
                    {
                        obj.put("status","No data");
                        out.print(obj);
                    }
                }
                if(type.equals("kidgirl"))
                {
                    JSONObject obj = new JSONObject();
                    JSONArray array = new JSONArray();
                    ArrayList<filelocation> file = con.getloc(type, con);
                    if(file.size() > 0)
                    {
                        Iterator<filelocation> itr =file.iterator();
                        while(itr.hasNext())
                        {
                            JSONObject s = new JSONObject();
                            filelocation f1 = itr.next();
                            s.put("filename",f1.getlocation());
                            array.put(s);
                        }
                        obj.put("jsondata", array);
                        out.print(obj);
                    }
                    else
                    {
                        obj.put("status","No data");
                        out.print(obj);
                    }
                }
            }    
            if(request.getParameter("admincorosel")!=null)
            {
                String type = (String) request.getParameter("type");
                if(type.equals("hideshow"))
                {
                    String id = request.getParameter("id");
                    String status = request.getParameter("status");
                    int i = con.changecoroselstatus(id,status);
                    if(i>0)
                    {
                        out.print("success");
                    }
                    else
                    {
                        out.print("fail");
                    }
                }
                if(type.equals("delete"))
                {
                    String id = request.getParameter("id");
                    int i = con.deletecoroselid(id);
                    if(i>0)
                    {
                        out.print("success");
                    }
                    else
                    {
                        out.print("fail");
                    }
                }
                if(type.equals("fileupload"))
                {
                    String id = request.getParameter("id");
                    Part file = request.getPart("file");
                    String s = f.fileupload(file,f.getdate() , "images/carosel/main");
                    int i = con.updatecoroselimg(s,id);
                    out.print(s);
                }
            }
            if(request.getParameter("newfile")!=null)
            {
                Part file = request.getPart("file");
                String order = request.getParameter("orderno");
                String filename = f.fileupload(file, f.getdate(),  "images/carosel/main");
                int i = con.insertnewcorosel(filename,order);
                if(i>0)
                {
                    response.sendRedirect("Admin/adminpage?url=carousel");
                }
                else
                {
                    response.sendRedirect("Admin/adminpage?url=carousel");
                }
            }
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        try {
            processRequest(request, response);
        } catch (JSONException ex) {
            Logger.getLogger(curosel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(curosel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        try {
            processRequest(request, response);
        } catch (JSONException ex) {
            Logger.getLogger(curosel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(curosel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() 
    {
        return "Short description";
    }

}
