package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.ArtistDTO;

public class ArtistDAO {

	private PreparedStatement ps;
	private Connection con;
	private ResultSet rs;
	
	
	public ArtistDAO() {
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
	
	public ArrayList<ArtistDTO> selectName(String key) {
		ArrayList<ArtistDTO> lists = new ArrayList<ArtistDTO>();
		
		String sql = "SELECT * FROM artist_list WHERE name LIKE ?";
		String keywords = "%"+key+"%";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, keywords);
			rs = ps.executeQuery();
			while(rs.next()) {
				ArtistDTO dto = new ArtistDTO();
				dto.setGender(rs.getString("gender"));
				dto.setMember(rs.getString("member"));
				dto.setName(rs.getString("name"));
				dto.setTeam(rs.getString("team"));
				lists.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lists;
	}
	
	public ArtistDTO findMember(String key) {
		ArtistDTO dto = new ArtistDTO();
		String sql = "SELECT * FROM artist_list WHERE name LIKE ?";
		String keywords = "%"+key+"%";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, keywords);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setGender(rs.getString("gender"));
				dto.setMember(rs.getString("member"));
				dto.setName(rs.getString("name"));
				dto.setTeam(rs.getString("team"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public void insert(ArtistDTO dto) {
		String sql = "INSERT INTO artist_list VALUES(?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getGender());
			ps.setString(3, dto.getMember());
			ps.setString(4, dto.getTeam());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String name) {
		String sql = "DELETE FROM artist_lst WHERE name=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void disconnection() {
		try {
			if(rs != null) rs.close();
			if(con != null) con.close();
			if(ps != null) ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
