package it.com.zhehang.servlet;

import it.com.zhehang.bean.Trip;
import it.com.zhehang.dao.TripDaoImpl;
import it.com.zhehang.bean.Tripin;
import it.com.zhehang.dao.TripinDaoImpl;
import it.com.zhehang.jdbutil.DateUtils;
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
 * Servlet implementation class TripInDeleteServlet
 */
public class TripInDeleteServlet extends HttpServlet {
	TripDaoImpl tripDao = new TripDaoImpl();
	TripinDaoImpl tripinDao = new TripinDaoImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TripInDeleteServlet() {
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
		String subtime=request.getParameter("subtime");
		String category=request.getParameter("category");
		Trip trip=new Trip();
		Tripin tripin=new Tripin();
		Connection coon = null;
		try {
		trip.setUserid(userid);
		trip.setSubtime(DateUtils.formatString(subtime, "yyyy-MM-dd HH:mm:ss"));
		trip.setCategory(Integer.parseInt(category));
		tripin.setUserid(userid);
		tripin.setSubtime(DateUtils.formatString(subtime, "yyyy-MM-dd HH:mm:ss"));
		tripin.setCategory(Integer.parseInt(category));
		coon = JBUtils.getConnection();
		JSONObject result=new JSONObject();
		int count1=tripDao.deleteTrip(coon, trip);
		coon=null;
		coon = JBUtils.getConnection();
		int count2=tripinDao.deleteTripin(coon, tripin);
		if(count1>0&&count2>0) {
			result.put("success", "true");
			result.put("count", count1+count2);
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