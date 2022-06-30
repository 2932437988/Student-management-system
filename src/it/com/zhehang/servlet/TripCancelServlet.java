package it.com.zhehang.servlet;

import it.com.zhehang.bean.Trip;
import it.com.zhehang.dao.TripDaoImpl;
import it.com.zhehang.jdbutil.DateUtils;
import it.com.zhehang.jdbutil.JBUtils;
import it.com.zhehang.jdbutil.ResponseUtils;
import it.com.zhehang.jdbutil.StringUtils;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class TripCancelServlet
 */
public class TripCancelServlet extends HttpServlet {
	TripDaoImpl tripDao = new TripDaoImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TripCancelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String userid=request.getParameter("userid");
		String subtime=request.getParameter("subtime");
		String category=request.getParameter("category");
		String approve=request.getParameter("approve");
		String opinion=request.getParameter("opinion");
		Trip trip=null;
		try {
			trip=new Trip(userid,DateUtils.formatString(subtime, "yyyy-MM-dd HH:mm:ss"),Integer.parseInt(category),Integer.parseInt(approve),opinion);
			System.out.println("userid:");
			System.out.println(trip.getUserid());
			System.out.println("subtime:");
			System.out.println(trip.getSubtime());
			System.out.println("category:");
			System.out.println(trip.getCategory());
			System.out.println("approve:");
			System.out.println(trip.getApprove());
			System.out.println("opinion:");
			System.out.println(trip.getOpinion());
		}catch(Exception e1) {
			e1.printStackTrace();
		}
		Connection coon = null;
		try {
			
			coon=JBUtils.getConnection();
			int cancelNum=0;
			JSONObject result = new JSONObject();
			cancelNum=tripDao.modifyTrip(coon, trip);
			System.out.println("cancelNum");
			System.out.println(cancelNum);
			if(cancelNum>0) {
				result.put("success", "true");
			}else {
				result.put("errorMsg", "取消失败");
			}
			ResponseUtils.write(response, result);
		}catch(Exception e) {
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