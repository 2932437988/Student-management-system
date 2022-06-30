package it.com.zhehang.servlet;

import it.com.zhehang.bean.Tripin;
import it.com.zhehang.dao.TripinDaoImpl;
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

//import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import net.sf.json.JSONObject;

import java.util.Date;
import java.util.List;
import java.io.File;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class TripoutSaveServlet
 */
public class TripinSaveServlet extends HttpServlet {
	TripinDaoImpl tripinDao=new TripinDaoImpl();
	private static final long serialVersionUID = 1L;
       

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
		response.setContentType("text/html;charset=utf-8");
		String userid=null;
		String subtime=null;
		String admissiontime=null;
		String admissionreason=null;
		String residentialaddress=null;
		String tutorapprovalvoucher=null;
		String travelcard=null;
		String healthcodegreencode=null;
		String nucleicacidproof=null;
		boolean isMultipart=ServletFileUpload.isMultipartContent(request);
		if(!isMultipart) {
			return;
		}
		DiskFileItemFactory factory=new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List<FileItem> items=null;
		try {
			items = upload.parseRequest(request);
			System.out.println(items.size());
		}catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String path="/www/wwwroot";
		//		String path="F:/";
		File f=new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		for(FileItem x:items) {
			try {
				if(x.isFormField()) {
					String filename=x.getFieldName();
					if(filename.equals("userid")) {
						userid=x.getString("UTF-8");
						System.out.println(userid);
					}
					if(filename.equals("subtime")) {
						subtime=x.getString("UTF-8");
						System.out.println(subtime);
					}
					if(filename.equals("admissiontime")) {
						admissiontime=x.getString("UTF-8");
						System.out.println(admissiontime);
					}
					if(filename.equals("admissionreason")) {
						admissionreason=x.getString("UTF-8");
						System.out.println(admissionreason);
					}
					if(filename.equals("residentialaddress")) {
						residentialaddress=x.getString("UTF-8");
						System.out.println(residentialaddress);
					}
				}else {
					String filename=x.getFieldName();
					String name=x.getName();
					String path1 ="/x-17.top/upload_pic/"+ new Date().getTime()+"_"+userid+"_";
					String fileName2=null;
					if(filename.equals("tutorapprovalvoucher")) {
						tutorapprovalvoucher= path1+"tutorapprovalvoucher.png";
						fileName2=path+tutorapprovalvoucher;
						
					}
						
					if(filename.equals("travelcard")) {
						travelcard= path1+"travelcard.png";
						fileName2=path+travelcard;
					}
						
					if(filename.equals("healthcodegreencode")) {
						healthcodegreencode= path1+"healthcodegreencode.png";
						fileName2=path+healthcodegreencode;
						
					}
						
					if(filename.equals("nucleicacidproof")) {
						nucleicacidproof= path1+"nucleicacidproof.png";
						fileName2=path+nucleicacidproof;
						
					}
					File file = new File(fileName2);
					try {
						x.write(file);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
			Tripin tripin=null;
			try {
				tutorapprovalvoucher="https:/"+tutorapprovalvoucher;
				travelcard="https:/"+travelcard;
				healthcodegreencode="https:/"+healthcodegreencode;
				nucleicacidproof="https:/"+nucleicacidproof;
				tripin=new Tripin(userid,DateUtils.formatString(subtime, "yyyy-MM-dd HH:mm:ss"),DateUtils.formatString(admissiontime, "yyyy-MM-dd HH:mm:ss"),admissionreason,residentialaddress,tutorapprovalvoucher,travelcard,healthcodegreencode,nucleicacidproof);
			}catch(Exception e1) {
				e1.printStackTrace();
			}
			Connection coon = null;
			try {
				
				coon=JBUtils.getConnection();
				int saveNum=0;
				JSONObject result=new JSONObject();
				saveNum=tripinDao.addTripin(coon,tripin);
				if(saveNum>0) {
					response.sendRedirect("mytrip.jsp");
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