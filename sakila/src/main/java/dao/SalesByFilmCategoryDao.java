package dao;

import java.util.*;
import util.DBUtil;
import java.sql.*;
import vo.SalesByFilmCategory;

public class SalesByFilmCategoryDao {
	public List<SalesByFilmCategory> selectSalesByFilmCategory() {
		List<SalesByFilmCategory> list = new ArrayList<SalesByFilmCategory>();
		Connection conn = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT category, total_sales totalSales FROM sales_by_film_category";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			// 데이터베이스 변환
			while(rs.next()) {
				SalesByFilmCategory salesByFilmCategory = new SalesByFilmCategory();
				salesByFilmCategory.setCategory(rs.getString("category"));
				salesByFilmCategory.setTotalSales(rs.getDouble("totalSales"));
				list.add(salesByFilmCategory);
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
}
