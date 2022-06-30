package it.com.zhehang.servlet;

import it.com.zhehang.bean.User;
import it.com.zhehang.dao.UserDaoImpl;
import it.com.zhehang.jdbutil.JBUtils;
import it.com.zhehang.jdbutil.StringUtils;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class LoginServlet extends HttpServlet {
	UserDaoImpl userDao = new UserDaoImpl();
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String username = request.getParameter("userid");
		String password = request.getParameter("userpasswd");
		
		
		User user=new User(username,password);
		Connection coon=null;
		try {
			coon=JBUtils.getConnection();
			User currentUser=userDao.login(coon, user);
			if(currentUser==null){
				request.setAttribute("error", "用户名或密码错误！");
				// 服务器跳转
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}else{
				// 客户端跳转
				HttpSession session = request.getSession();
				session.setAttribute("currentUserid", currentUser.getUserid());
				
				switch(currentUser.getUserlevel()) {
					case 0:
						response.sendRedirect("main.jsp");
					case 1:
						response.sendRedirect("Teacher.jsp");
					case 2:
						response.sendRedirect("Admin.jsp");
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				JBUtils.closeConnection(coon, null, null);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
