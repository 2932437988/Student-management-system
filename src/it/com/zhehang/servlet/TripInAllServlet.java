package it.com.zhehang.servlet;

import it.com.zhehang.bean.Page;
import it.com.zhehang.bean.Trip;
import it.com.zhehang.dao.TripDaoImpl;
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
 * Servlet implementation class TripOutAllServlet
 */
public class TripInAllServlet extends HttpServlet {
	TripDaoImpl tripDao = new TripDaoImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TripInAllServlet() {
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
		Trip trip = new Trip();
		trip.setCategory(0);
		System.out.println(trip.getCategory());
		String page = request.getParameter("page");
		String rows = request.getParameter("rows");
		Page newPage = new Page(Integer.parseInt(page),Integer.parseInt(rows));
		Connection coon = null;
		try {
			
			coon = JBUtils.getConnection();
			JSONObject result = new JSONObject();
			JSONArray jsonArray=JsonUtils.formatRsToJsonArray(tripDao.tripAllIn(coon, newPage,trip));
			
			int total = tripDao.tripAllCount(coon,trip);
			result.put("total", total);
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