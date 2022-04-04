package dao;

import java.util.*;
import java.sql.*;
import util.DBUtil;
import vo.ActorInfo;

public class ActorInfoDao {
	public List<ActorInfo> selectActorInfoListByPage(int beginRow,int rowPerPage) {
		List<ActorInfo> list = new ArrayList<ActorInfo>();
		Connection conn = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT actor_id actorId, first_name firstName, last_name lastName, film_info filmInfo FROM actor_info ORDER BY actor_id LIMIT ?,?";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow); // LIMIT ?,_
			stmt.setInt(2, rowPerPage); // LIMIT _,?
			rs = stmt.executeQuery();
			// 데이터베이스 변환
			while(rs.next()) {
				ActorInfo actorInfo = new ActorInfo();
				actorInfo.setActorId(rs.getInt("actorId"));
				actorInfo.setFirstName(rs.getString("firstName"));
				actorInfo.setLastName(rs.getString("lastName"));
				actorInfo.setFilmInfo(rs.getString("filmInfo"));
				list.add(actorInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				// 데이터베이스 자원 반환
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// ActorInfo 전체 행 수 반환 메서드
	public int selectActorInfoTotalRow() {
		int row = 0;
		Connection conn = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT COUNT(*) cnt FROM actor_info";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			// 데이터베이스 변환
			if(rs.next()) {
				row = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 데이터베이스 자원 반환
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
}