package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.AlbumDTO;

public class AlbumDAO {
	private PreparedStatement ps;
	private ResultSet rs;
	private Connection con;
	
	public AlbumDAO() {
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
	
	public ArrayList<AlbumDTO> selectName(String key){
		ArrayList<AlbumDTO> result = new ArrayList<AlbumDTO>();
		String sql = "SELECT * FROM album WHERE lower(name) LIKE lower(?)";
		String keywords = "%"+key+"%";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, keywords);
			rs = ps.executeQuery();
			while(rs.next()) {
				AlbumDTO dto = new AlbumDTO();
				dto.setArtist(rs.getString("artist"));
				dto.setDay(rs.getString("day"));
				dto.setGenre(rs.getString("genre"));
				dto.setName(rs.getString("name"));
				dto.setType(rs.getString("type"));
				result.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public void disconeection() {
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(con != null) con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
