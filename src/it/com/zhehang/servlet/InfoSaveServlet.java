package it.com.zhehang.servlet;

import it.com.zhehang.bean.Info;
import it.com.zhehang.dao.InfoDaoImpl;
import it.com.zhehang.jdbutil.DateUtils;
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
 * Servlet implementation class InfoSaveServlet
 */
public class InfoSaveServlet extends HttpServlet {
	InfoDaoImpl infoDao = new InfoDaoImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoSaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String userid=request.getParameter("userid");
		String username=request.getParameter("username");
		String userphone=request.getParameter("userphone");
		String usergender=request.getParameter("usergender");
		String userroom=request.getParameter("userroom");
		String userstatus=request.getParameter("userstatus");
		Info info = null;
		try {
			info = new Info(userid,username,userphone,usergender,userroom,userstatus);
		}catch (Exception e1) {
			e1.printStackTrace();
		}
		System.out.println(userid);
		info.setUserid(userid);
		Connection coon = null;
		try {
			coon=JBUtils.getConnection();
			int saveNum=0;
			JSONObject result=new JSONObject();
			JSONArray jsonArray=JsonUtils.formatRsToJsonArray(infoDao.findInfo(coon, info));
			result.put("rows", jsonArray);
			if(username!=null&&userphone!=null&&usergender!=null&&userroom!=null&&userstatus!=null) {
			if(jsonArray != null) {
				saveNum=infoDao.modifyInfo(coon, info);
			}else {
				saveNum=infoDao.addInfo(coon, info);
			}
			if(saveNum>0) {
				result.put("success", "true");
			}else {
				result.put("success", "true");
				result.put("errorMsg", "保存失败");
			}
			}
			ResponseUtils.write(response, result);
		}catch (Exception e) {
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
