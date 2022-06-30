package it.com.zhehang.jdbutil;


import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import com.alibaba.druid.pool.DruidDataSourceFactory;

public class JBUtils {
	private static DataSource dataSource;
	static{
		try {
			Properties pro = new Properties();
			InputStream is = JBUtils.class.getClassLoader().getResourceAsStream("druid.properties");
			pro.load(is);
			dataSource = DruidDataSourceFactory.createDataSource(pro);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 数据库的连接
	 * @return
	 * @throws Exception
	 */
	public static Connection getConnection() throws Exception{
		Connection coon = dataSource.getConnection();
		return coon;
	}
	/**
	 * 数据库资源的释放
	 * @param coon
	 * @param ps
	 * @param rs
	 */
	public static void closeConnection(Connection coon,PreparedStatement ps,ResultSet rs){
		try {
			if(coon!=null)
			{
				coon.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(ps!=null)
			{
				ps.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(rs!=null)
			{
				rs.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
