package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangthibo;

/**
 * Servlet implementation class suagiaycontroller
 */
@WebServlet("/suagiaycontroller")
public class suagiaycontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public suagiaycontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String mgiay = request.getParameter("mgiay");
			String soluongmoi = request.getParameter("Sua");
		
			HttpSession session = request.getSession();
			if (mgiay!=null && soluongmoi!=null) {
				giohangthibo g = new giohangthibo();
				g =(giohangthibo) session.getAttribute("ggiay");
				g.SuaHangGiay(mgiay, Long.parseLong(soluongmoi));
				session.setAttribute("ggiay", g);
				//request.setAttribute("ggiay", g);
			}
			RequestDispatcher rd = request.getRequestDispatcher("htgiogiay.jsp");
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
