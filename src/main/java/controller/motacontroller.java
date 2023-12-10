package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.giaybean;
import bo.giaybo;

/**
 * Servlet implementation class motacontroller
 */
@WebServlet("/motacontroller")
public class motacontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public motacontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			giaybo gbo = new giaybo();
			
			HttpSession session = request.getSession();
			String magiay=request.getParameter("magiay");
			String giagiay=request.getParameter("giagiay");
			String anhgiay=request.getParameter("anhgiay");
			String tengiay=request.getParameter("tengiay");
				session.setAttribute("tengiay", tengiay);
				session.setAttribute("magiay",magiay);
				session.setAttribute("giagiay", Long.parseLong(giagiay));
				session.setAttribute("anhgiay", anhgiay);
			
			RequestDispatcher rd = request.getRequestDispatcher("mota.jsp");
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
