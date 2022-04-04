package dao;

import vo.FilmList;
import java.util.*;
import util.DBUtil;
import java.sql.*;

public class FilmListDao {
	public List<FilmList> selectFilmListViewByPage(int beginRow,int rowPerPage) {
		List<FilmList> list = new ArrayList<FilmList>();
		Connection conn = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT FID fid, title, description, category, price, length, rating, actors FROM film_list ORDER BY FID LIMIT ?,?";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rs = stmt.executeQuery();
			// 데이터베이스 변환
			while(rs.next()) {
				FilmList filmList = new FilmList();
				filmList.setFid(rs.getInt("fid"));
				filmList.setTitle(rs.getString("title"));
				filmList.setDescription(rs.getString("description"));
				filmList.setCategory(rs.getString("category"));
				filmList.setPrice(rs.getDouble("price"));
				filmList.setLength(rs.getInt("length"));
				filmList.setRating(rs.getString("rating"));
				filmList.setActors(rs.getString("actors"));
				list.add(filmList);
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
	public int selectFilmListTotalRow() {
		int row = 0;
		Connection conn = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT COUNT(*) cnt FROM film_list";
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
