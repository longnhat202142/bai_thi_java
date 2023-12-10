package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangthibo;

/**
 * Servlet implementation class giogiaycontroller
 */
@WebServlet("/giogiaycontroller")
public class giogiaycontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public giogiaycontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String mgiay=request.getParameter("mgiay");
			String tgiay= request.getParameter("tgiay");
			String ggia = request.getParameter("gia");
			String ganh =request.getParameter("anh");
			
			String btnxoachon = request.getParameter("btnxoa");
			HttpSession session =request.getSession();
			if (mgiay!=null && tgiay!=null && ggia!=null && ganh!=null) {
				long gia = Long.parseLong(ggia);
				
				giohangthibo gh = new giohangthibo();
				// Neu chua tao session ("gh") thi tao ra
				if (session.getAttribute("ggiay")==null) {
					session.setAttribute("ggiay", gh);
				}
				
				// Luu session ra bien
				gh =(giohangthibo) session.getAttribute("ggiay");
				
				// Goi ham them
				gh.ThemHangGiay(mgiay, tgiay, 1, gia, ganh);
				session.setAttribute("ggiay", gh);
				response.sendRedirect("giogiaycontroller");
				return;
	
			}
			
			if (btnxoachon!=null) {
				Enumeration<String> d = request.getParameterNames();
				giohangthibo gh = new giohangthibo();
				gh =(giohangthibo) session.getAttribute("ggiay");
				while (d.hasMoreElements()) {
					String tam = d.nextElement();
					if (request.getParameter(tam).equals("on")) {
						gh.XoaHangGiay(tam);
					}
				}
				session.setAttribute("ggiay",(giohangthibo) gh);
			}
		RequestDispatcher rd = request.getRequestDispatcher("htgiogiay.jsp");
		rd.forward(request, response);
			//response.sendRedirect("htgiogiay.jsp");
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
