package it.com.zhehang.servlet;

import it.com.zhehang.dao.UserDaoImpl;
import it.com.zhehang.jdbutil.JBUtils;
import it.com.zhehang.jdbutil.ResponseUtils;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
/**
 * Servlet implementation class UserDeleteServlet
 */
public class UserDeleteServlet extends HttpServlet {
	UserDaoImpl userDao=new UserDaoImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String userid=request.getParameter("userid");
		Connection coon = null;
		try {
			coon = JBUtils.getConnection();
			JSONObject result=new JSONObject();
			int count = userDao.deleteUser(coon, userid);
			if(count > 0)
			{
				result.put("success", "true");
				result.put("count", count);
			}else{
				result.put("errorMsg", "删除失败");
			}
			ResponseUtils.write(response, result);
		} catch (Exception e) {
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