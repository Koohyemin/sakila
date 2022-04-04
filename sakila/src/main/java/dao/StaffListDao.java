package dao;

import java.util.*;
import util.DBUtil;
import vo.StaffList;
import java.sql.*;

public class StaffListDao {
	public List<StaffList> selectStaffList() {
		List<StaffList> list = new ArrayList<StaffList>();
		Connection conn = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT ID id, name, address, `zip code` zipCode, phone, city, country, SID sid FROM staff_list ORDER BY ID";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			// 데이터베이스 변환
			while(rs.next()) {
				StaffList staffList = new StaffList();
				staffList.setId(rs.getInt("id"));
				staffList.setName(rs.getString("name"));
				staffList.setAddress(rs.getString("address"));
				staffList.setZipCode(rs.getString("zipCode"));
				staffList.setPhone(rs.getString("phone"));
				staffList.setCity(rs.getString("city"));
				staffList.setCountry(rs.getString("country"));
				staffList.setSid(rs.getInt("sid"));
				list.add(staffList);
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
