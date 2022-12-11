package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.LoveDTO;

public class LoveDAO {
	private PreparedStatement ps;
	private Connection con;
	private ResultSet rs;
	
	public LoveDAO() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "oracle";
		String password = "oracle";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Integer> selectId(String id) {
		ArrayList<Integer> lists = new ArrayList<Integer>();
		String sql = "SELECT * FROM love WHERE id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				lists.add(rs.getInt("num"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lists;
	}
	
	public void addList(String id, int num) {
		String sql = "INSERT INTO love VALUES(?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void removeList(String id, int num) {
		String sql = "DELETE FROM love WHERE id=? and num=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, num);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void disconnection() {
		try {
			if(ps !=null) ps.close();
			if(rs != null) rs.close();
			if(con != null) con.close(); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
