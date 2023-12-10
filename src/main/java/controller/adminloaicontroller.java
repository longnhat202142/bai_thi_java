package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.loaigiaybean;
import bo.loaigiaybo;

/**
 * Servlet implementation class adminloaicontroller
 */
@WebServlet("/adminloaicontroller")
public class adminloaicontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminloaicontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			loaigiaybo lbo = new loaigiaybo();
			String chon = request.getParameter("btnchon");
			String xoa = request.getParameter("btnxoa");
			String ml = request.getParameter("txtmaloai");
			String tenloai = request.getParameter("txttenloai");
			
			ArrayList<loaigiaybean> dsloai = lbo.getloai();
			if (request.getParameter("themloai")!=null) {
				lbo.themloai(ml, tenloai);
			}
			else if (request.getParameter("capnhatloai")!=null) {
					lbo.sualoai(ml, tenloai);
			}
			else 
			{
				String maloai =request.getParameter("ml");
				if (xoa!=null) 
				{
					lbo.xoaloai(maloai);
				}
				else if (chon!=null)
				{
					request.setAttribute("ml",maloai);
					request.setAttribute("tenloai",lbo.timloai(maloai));
					
				}	
			}

			request.setAttribute("dsloaigiay",lbo.getloai());
			RequestDispatcher rd = request.getRequestDispatcher("adminloai.jsp");
			rd.forward(request, response);
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
