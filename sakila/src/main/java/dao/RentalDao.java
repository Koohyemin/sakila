package dao;

import java.util.*;
import util.DBUtil;
import java.sql.*;

public class RentalDao {
	public int rentalSearchTotalRow(int storeId, String customerName, String beginDate, String endDate) {
		int row = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		try {
			// 동적쿼리
			String sql = "SELECT"
					+ " COUNT(*) cnt"
					+ " FROM rental r INNER JOIN customer c"
					+ " ON r.customer_id = c.customer_id"
					+ "	INNER JOIN staff s"
					+ "	ON r.staff_id = s.staff_id"
					+ "		INNER JOIN inventory i"
					+ "		ON r.inventory_id = i.inventory_id"
					+ "			INNER JOIN film f"
					+ "			ON i.film_id = f.film_id"
					+ " WHERE CONCAT(c.first_name,' ',c.last_name) LIKE?";
			if(storeId == -1 && beginDate.equals("") && endDate.equals("")) { // storeId, beginDate, endDate가 입력되지 않은 경우
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + customerName + "%");
			} else if(storeId != -1 && beginDate.equals("") && endDate.equals("")) { // storeId만 입력된 경우
				sql += " AND s.store_id = ?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + customerName + "%");
				stmt.setInt(2, storeId);
			} else if(storeId == -1 && !beginDate.equals("") && !endDate.equals("") || storeId == -1 && !beginDate.equals("") && endDate.equals("") || storeId == -1 && beginDate.equals("") && !endDate.equals("")) { 
				// date만 입력된 경우, beginDate만 입력된 경우, endDate만 입력된 경우
				sql += " AND r.rental_date BETWEEN STR_TO_DATE(?, '%Y-%m-%d') AND STR_TO_DATE(?, '%Y-%m-%d')";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + customerName + "%");
				stmt.setString(2, beginDate);
				stmt.setString(3, endDate);
			} else if(storeId != -1 && !beginDate.equals("") && !endDate.equals("") || storeId != -1 && !beginDate.equals("") && endDate.equals("") || storeId != -1 && beginDate.equals("") && !endDate.equals("")) {
				// storeId, beginDate, endDate가 모두 입력 된 경우, beginDate, endDate 둘 중 하나만 들어있는 경우도 해당
				sql += " AND s.store_id = ? AND r.rental_date BETWEEN STR_TO_DATE(?, '%Y-%m-%d') AND STR_TO_DATE(?, '%Y-%m-%d')";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + customerName + "%");
				stmt.setInt(2, storeId);
				stmt.setString(3, beginDate);
				stmt.setString(4, endDate);
			}
			rs = stmt.executeQuery();
			while(rs.next()) {
				row = rs.getInt("cnt");
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
		return row;
	}
	public List<Map<String, Object>> selectRentalSearchList(int beginRow, int rowPerPage, int storeId, String customerName, String beginDate, String endDate) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		try {
			// 동적쿼리
			String sql = "SELECT"
					+ "	r.rental_id 											rentalId,"
					+ "	r.rental_date 											rentalDate,"
					+ "	r.inventory_id 											inventoryId,"
					+ "	r.customer_id 											customerId,"
					+ "	CONCAT(c.first_name,' ',c.last_name) 					customerName,"
					+ "	r.return_date 											returnDate,"
					+ "	s.store_id 												storeId,"
					+ "	r.staff_id 												staffId,"
					+ "	r.last_update 											lastUpdate,"
					+ "	i.film_id 												filmId,"
					+ "	f.title 												title"
					+ " FROM rental r INNER JOIN customer c"
					+ " ON r.customer_id = c.customer_id"
					+ "	INNER JOIN staff s"
					+ "	ON r.staff_id = s.staff_id"
					+ "		INNER JOIN inventory i"
					+ "		ON r.inventory_id = i.inventory_id"
					+ "			INNER JOIN film f"
					+ "			ON i.film_id = f.film_id"
					+ " WHERE CONCAT(c.first_name,' ',c.last_name) LIKE ?";
			
			if(storeId == -1 && beginDate.equals("") && endDate.equals("")) { // storeId, beginDate, endDate가 입력되지 않은 경우
				sql += " ORDER BY rental_date LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + customerName + "%");
				stmt.setInt(2, beginRow);
				stmt.setInt(3, rowPerPage);
			} else if(storeId != -1 && beginDate.equals("") && endDate.equals("")) { // storeId만 입력된 경우
				sql += " AND s.store_id = ? ORDER BY rental_date LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + customerName + "%");
				stmt.setInt(2, storeId);
				stmt.setInt(3, beginRow);
				stmt.setInt(4, rowPerPage);
			} else if(storeId == -1 && !beginDate.equals("") && !endDate.equals("")) { // date만 입력된 경우
				sql += " AND r.rental_date BETWEEN STR_TO_DATE(?, '%Y-%m-%d') AND STR_TO_DATE(?, '%Y-%m-%d') ORDER BY rental_date LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + customerName + "%");
				stmt.setString(2, beginDate);
				stmt.setString(3, endDate);
				stmt.setInt(4, beginRow);
				stmt.setInt(5, rowPerPage);
			} else if(storeId != -1 && !beginDate.equals("") && !endDate.equals("")) { // storeId, beginDate, endDate가 모두 입력 된 경우
				sql += " AND s.store_id = ? AND r.rental_date BETWEEN STR_TO_DATE(?, '%Y-%m-%d') AND STR_TO_DATE(?, '%Y-%m-%d') ORDER BY rental_date LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + customerName + "%");
				stmt.setInt(2, storeId);
				stmt.setString(3, beginDate);
				stmt.setString(4, endDate);
				stmt.setInt(5, beginRow);
				stmt.setInt(6, rowPerPage);
			}
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("rentalId", rs.getInt("rentalId"));
				map.put("rentalDate", rs.getString("rentalDate"));
				map.put("inventoryId", rs.getInt("inventoryId"));
				map.put("customerId", rs.getInt("customerId"));
				map.put("customerName", rs.getString("customerName"));
				map.put("returnDate", rs.getString("returnDate"));
				map.put("storeId", rs.getInt("storeId"));
				map.put("staffId", rs.getInt("staffId"));
				map.put("lastUpdate", rs.getString("lastUpdate"));
				map.put("filmId", rs.getInt("filmId"));
				map.put("title", rs.getString("title"));
				list.add(map);
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
