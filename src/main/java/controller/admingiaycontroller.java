package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.giaybean;
import bo.giaybo;

/**
 * Servlet implementation class admingiaycontroller
 */
@WebServlet("/admingiaycontroller")
public class admingiaycontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admingiaycontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			giaybo gbo = new giaybo();
			String chon = request.getParameter("btnchon");
			String xoa = request.getParameter("btnxoa");
			String mgiay = request.getParameter("txtmagiay");
			String tgiay = request.getParameter("txttenloai");
			String sl =request.getParameter("txtsoluong");
			String gia  =request.getParameter("txtgia");
			String maloai  =request.getParameter("txtmaloai");
			String anh  =request.getParameter("txtanh");
			
			ArrayList<giaybean> dsgiay = gbo.getgiay();
			if (request.getParameter("them")!=null) {
				gbo.themgiay(mgiay, tgiay, Long.parseLong(sl),Long.parseLong(gia), maloai, anh);
			}
			else if (request.getParameter("capnhatgiay")!=null) {
				gbo.suagiay(mgiay, tgiay);
			}
			else {
				
				String magiaymoi = request.getParameter("mg");
				String tengiay = request.getParameter("t");
				String sluong = request.getParameter("sl");
				String g = request.getParameter("gia");
				String ml = request.getParameter("m");
				String a = request.getParameter("anh");
				if (xoa!=null) {
					gbo.xoagiay(magiaymoi);
				}
				else if (chon!=null) {
					request.setAttribute("mg",magiaymoi);
					request.setAttribute("t",tengiay);
					request.setAttribute("sl", sluong);
					request.setAttribute("gia", g);
					request.setAttribute("anh", a);
					request.setAttribute("m",ml);
				
				}

			}
			request.setAttribute("dsgiay",gbo.getgiay());
			RequestDispatcher rd = request.getRequestDispatcher("admingiay.jsp");
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
