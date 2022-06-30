package it.com.zhehang.jdbutil;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class ResponseUtils {
	/**
	 * 向网页返回Servlet处理后的结果
	 * @param response
	 * @param result
	 * @throws Exception
	 */
	public static void write(HttpServletResponse response,Object result)throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println(result.toString());
		out.flush();
		out.close();
	}

}
