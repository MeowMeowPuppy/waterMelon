package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.MemberDTO;

public class MemberDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	public MemberDAO() {
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

	// 회원가입(중복된 아이디), 로그인
	public MemberDTO selectId(String id) {
		String sql = "SELECT * FROM wmember WHERE id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setBirth(rs.getString("birth"));
				member.setEmail(rs.getString("email"));
				member.setMobile(rs.getString("mobile"));
				return member;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectId catch");
		}
		return null;
	}

	// 아이디 찾기
	public String selectFindId(String findIdName, String findIdMobile) {
		String sql = "SELECT id FROM wmember WHERE name=? and mobile=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, findIdName);
			ps.setString(2, findIdMobile);
			rs = ps.executeQuery();
			if (rs.next()) {
				String id = rs.getString("id");
				return id;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	// 비밀번호 찾기
	public String selectFindPw(String findPwId, String findPwName, String findPwMobile) {
		String sql = "SELECT pw FROM wmember WHERE id=? and name=? and mobile=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, findPwId);
			ps.setString(2, findPwName);
			ps.setString(3, findPwMobile);
			rs = ps.executeQuery();
			if (rs.next()) {
				String pw = rs.getString("pw");
				return pw;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	// 목록 페이징 있을때 사용한 list() 매서드
	public List<MemberDTO> list(int begin, int end) {
		String sql = "SELECT A.* FROM (SELECT ROWNUM rn, id, pw, name, birth, email, mobile FROM";
		sql += " wmember)A WHERE rn >= ? AND rn <= ?";
		ArrayList<MemberDTO> members = new ArrayList<>();
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, begin);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while (rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setBirth(rs.getString("birth"));
				member.setEmail(rs.getString("email"));
				member.setMobile(rs.getString("mobile"));
				members.add(member);
			}
		} catch (Exception e) {
		}
		return members;
	}

	// 검색결과 목록에 사용한 list() 메서드
	// select == [id, name, email] && search == [검색어]
	public List<MemberDTO> list(int begin, int end, String select, String search) {
		ArrayList<MemberDTO> members = new ArrayList<MemberDTO>();
		String sql = "";
		if (select.equals("id")) {
			sql = "SELECT A.* FROM (SELECT rownum rn, id, pw, name, birth, email, mobile FROM ";
			sql += "wmember WHERE id like ?)A WHERE rn BETWEEN ? and ?";// WHERE id like ? 추가됨/ BETWEEN ? and ?" 위의 list
																		// 조건이다 같다.
		} else if (select.equals("name")) {
			sql = "SELECT A.* FROM (SELECT rownum rn, id, pw, name, birth, email, mobile FROM";
			sql += " wmember WHERE name like ?)A WHERE rn BETWEEN ? and ?";
		} else {
			sql = "SELECT A.* FROM (SELECT rownum rn, id, pw, name, birth, email, mobile FROM";
			sql += " wmember WHERE email like ?)A WHERE rn BETWEEN ? and ?";
		}
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + search + "%");// 부분 일치
			ps.setInt(2, begin);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			while (rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setBirth(rs.getString("birth"));
				member.setEmail(rs.getString("email"));
				member.setMobile(rs.getString("mobile"));
				members.add(member);
			}
		} catch (Exception e) {
		}
		return members;
	}

	// 전체 회원수에 사용할 count()메서드
	public int count() {
		String sql = "SELECT count(*) as cnt FROM wmember";
		int count = 0;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
//				count = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	// 검색결과에 대한 목록수에 사용할 count()메서드
	public int count(String select, String search) {
		String sql = "";
		if (select.equals("id"))
			sql = "SELECT count(*) as cnt FROM wmember WHERE id like ?";// 조건(WHERE)이 추가
		else if (select.equals("id"))
			sql = "SELECT count(*) as cnt FROM wmember WHERE name like ?";
		else
			sql = "SELECT count(*) as cnt FROM wmember WHERE email like ?";
		int count = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + search + "%");
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	// 전화번호 중복 체크
	public MemberDTO selectMobile(String mobile) {
		String sql = "SELECT * FROM wmember WHERE mobile=?";
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, mobile);
			rs = ps.executeQuery();
			if (rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setBirth(rs.getString("birth"));
				member.setEmail(rs.getString("email"));
				member.setMobile(rs.getString("mobile"));
				return member;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectMobile catch");
		}
		return null;
	}

	// 이용권 확인/탈퇴 비밀번호 확인
	public String confirmPw(String id) {
		String sql = "SELECT pw FROM wmember WHERE id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString("pw");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("confirmPw catch");
		}
		return null;
	}

	// 회원가입
	public void insert(MemberDTO member) {
		String sql = "INSERT INTO wmember VALUES(?,?,?,?,?,?)";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPw());
			ps.setString(3, member.getName());
			ps.setString(4, member.getBirth());
			ps.setString(5, member.getEmail());
			ps.setString(6, member.getMobile());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("insert catch");
		}
	}

	// 비밀번호 수정
	public void updatePw(String pw, String id) {
		String sql = "UPDATE wmember SET pw=? WHERE id=?";
		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, pw);
			ps.setString(2, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 정보수정 이름변경
	public void updateName(String name, String id) {
		String sql = "UPDATE wmember SET name=? WHERE id=?";
		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 정보수정 이메일변경
	public void updateEmail(String email, String id) {
		String sql = "UPDATE wmember SET email=? WHERE id=?";

		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 회원 탈퇴
	public void delete(String id) {
		String sql = "DELETE FROM wmember WHERE id=?";

		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 관리자가 user데이터 강제 수정
	public void update(MemberDTO member) {
		String sql = "UPDATE wmember SET pw=?, name=?,  birth=?, email=?, mobile=? WHERE id=?";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getPw());
			ps.setString(2, member.getName());
			ps.setString(3, member.getBirth());
			ps.setString(4, member.getEmail());
			ps.setString(5, member.getMobile());
			ps.setString(6, member.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
