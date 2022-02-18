package duyeo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import org.apache.catalina.tribes.transport.nio.PooledParallelSenderMBean;

import config.DB;

public class GatherArticleDAO {
	public List<GatherArticleDTO> gatherboardList() {
		List<GatherArticleDTO> items = new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn = DB.getConn();
			String sql = "select * from gatherboard order by BBS_ID desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GatherArticleDTO dto = new GatherArticleDTO();
				dto.setBbs_id(rs.getString("bbs_id"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContents(rs.getString("contents"));
				dto.setGameid(rs.getString("gameid"));
				dto.setGametag(rs.getString("gametag"));
				dto.setEntered(rs.getString("entered"));				
				dto.setPosted_date(rs.getDate("posted_date"));
				dto.setUpdate_date(rs.getDate("update_date"));
				dto.setDelete_date(rs.getDate("delete_date"));
				dto.setExp_date(rs.getDate("exp_date"));
				dto.setDelete_at(rs.getString("delete_at"));
							
				dto.setMin_player(rs.getInt("min_player"));
				dto.setMax_player(rs.getInt("max_player"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setLiked(rs.getInt("liked"));
				
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
	
	public void create(GatherArticleDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;		
		//결과를 조회하지 않으므로 ResultSet 필요 없음
		
		try {
			conn = DB.getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into gatherboard ");
			sql.append("(BBS_ID,writer,SUBJECT,contents,gameid,gametag,min_player,max_player,entered,exp_date) values ");
			sql.append("(?,?,?,?,?,?,?,?,?,?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getBbs_id());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContents());
			pstmt.setString(5, dto.getGameid());			
			pstmt.setString(6, dto.getGametag());
			pstmt.setInt(7, dto.getMin_player());
			pstmt.setInt(8, dto.getMax_player());
			pstmt.setString(9, dto.getEntered());
			pstmt.setDate(10, dto.getExp_date());
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

	public GatherArticleDTO read(String bbs_id) {
		 GatherArticleDTO dto = null;
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 
		 try {
			conn = DB.getConn();
			String sql = "select * from gatherboard where bbs_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bbs_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new GatherArticleDTO();
				dto.setBbs_id(rs.getString("bbs_id"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContents(rs.getString("contents"));
				dto.setGameid(rs.getString("gameid"));
				dto.setGametag(rs.getString("gametag"));
				dto.setEntered(rs.getString("entered"));				
				dto.setPosted_date(rs.getDate("posted_date"));
				dto.setUpdate_date(rs.getDate("update_date"));
				dto.setDelete_date(rs.getDate("delete_date"));
				dto.setExp_date(rs.getDate("exp_date"));
				dto.setDelete_at(rs.getString("delete_at"));							
				dto.setMin_player(rs.getInt("min_player"));
				dto.setMax_player(rs.getInt("max_player"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setLiked(rs.getInt("liked"));
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
		return dto;
	} //memberDetail	
	
	public void update(GatherArticleDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;		
		//결과를 조회하지 않으므로 ResultSet 필요 없음
		
		try {
			conn = DB.getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("update gatherboard set");
			sql.append(" subject=?, contents=?, gameid=?, gametag=? ,entered=? ,min_player=? ,max_player=? ,exp_date=?");
			sql.append(" where bbs_id=?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContents());
			pstmt.setString(3, dto.getGameid());
			pstmt.setString(4, dto.getGametag());
			pstmt.setString(5, dto.getEntered());
			pstmt.setInt(6, dto.getMin_player());
			pstmt.setInt(7, dto.getMax_player());
			pstmt.setDate(8, dto.getExp_date());			
			pstmt.setString(9, dto.getBbs_id());
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
	} //update
	
	public void delete(String bbs_id) {
		Connection conn=null;
		PreparedStatement pstmt=null;		
		//결과를 조회하지 않으므로 ResultSet 필요 없음
		
		try {
			conn = DB.getConn();
			String sql = "delete from gatherboard where bbs_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bbs_id);
			pstmt.executeUpdate();//레코드 삭제
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
	} //delete
	

	public List<GatherArticleDTO> memberList() {
		List<GatherArticleDTO> items = new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn = DB.getConn();
			String sql = "select * from gatherboard order by BBS_ID desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GatherArticleDTO dto = new GatherArticleDTO();
				dto.setBbs_id(rs.getString("bbs_id"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContents(rs.getString("contents"));
				dto.setGameid(rs.getString("gameid"));
				dto.setGametag(rs.getString("gametag"));
				dto.setEntered(rs.getString("entered"));				
				dto.setPosted_date(rs.getDate("posted_date"));
				dto.setUpdate_date(rs.getDate("update_date"));
				dto.setDelete_date(rs.getDate("delete_date"));
				dto.setExp_date(rs.getDate("exp_date"));
				dto.setDelete_at(rs.getString("delete_at"));
							
				dto.setMin_player(rs.getInt("min_player"));
				dto.setMax_player(rs.getInt("max_player"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setLiked(rs.getInt("liked"));
				
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
}
