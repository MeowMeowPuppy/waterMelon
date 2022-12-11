package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.MusicDTO;

public class MusicDAO {
	private PreparedStatement ps;
	private ResultSet rs;
	private Connection con;

	public MusicDAO() {
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

	// 좋아요에 추가
	public int upLove(int num, String id) {
		int result = 0;
		String sql = "UPDATE music_list SET love=love+1 WHERE num=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		sql = "INSERT INTO love VALUES(?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		sql = "SELECT love FROM music_list WHERE num=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = rs.getInt("love");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 좋아요 빼기
	public int downLove(int num, String id) {
		int result = 0;
		String sql = "UPDATE music_list SET love=love-1 WHERE num=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		sql = "DELETE FROM love WHERE num=? and id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		sql = "SELECT love FROM music_list WHERE num=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = rs.getInt("love");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int upHit(int num) {
		int i = 0;
		String sql = "UPDATE music_list SET hit= hit +1 WHERE num=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		sql = "SELECT hit FROM music_list WHERE num=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if (rs.next()) {
				i = rs.getInt("hit");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public MusicDTO selectNum(int num) {
		MusicDTO dto = new MusicDTO();
		String sql = "SELECT * FROM music_list WHERE num=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto.setMv(rs.getString("mv"));
				dto.setFileName(rs.getString("filename"));
				dto.setAlbum(rs.getString("album"));
				dto.setArtist(rs.getString("artist"));
				dto.setTitle(rs.getString("title"));
				dto.setNum(num);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}

	public ArrayList<MusicDTO> selectAll() {
		ArrayList<MusicDTO> lists = new ArrayList<MusicDTO>();
		String sql = "SELECT * FROM music_list order by hit DESC";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				MusicDTO dto = new MusicDTO();
				dto.setAlbum(rs.getString("album"));
				dto.setArtist(rs.getString("artist"));
				dto.setHit(rs.getInt("hit"));
				dto.setLove(rs.getInt("love"));
				dto.setLyrics(rs.getString("lyrics"));
				dto.setMv(rs.getString("mv"));
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setFileName(rs.getString("fileName"));
				lists.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lists;
	}

	public ArrayList<MusicDTO> searchTotal(String key) {
		ArrayList<MusicDTO> result = new ArrayList<MusicDTO>();
		String sql = "SELECT * FROM music_list WHERE lower(title) LIKE lower(?) OR  lower(artist) LIKE lower(?) OR lower(album) LIKE lower(?)";
		String keywords = "%" + key + "%";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, keywords);
			ps.setString(2, keywords);
			ps.setString(3, keywords);
			rs = ps.executeQuery();
			while (rs.next()) {
				MusicDTO dto = new MusicDTO();
				dto.setAlbum(rs.getString("album"));
				dto.setArtist(rs.getString("artist"));
				dto.setFileName(rs.getString("filename"));
				dto.setHit(rs.getInt("hit"));
				dto.setLove(rs.getInt("love"));
				dto.setLyrics(rs.getString("lyrics"));
				dto.setMv(rs.getString("mv"));
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				result.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<MusicDTO> searchTitle(String key) {
		ArrayList<MusicDTO> result = new ArrayList<MusicDTO>();
		String sql = "SELECT * FROM music_list WHERE lower(title) LIKE lower(?)";
		String keywords = "%" + key + "%";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, keywords);
			rs = ps.executeQuery();
			while (rs.next()) {
				MusicDTO dto = new MusicDTO();
				dto.setAlbum(rs.getString("album"));
				dto.setArtist(rs.getString("artist"));
				dto.setFileName(rs.getString("filename"));
				dto.setHit(rs.getInt("hit"));
				dto.setLove(rs.getInt("love"));
				dto.setLyrics(rs.getString("lyrics"));
				dto.setMv(rs.getString("mv"));
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				result.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<MusicDTO> searchArtist(String key) {
		ArrayList<MusicDTO> result = new ArrayList<MusicDTO>();
		String sql = "SELECT * FROM music_list WHERE lower(artist) LIKE lower(?)";
		String keywords = "%" + key + "%";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, keywords);
			rs = ps.executeQuery();
			while (rs.next()) {
				MusicDTO dto = new MusicDTO();
				dto.setAlbum(rs.getString("album"));
				dto.setArtist(rs.getString("artist"));
				dto.setFileName(rs.getString("filename"));
				dto.setHit(rs.getInt("hit"));
				dto.setLove(rs.getInt("love"));
				dto.setLyrics(rs.getString("lyrics"));
				dto.setMv(rs.getString("mv"));
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				result.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<MusicDTO> searchAlbum(String key) {
		ArrayList<MusicDTO> result = new ArrayList<MusicDTO>();
		String sql = "SELECT * FROM music_list WHERE lower(album) LIKE lower(?)";
		String keywords = "%" + key + "%";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, keywords);
			rs = ps.executeQuery();
			while (rs.next()) {
				MusicDTO dto = new MusicDTO();
				dto.setAlbum(rs.getString("album"));
				dto.setArtist(rs.getString("artist"));
				dto.setFileName(rs.getString("filename"));
				dto.setHit(rs.getInt("hit"));
				dto.setLove(rs.getInt("love"));
				dto.setLyrics(rs.getString("lyrics"));
				dto.setMv(rs.getString("mv"));
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				result.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void insert(MusicDTO music) {
		String sql = "INSERT INTO music_list VALUES(music_seq.nextval,?,?,?,?,?,?,?,?)";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, music.getFileName());
			ps.setString(2, music.getTitle());
			ps.setString(3, music.getAlbum());
			ps.setString(4, music.getArtist());
			ps.setString(5, music.getLyrics());
			ps.setString(6, music.getMv());
			ps.setInt(7, music.getLove());
			ps.setInt(8, music.getHit());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void update(MusicDTO music) {
		String sql = "UPDATE music_list SET lyrics='y' WHERE FileName=?";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, music.getFileName());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public List<MusicDTO> musicList(int begin, int end) {
		String sql = "SELECT B.* FROM (SELECT ROWNUM rn, A.* FROM "
				+ "(SELECT * FROM music_list order by num desc)A)B  " + "WHERE rn >= ? AND rn <= ?";
		ArrayList<MusicDTO> musics = new ArrayList<>();
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, begin);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while (rs.next()) {
				MusicDTO music = new MusicDTO();
				music.setNum(rs.getInt("num"));
				music.setTitle(rs.getString("title"));
				music.setAlbum(rs.getString("album"));
				music.setArtist(rs.getString("artist"));
				music.setLyrics(rs.getString("lyrics"));
				music.setFileName(rs.getString("filename"));

				if (rs.getString("mv").equals("n")) {
					music.setMv("n");
				} else {
					music.setMv("y");
				}

				music.setLove(rs.getInt("love"));
				music.setHit(rs.getInt("hit"));
				musics.add(music);
			}
		} catch (Exception e) {
		}
		return musics;
	}

	public List<MusicDTO> musicList(int begin, int end, String select, String search) {
		ArrayList<MusicDTO> musics = new ArrayList<MusicDTO>();
		String sql = "";
		if (select.equals("title")) {
			sql = "SELECT A.* FROM (SELECT rownum rn, num, title, album, artist, lyrics, mv, love, hit, filename FROM ";
			sql += "music_list WHERE title like ?)A WHERE rn BETWEEN ? and ?";
		} else if (select.equals("artist")) {
			sql = "SELECT A.* FROM (SELECT rownum rn, num, title, album, artist, lyrics, mv, love, hit, filename FROM ";
			sql += "music_list WHERE artist LIKE ?)A WHERE rn BETWEEN ? and ?";
		} else {
			sql = "SELECT A.* FROM (SELECT rownum rn, num, title, album, artist, lyrics, mv, love, hit, filename FROM ";
			sql += "music_list WHERE (artist || title) LIKE ?)A WHERE rn BETWEEN ? and ?";
		}

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + search + "%");
			ps.setInt(2, begin);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			while (rs.next()) {
				MusicDTO music = new MusicDTO();
				music.setNum(rs.getInt("num"));
				music.setTitle(rs.getString("title"));
				music.setAlbum(rs.getString("album"));
				music.setArtist(rs.getString("artist"));
				music.setLyrics(rs.getString("lyrics"));
				music.setFileName(rs.getString("filename"));

				if (rs.getString("mv").equals("n")) {
					music.setMv("n");
				} else {
					music.setMv("y");
				}

				music.setLove(rs.getInt("love"));
				music.setHit(rs.getInt("hit"));
				musics.add(music);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("검색 쿼리 실패");
		}
		return musics;
	}

	public int count() {
		String sql = "SELECT count(*) as cnt FROM music_list";

		int count = 0;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public int count(String select, String search) {
		String sql = "";
		if (select.equals("title"))
			sql = "SELECT count(*) as cnt FROM music_list WHERE title like ?";
		else if (select.equals("artist"))
			sql = "SELECT count(*) as cnt FROM music_list WHERE artist like ?";
		else
			sql = "SELECT count(*) as cnt FROM music_list WHERE (title || artist) like ?";

		int count = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + search + "%");
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public void delete(String title) {
		String sql = "DELETE FROM music_list WHERE title= ?";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, title);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean prevent(String filename) {
		String sql = "SELECT * FROM music_list WHERE filename= ?";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, filename);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public void disconnection() {
		try {
			if (ps != null)
				ps.close();
			if (rs != null)
				rs.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
