package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangthibean;
import bo.khachhangthibo;

/**
 * Servlet implementation class khachhangthicontroller
 */
@WebServlet("/khachhangthicontroller")
public class khachhangthicontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public khachhangthicontroller() {
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
			
			// Phan dang nhap
			HttpSession session = request.getSession();
			String tendn=request.getParameter("txttendangnhap");
			String pass =request.getParameter("txtpassword");
			khachhangthibo khbo = new  khachhangthibo();
			khachhangthibean khbean = new khachhangthibean();
			
			if (tendn!=null && pass!=null) {
				khbean =khbo.kiemtradangnhap(tendn, pass);
				if (khbean!=null) {
					session.setAttribute("dn", khbean);
					session.setAttribute("dangnhaplayten", khbean.getHoten());
					response.sendRedirect("giaycontroller");	
				}
				else {
					response.sendRedirect("giaycontroller?ktpass=1");	
					
				}
			}
			
			// Phan dang ki
			String hoten=request.getParameter("txtht");
			String diachi=request.getParameter("txtdc");
			String sodienthoai=request.getParameter("txtsdt");
			String email=request.getParameter("txtemail");
			String nhaptendangnhap=request.getParameter("txtun");
			String matkhaulan1=request.getParameter("txtpasslan1");
			String matkhaulan2=request.getParameter("txtpasslan2");
			if (hoten!=null && diachi!=null && sodienthoai!=null &&
			email!=null &&nhaptendangnhap!=null &&matkhaulan1!=null &&matkhaulan2!=null) 
			{
				if (matkhaulan1.equals(matkhaulan2))
				{
				int ktdangki =khbo.kiemtradangki(hoten, diachi, sodienthoai, email, nhaptendangnhap, matkhaulan1);
					if (ktdangki==1) 
					{
						response.sendRedirect("giaycontroller");
					}
				}
			
				else 
				{
					RequestDispatcher rd = request.getRequestDispatcher("trangchu.jsp");
					rd.forward(request, response);
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
