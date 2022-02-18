package duyeo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.DB;
import crypt.BCrypt;
import duyeo.MemberDTO;

public class MemberDAO {
	public List<MemberDTO> memberList() {
		List<MemberDTO> items = new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn = DB.getConn();
			String sql = "select * from member order by name";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setUserid(rs.getString("userid"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setHp(rs.getString("hp"));
				dto.setJoin_date(rs.getDate("join_date"));
				
				dto.setProfileimg(rs.getString("profileimg"));
				dto.setDescription(rs.getString("description"));
				items.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) 
					rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt!=null) 
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) 
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}//finally
		return items;
	} //memberList()

	//BCrypt 방식의 암호화 처리
	public void insertBcrypt(MemberDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;		
		//결과를 조회하지 않으므로 ResultSet 필요 없음
		
		try {
			conn = DB.getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into member ");
			sql.append("(userid, passwd, name, email, hp) values ");
			sql.append("(?,?,?,?,?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUserid());
			String passwd = BCrypt.hashpw(dto.getPasswd(), BCrypt.gensalt());
			pstmt.setString(2, passwd);
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getHp());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) 
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) 
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}//finally		
	} //insert	

	public String loginCheckBcrypt(MemberDTO dto) {
		String result="";
		Connection conn=null;
		PreparedStatement pstmt=null;		
		ResultSet rs = null;	
		try {
			conn = DB.getConn();
			String sql = "select * from member where userid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String passwd = rs.getString("passwd");
				if(passwd != null && BCrypt.checkpw(dto.getPasswd(), passwd)) {
					result = rs.getString("name");
				} else {
					result = null;					
				}				
			} else {
				result = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) 
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) 
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}//finally
		return result;
	} //loginCheck	
}
