package it.com.zhehang.dao;

import it.com.zhehang.bean.User;
import it.com.zhehang.jdbutil.JBUtils;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class BaseDao {
	
	/**
	 * 通用的增删改操作
	 * @param coon
	 * @param sql
	 * @param args
	 * @return
	 */
	public int update(Connection coon,String sql,Object ...args)
	{
		PreparedStatement ps =null;
		try {
			ps = coon.prepareStatement(sql);
			for(int i =0;i <args.length;i++)
			{
				ps.setObject(i+1, args[i]);
			}
			System.out.println("sql:");
			System.out.println(ps);
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JBUtils.closeConnection(coon, ps, null);
		}
		return 0;
	}
	
	/**
	 * 查询单条记录
	 * @param coon
	 * @param sql
	 * @param clazz
	 * @param args
	 * @return
	 */
	public <T> T select(Connection coon,String sql,Class<T> clazz,Object ...args)
	{
		PreparedStatement ps =null;
		ResultSet rs = null;
		try {
			ps = coon.prepareStatement(sql);
			for(int i= 0;i<args.length;i++)
			{
				ps.setObject(i+1, args[i]);
			}
			
			rs = ps.executeQuery();
			ResultSetMetaData rsm = rs.getMetaData();
			int columnCount = rsm.getColumnCount();
			
			if(rs.next())
			{
				T t = clazz.newInstance();
				
				for(int i=0;i < columnCount;i++)
				{
					String columnName = rsm.getColumnLabel(i+1);
					Object columnValue = rs.getObject(i+1);
					
					Field field = clazz.getDeclaredField(columnName);
					field.setAccessible(true);
					field.set(t, columnValue);
				}
				return t;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}finally{
			JBUtils.closeConnection(coon, ps, rs);
		}
		return null;
	}
	public User login(Connection coon, User user) {
		return null;
	}
	
	/**
	 * 返回结果集
	 * @param coon
	 * @param sql
	 * @param args
	 * @return
	 */
	public ResultSet getList(Connection coon,String sql,Object ...args)
	{
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = coon.prepareStatement(sql);
			for(int i =0;i < args.length;i++)
			{
				ps.setObject(i+1, args[i]);
			}
			rs = ps.executeQuery();
			return rs;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取查询后的总数
	 * @param coon
	 * @param sql
	 * @param args
	 * @return
	 */
	public int getCount(Connection coon,String sql,Object ...args)
	{
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps = coon.prepareStatement(sql);
			for(int i=0;i<args.length;i++)
			{
				ps.setObject(i+1, args[i]);
			}
			rs = ps.executeQuery();
			if(rs.next())
			{
				return rs.getInt("total");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JBUtils.closeConnection(coon, ps, rs);
		}
		return 0;
	}
}
