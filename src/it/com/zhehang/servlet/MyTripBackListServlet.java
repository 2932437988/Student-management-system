package it.com.zhehang.servlet;

import it.com.zhehang.bean.Tripback;
import it.com.zhehang.dao.TripbackDaoImpl;
import it.com.zhehang.jdbutil.JBUtils;
import it.com.zhehang.jdbutil.JsonUtils;
import it.com.zhehang.jdbutil.ResponseUtils;
import it.com.zhehang.jdbutil.StringUtils;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class UserTripBackServlet
 */
public class MyTripBackListServlet extends HttpServlet {
	TripbackDaoImpl tripbackDao = new TripbackDaoImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyTripBackListServlet() {
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
		response.setCharacterEncoding("utf-8");
		String userid=request.getParameter("userid");
		Tripback tripback = new Tripback();
		tripback.setUserid(userid);
		Connection coon = null;
		try {
			
			coon = JBUtils.getConnection();
			JSONObject result = new JSONObject();
			JSONArray jsonArray=JsonUtils.formatRsToJsonArray(tripbackDao.MyList(coon,tripback));
			result.put("rows", jsonArray);
			
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
