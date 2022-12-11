package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.VoucherDTO;

public class VoucherDAO {

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	public VoucherDAO() {
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

	public VoucherDTO getVoucher(String id) {
		String sql = "SELECT * FROM voucher WHERE id=?";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				VoucherDTO voucher = new VoucherDTO();
				voucher.setId(rs.getString("id"));
				voucher.setTicket(rs.getString("ticket"));
				voucher.setBegin(rs.getString("begin"));
				voucher.setFinish(rs.getString("finish"));
				return voucher;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getVoucher catch");
		}
		return null;
	}

	public void insert(VoucherDTO voucher) {
		String sql = "INSERT INTO voucher VALUES(?,?,?,?)";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, voucher.getId());
			ps.setString(2, voucher.getTicket());
			ps.setString(3, voucher.getBegin());
			ps.setString(4, voucher.getFinish());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("insert catch");
		}
	}

	public void delete(String id) {
		String sql = "DELETE FROM voucher WHERE id=?";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public String getFinish(String id) {
		String sql = "SELECT * FROM voucher WHERE id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				String finish = rs.getString("finish");
				return finish;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 전체 이용권수
	public int count() {
		String sql = "SELECT count(*) as cnt FROM voucher";
		int count = 0;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
//				   count = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	// 개월수별 이용권 수
	public int count(String month) {
		String sql = "SELECT count(*) as cnt FROM voucher where ticket=?";
		int count = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, month);
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
//					count = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;

	}

	public ArrayList<String> sales(String month) {
		String sql = "SELECT * FROM voucher";
		ArrayList<String> arr = new ArrayList<>();

		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				if (rs.getString("begin").substring(4, 6).equals(month)) {
					arr.add(rs.getString("ticket"));
				}
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("sales catch");
		}
		return null;
	}

	public void disconnection() {
		try {
			if (con != null)
				con.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}