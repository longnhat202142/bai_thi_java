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
import bean.loaigiaybean;
import bo.giaybo;
import bo.loaigiaybo;

/**
 * Servlet implementation class giaycontroller
 */
@WebServlet("/giaycontroller")
public class giaycontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public giaycontroller() {
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
		//HttpSession session = request.getSession();
		// Phần lấy giày
		giaybo gbo = new giaybo();
		ArrayList<giaybean> dsgiay = gbo.getgiay(); // Lay toan bo giay
		String maloai = request.getParameter("maloai");
		String keytk = request.getParameter("txttim");
		if (maloai!=null) 
			dsgiay= gbo.timmagiay(maloai);
		else if (keytk!=null)
			dsgiay=gbo.timtheoten(keytk);
		
		// Phần lấy loại giày
		loaigiaybo lgiaybo = new loaigiaybo();
		ArrayList<loaigiaybean> dsloaigiay = lgiaybo.getloai();
		
		// Chuyển tiếp về trangchu.jsp
		request.setAttribute("dsloaigiay", dsloaigiay);
		request.setAttribute("dsgiay", dsgiay);
		
		RequestDispatcher rd = request.getRequestDispatcher("trangchu.jsp");
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
