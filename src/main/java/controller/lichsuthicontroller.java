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

import bean.khachhangthibean;
import bean.thanhtoanthibean;
import bean.xacnhanthibean;
import bo.lichsuthibo;

/**
 * Servlet implementation class lichsuthicontroller
 */
@WebServlet("/lichsuthicontroller")
public class lichsuthicontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lichsuthicontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String btndathang = request.getParameter("btndathang");
			lichsuthibo lsbo = new lichsuthibo();
			HttpSession session = request.getSession();
			khachhangthibean khbean;
			if (btndathang!=null) {
				ArrayList<xacnhanthibean> dshanglichsu;
				khbean = (khachhangthibean) session.getAttribute("dn");
				long makh = khbean.getMakh();
				dshanglichsu = lsbo.lichsumuahang(makh);
				request.setAttribute("dshanglichsu", dshanglichsu);
			}
			else {
				ArrayList<xacnhanthibean> dshanglichsu;
				khbean = (khachhangthibean) session.getAttribute("dn");
				long makh = khbean.getMakh();
				dshanglichsu = lsbo.lichsumuahang(makh);
				request.setAttribute("dshanglichsu",dshanglichsu);
			}
			RequestDispatcher rd =request.getRequestDispatcher("lichsuthi.jsp");
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
