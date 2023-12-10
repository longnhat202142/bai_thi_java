package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.giohangthibean;
import bean.khachhangthibean;
import bo.chitietthibo;
import bo.giohangthibo;
import bo.hoadonthibo;

/**
 * Servlet implementation class xacnhanthicontroller
 */
@WebServlet("/xacnhanthicontroller")
public class xacnhanthicontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xacnhanthicontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			khachhangthibean kh = (khachhangthibean) session.getAttribute("dn");
			if (kh==null){ 
				
				RequestDispatcher rd = request.getRequestDispatcher("khachhangthicontroller");
				rd.forward(request, response);
			}
			else {
				giohangthibo gio = (giohangthibo) session.getAttribute("ggiay");
				if (gio!=null) { 
					
					hoadonthibo hdbo = new hoadonthibo();
					hdbo.Them(kh.getMakh());
					long mahoadon = hdbo.getMaxhd();
					chitietthibo chitiet = new chitietthibo();
					for (giohangthibean g :gio.dsgiohang)
					{
						chitiet.Themchitiet(g.getMagiay(), g.getSoluongmua(), mahoadon);
					}
					// Xoa gio hang
					session.removeAttribute("ggiay");
					response.sendRedirect("thanhtoanthicontroller");
					}
				else {	 
					response.sendRedirect("thanhtoanthicontroller");
				}
			}
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
