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

import bo.giohangthibo;
import bo.thanhtoanthibo;

/**
 * Servlet implementation class thanhtoanthicontroller
 */
@WebServlet("/thanhtoanthicontroller")
public class thanhtoanthicontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public thanhtoanthicontroller() {
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
			HttpSession session = request.getSession();
			
			khachhangthibean khbean = (khachhangthibean) session.getAttribute("dn");
		//	khachhangthibean kh= (khachhangthibean) session.getAttribute("dangnnhaplayten");
			ArrayList<thanhtoanthibean> dsthanhtoan;
			if (khbean!= null) {	
				thanhtoanthibo ttbo = new thanhtoanthibo();
				System.out.println(khbean.getMakh());
				dsthanhtoan  = ttbo.getspthanhtoan(khbean.getMakh());
				request.setAttribute("dsthanhtoan", dsthanhtoan);
			}
//			if(session.getAttribute("ggiay")!= null){
//	      		giohangthibo gh = (giohangthibo)session.getAttribute("ggiay");
//	      		int n = gh.dsgiohang.size();
//	      		if(n>0){	
//	      			request.setAttribute("sh", (int)n);	      		
//	      		}else {
//	      			request.setAttribute("sh", (int)0);
//	      		}	     
//	      	}else {
//      			request.setAttribute("sh", (int)0);
//      		}
			
			System.out.print("\n333123123\n");
			RequestDispatcher rd =  request.getRequestDispatcher("thanhtoanthi.jsp");
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
