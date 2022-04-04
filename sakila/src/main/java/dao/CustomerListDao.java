package dao;

import java.util.*;
import util.DBUtil;
import java.sql.*;
import vo.CustomerList;

public class CustomerListDao {
	public List<CustomerList> selectCustomerListViewByPage(int beginRow,int rowPerPage) {
		List<CustomerList> list = new ArrayList<CustomerList>();
		Connection conn = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT ID id, name,address, `zip code` zipCode, phone, city, country, notes, SID sid FROM customer_list LIMIT ?,?";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rs = stmt.executeQuery();
			// 데이터베이스 변환
			while(rs.next()) {
				CustomerList customerList = new CustomerList();
				customerList.setId(rs.getInt("id"));
				customerList.setName(rs.getString("name"));
				customerList.setAddress(rs.getString("address"));
				customerList.setZipCode(rs.getString("zipCode"));
				customerList.setPhone(rs.getString("phone"));
				customerList.setCity(rs.getString("city"));
				customerList.setCountry(rs.getString("country"));
				customerList.setNotes(rs.getString("notes"));
				customerList.setSid(rs.getInt("sid"));
				list.add(customerList);
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
	// CustomerList 전체 행 수 반환 메서드
	public int selectCustomerListTotalRow() {
		int row = 0;
		Connection conn = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT COUNT(*) cnt FROM customer_list";
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
