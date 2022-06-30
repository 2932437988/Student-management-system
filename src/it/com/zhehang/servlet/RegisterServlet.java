package it.com.zhehang.servlet;

import it.com.zhehang.bean.User;
import it.com.zhehang.dao.UserDaoImpl;
import it.com.zhehang.bean.Info;
import it.com.zhehang.dao.InfoDaoImpl;

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
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	UserDaoImpl userDao=new UserDaoImpl();
	InfoDaoImpl infoDao=new InfoDaoImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		//设置编码格式
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				//从前台获取参数
				String userid = request.getParameter("userid0");
				String userpasswd=request.getParameter("userpasswd0");
				String userlevel="0";
				String username=request.getParameter("username");
				String userphone=request.getParameter("userphone");
				String usergender=request.getParameter("usergender");
				String userroom=request.getParameter("userroom");
				String userstatus=request.getParameter("userstatus");
				User user=null;
				Info info=null;
				try {
					user=new User(userid,userpasswd,Integer.parseInt(userlevel));
					info=new Info(userid,username,userphone,usergender,userroom,userstatus);
				}catch(Exception e1) {
					e1.printStackTrace();
				}
				Connection coon = null;
				try {
					coon=JBUtils.getConnection();
					int saveNum1=0;
					JSONObject result=new JSONObject();
					saveNum1=userDao.addUser(coon,user);
					coon=null;
					coon=JBUtils.getConnection();
					int saveNum2=0;
					saveNum2=infoDao.modifyInfo(coon, info);
					if(saveNum1>0&&saveNum2>0) {
						coon=null;
						coon=JBUtils.getConnection();
						User user1=new User(userid,userpasswd);
						User currentUser=userDao.login(coon, user1);
						// 客户端跳转
						HttpSession session = request.getSession();
						session.setAttribute("currentUserid", currentUser.getUserid());
						
						response.sendRedirect("main.jsp");
					}else
					{
						request.setAttribute("error1", "注册失败！");
						request.getRequestDispatcher("login.jsp").forward(request, response);
					}
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
