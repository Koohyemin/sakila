package dao;
import java.util.*;

import util.DBUtil;
import vo.SalesByStore;
import java.sql.*;

public class SalesByStoreDao {
	public List<SalesByStore> selectSalesByStore() {
		List<SalesByStore> list = new ArrayList<SalesByStore>();
		Connection conn = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT store, manager, total_sales totalSales FROM sales_by_store";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			// 데이터베이스 변환
			while(rs.next()) {
				SalesByStore salesByStore = new SalesByStore();
				salesByStore.setStore(rs.getString("store"));
				salesByStore.setManager(rs.getString("manager"));
				salesByStore.setTotalSales(rs.getDouble("totalSales"));
				list.add(salesByStore);
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
