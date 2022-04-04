package dao;

import java.sql.*;
import java.util.*;
import util.DBUtil;
import vo.NicerButSlowerFilmList;

public class NicerButSlowerFilmListDao {
	public List<NicerButSlowerFilmList> selectNicerButSlowerFilmListByPage(int beginRow,int rowPerPage) {
		List<NicerButSlowerFilmList> list = new ArrayList<NicerButSlowerFilmList>();
		Connection conn = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT FID fid, title, description, category, price, length, rating, actors FROM nicer_but_slower_film_list ORDER BY FID LIMIT ?,?";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rs = stmt.executeQuery();
			// 데이터베이스 변환
			while(rs.next()) {
				NicerButSlowerFilmList nicerButSlowerFilmList = new NicerButSlowerFilmList();
				nicerButSlowerFilmList.setFid(rs.getInt("fid"));
				nicerButSlowerFilmList.setTitle(rs.getString("title"));
				nicerButSlowerFilmList.setDescription(rs.getString("description"));
				nicerButSlowerFilmList.setCategory(rs.getString("category"));
				nicerButSlowerFilmList.setPrice(rs.getDouble("price"));
				nicerButSlowerFilmList.setLength(rs.getInt("length"));
				nicerButSlowerFilmList.setRating(rs.getString("rating"));
				nicerButSlowerFilmList.setActors(rs.getString("actors"));
				list.add(nicerButSlowerFilmList);
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
	// FilmListDao 전체 행 수 반환 메서드
	public int selectNicerButSlowerFilmListTotalRow() {
		int row = 0;
		Connection conn = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT COUNT(*) cnt FROM nicer_but_slower_film_list";
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
