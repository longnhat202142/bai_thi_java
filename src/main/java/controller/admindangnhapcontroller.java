package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class admindangnhapcontroller
 */
@WebServlet("/admindangnhapcontroller")
public class admindangnhapcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admindangnhapcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
					String txttenadmin=request.getParameter("txttenadmin");
					String txtpasswordadmin=request.getParameter("txtpasswordadmin");
					String addangnhap=request.getParameter("addangnhap");
					if(addangnhap!=null) {
						if(txttenadmin!=null&&txtpasswordadmin!=null) {
							if(txttenadmin.equals("admin")&& txtpasswordadmin.equals("123")) {
								response.sendRedirect("adminloaicontroller");
							}
							else {
								response.sendRedirect("giaycontroller?ktpass=1");
							}
						}
					}
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
