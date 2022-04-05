package dao;

import java.util.*;
import java.sql.*;
import util.DBUtil;

public class FilmDao {
	// filmInStockCall 메서드
	public Map<String, Object> filmInStockCall(int filmId, int storeId) {
		Map<String, Object> map = new HashMap<String, Object>();
		Connection conn = null;
		// PreparedStatement : 쿼리를 실행
		// CallableStatement : 프로시저를 실행
		CallableStatement stmt = null;
		ResultSet rs = null;
		// select invetory_id...
		List<Integer> list = new ArrayList<>();
		// select count(inventory_id)..
		Integer count = 0;
		conn = DBUtil.getConnection();
		try {
			stmt = conn.prepareCall("{CALL film_in_stock(?, ?, ?)}");
			stmt.setInt(1, filmId);
			stmt.setInt(2, storeId);
			stmt.registerOutParameter(3, Types.INTEGER);
			rs = stmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt(1)); // rs.getInt("inventory_id")
			}
			count = stmt.getInt(3); // 프로시저 3번째 out변수 값 
			
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
		
		map.put("list", list);
		map.put("count", count);
		return map;
	}
	// filmNotInStockCall 메서드
	public Map<String, Object> filmNotInStockCall(int filmId, int storeId) {
		Map<String, Object> map = new HashMap<String, Object>();
		Connection conn = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		List<Integer> list = new ArrayList<>();
		Integer count = 0;
		conn = DBUtil.getConnection();
		try {
			stmt = conn.prepareCall("{CALL film_not_in_stock(?, ?, ?)}");
			stmt.setInt(1, filmId);
			stmt.setInt(2, storeId);
			stmt.registerOutParameter(3, Types.INTEGER);
			rs = stmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt(1));
			}
			count = stmt.getInt(3); // 프로시저 3번째 out변수 값
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
		
		map.put("list", list);
		map.put("count", count);
		
		return map;
	}
	
	public static void main(String[] args) {
		FilmDao fd = new FilmDao();
		int filmId = 1;
		int storeId = 1;
		Map<String, Object> map1 = fd.filmInStockCall(1, 1);
		List<Integer> list1 = (List<Integer>)map1.get("list");
		int count1 = (Integer)map1.get("count");
		
		System.out.println(filmId + "번 영화가 " + storeId + "번 가게에 " + count1 + "개 남음");
		for(int id : list1) {
			System.out.println(id);
		}
	}
}
