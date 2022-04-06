package dao;

import java.util.*;
import util.DBUtil;
import java.sql.*;
import vo.Category;

public class CategoryDao {
	public List<Category> selectCategoryList() {
		List<Category> list = new ArrayList<Category>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT category_id categoryId, name, last_update lastUpdate FROM category"; // category 테이블을 모두 받고 필요한 부분 사용
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Category c = new Category();
				c.setCategoryId(rs.getInt("categoryId"));
				c.setName(rs.getString("name"));
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace(); // 예외 확인 코드
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
}
