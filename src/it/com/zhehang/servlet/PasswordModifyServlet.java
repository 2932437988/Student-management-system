package it.com.zhehang.servlet;

import it.com.zhehang.bean.User;
import it.com.zhehang.dao.UserDaoImpl;
import it.com.zhehang.jdbutil.JBUtils;
import it.com.zhehang.jdbutil.ResponseUtils;
import it.com.zhehang.jdbutil.StringUtils;
import net.sf.json.JSONObject;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PasswordModifyServlet
 */
public class PasswordModifyServlet extends HttpServlet {
    UserDaoImpl userDao = new UserDaoImpl();
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String userid = request.getParameter("userid");
        String userpassword_old = request.getParameter("userpassword_old");
        String userpassword_new = request.getParameter("userpassword_new");
        String userpassword_confirm = request.getParameter("userpassword_confirm");
        JSONObject result = new JSONObject();
        User user = new User(userid, userpassword_new);
        User userold = new User();
        userold.setUserid(userid);
        Connection coon = null;
        try {
            coon = JBUtils.getConnection();
            User old = userDao.define(coon, userold);
            System.out.println(old);
            String password = old.getUserpasswd();
            if (!password.equals(userpassword_old)) {
                result.put("success", "true");
                result.put("errorMsg", "旧密码输入错误");
            }
            else if (userpassword_new.equals(userpassword_old)) {
                result.put("success", "true");
                result.put("errorMsg", "新密码与旧密码一致，请修改");
            }
            else if (StringUtils.isEmpty(userpassword_old) || StringUtils.isEmpty(userpassword_new)
                    || StringUtils.isEmpty(userpassword_confirm)) {
                result.put("success", "true");
                result.put("errorMsg", "请填写完整");
            }
            else if (!userpassword_new.equals(userpassword_confirm)) {
                result.put("success", "true");
                result.put("errorMsg", "新密码与确认密码不一致");
            }
            else {
            coon=null;
            coon = JBUtils.getConnection();
            int usernow = userDao.modify(coon, user);
            System.out.println(usernow);
            if (usernow > 0) {
                result.put("success", "true");
            } else {
                result.put("success", "true");
                result.put("errorMsg", "修改失败");
            }
            }
            ResponseUtils.write(response, result);
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
