package dao;

import java.util.*;
import java.sql.*;

public class StaffDao {
	public List<Map<String, Object>> selectStaffList() {
		List<Map<String, Object>> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/sakila","root","java1234");
			String sql = "SELECT"
					+ " CONCAT(s1.first_name, s1.last_name) 					staffName,"
					+ " s1.address_id 											addressId,"
					+ " CONCAT(a.address, IFNULL(a.address2, ' '), a.district) 	staffAddr,"
					+ " s1.email 												email,"
					+ " s1.store_id 											storeId,"
					+ " s1.active 												active,"
					+ " s1.username 											username,"
					+ " s1.password 											password,"
					+ " s1.last_update 											lastUpdate"
					+ " FROM staff s1 INNER JOIN address a"
					+ " ON s1.address_id = a.address_id;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<>();
				map.put("staffName", rs.getString("staffName"));
				map.put("addressId", rs.getInt("addressId"));
				map.put("staffAddr", rs.getString("staffAddr"));
				map.put("email", rs.getString("email"));
				map.put("storeId", rs.getInt("storeId"));
				map.put("active", rs.getInt("active"));
				map.put("username", rs.getString("username"));
				map.put("password", rs.getString("password"));
				map.put("lastUpdate", rs.getString("lastUpdate"));
				list.add(map);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("예외 발생");
		} finally {
			// DB자원 해지 - try절에서 예외가 발생하면 자원해지 못한 상태에서 코드가 종료. finally절이 필요.
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public static void main(String[] args) {
		StaffDao staffDao = new StaffDao();
		List<Map<String, Object>> list = staffDao.selectStaffList();
		for(Map m : list) {
			System.out.println(m.get("staffName") + ", ");
			System.out.println(m.get("addressId") + ", ");
			System.out.println(m.get("staffAddr") + ", ");
			System.out.println(m.get("email") + ", ");
			System.out.println(m.get("storeId") + ", ");
			System.out.println(m.get("active") + ", ");
			System.out.println(m.get("username") + ", ");
			System.out.println(m.get("password") + ", ");
			System.out.println(m.get("lastUpdate"));
		}
	}
}
