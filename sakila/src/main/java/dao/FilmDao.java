package dao;

import java.util.*;
import java.sql.*;
import util.DBUtil;
import vo.*;

public class FilmDao {
	public int filmSearchTotalRow(String category, String rating, double price, int length, String title, String actors) { // 검색 내역 전체 행의 수
		int row = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		try {
			// 동적쿼리
			String sql = "SELECT COUNT(*) cnt FROM film_list WHERE title LIKE ? AND actors LIKE ?"; 
			if(category.equals("") && rating.equals("") && price == -1 && length == -1) { // category, rating, price, length가 입력되지 않은 경우
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
			} else if(category.equals("") && rating.equals("") && price == -1 && length != -1) { // length만 입력된 경우
				if(length == 0) {
					sql += " AND length<60";
				} else if (length == 1) {
					sql += " AND length>=60";
				}
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
			} else if(category.equals("") && rating.equals("") && price != -1 && length == -1) { // price만 입력된 경우
				sql += " AND price=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setDouble(3, price);
			} else if(category.equals("") && !rating.equals("") && price == -1 && length == -1) { // rating만 입력된 경우
				sql += " AND rating=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, rating);
			} else if(!category.equals("") && rating.equals("") && price == -1 && length == -1) { // category만 입력된 경우
				sql += " AND category=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, category);
			} else if(!category.equals("") && !rating.equals("") && price == -1 && length == -1) { // category, rating이 입력된 경우
				sql += " AND category=? AND rating=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, category);
				stmt.setString(4, rating);
			} else if(!category.equals("") && rating.equals("") && price != -1 && length == -1) { // category, price가 입력된 경우
				sql += " AND category=? AND price=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, category);
				stmt.setDouble(4, price);
			} else if(!category.equals("") && rating.equals("") && price == -1 && length != -1) { // category, length가 입력된 경우
				if(length == 0) {
					sql += " AND category=? AND length<60";
				} else if (length == 1) {
					sql += " AND category=? AND length>=60";
				}
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, category);
			} else if(category.equals("") && !rating.equals("") && price != -1 && length == -1) { // rating, price가 입력된 경우
				sql += " AND rating=? AND price=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, rating);
				stmt.setDouble(4, price);
			} else if(category.equals("") && !rating.equals("") && price == -1 && length != -1) { // rating, length가 입력된 경우
				if(length == 0) {
					sql += " AND rating=? AND length<60";
				} else if (length == 1) {
					sql += " AND rating=? AND length>=60";
				}
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, rating);
			} else if(category.equals("") && rating.equals("") && price != -1 && length != -1) { // price, length가 입력된 경우
				if(length == 0) {
					sql += " AND price=? AND length<60";
				} else if (length == 1) {
					sql += " AND price=? AND length>=60";
				}
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setDouble(3, price);
			} else if(!category.equals("") && !rating.equals("") && price != -1 && length == -1) { // category, rating, price가 입력된 경우
				sql += " AND category=? AND rating=? AND price=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, category);
				stmt.setString(4, rating);
				stmt.setDouble(5, price);
			} else if(!category.equals("") && !rating.equals("") && price == -1 && length != -1) { // category, rating, length가 입력된 경우
				if(length == 0) {
					sql += " AND category=? AND rating=? AND length<60";
				} else if (length == 1) {
					sql += " AND category=? AND rating=? AND length>=60";
				}
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, category);
				stmt.setString(4, rating);
			} else if(!category.equals("") && rating.equals("") && price != -1 && length != -1) { // category, price, length가 입력된 경우
				if(length == 0) {
					sql += " AND category=? AND price=? AND length<60";
				} else if (length == 1) {
					sql += " AND category=? AND price=? AND length>=60";
				}
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, category);
				stmt.setDouble(4, price);
			} else if(category.equals("") && !rating.equals("") && price != -1 && length != -1) { // rating, price, length가 입력된 경우
				if(length == 0) {
					sql += " AND rating=? AND price=? AND length<60";
				} else if (length == 1) {
					sql += " AND rating=? AND price=? AND length>=60";
				}
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, rating);
				stmt.setDouble(4, price);
			} else if(!category.equals("") && !rating.equals("") && price != -1 && length != -1) { // category, rating, price, length가 모두 입력된 경우
				if(length == 0) {
					sql += " AND category=? AND rating=? AND price=? AND length<60";
				} else if (length == 1) {
					sql += " AND category=? AND rating=? AND price=? AND length>=60";
				}
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, category);
				stmt.setString(4, rating);
				stmt.setDouble(5, price);
			} 
			
			rs = stmt.executeQuery();
			if(rs.next()) {
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
	public List<FilmList> selectFilmListSearch(int beginRow, int rowPerPage, String category, String rating, double price, int length, String title, String actors) {
		List<FilmList> list = new ArrayList<FilmList>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		try {
			// 동적쿼리
			String sql = "SELECT FID fid, title, description, category, price, length, rating, actors FROM film_list WHERE title LIKE ? AND actors LIKE ?";
			if(category.equals("") && rating.equals("") && price == -1 && length == -1) { // category, rating, price, length가 입력되지 않은 경우
				sql += " ORDER BY fid LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setInt(3, beginRow);
				stmt.setInt(4, rowPerPage);
			}
			else if(category.equals("") && rating.equals("") && price == -1 && length != -1) { // length만 입력된 경우
				if(length == 0) {
					sql += " AND length<60 ORDER BY fid LIMIT ?,?";
				} else if (length == 1) {
					sql += " AND length>=60 ORDER BY fid LIMIT ?,?";
				}
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setInt(3, beginRow);
				stmt.setInt(4, rowPerPage);
			} else if(category.equals("") && rating.equals("") && price != -1 && length == -1) { // price만 입력된 경우
				sql += " AND price=? ORDER BY fid LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setDouble(3, price);
				stmt.setInt(4, beginRow);
				stmt.setInt(5, rowPerPage);
			} else if(category.equals("") && !rating.equals("") && price == -1 && length == -1) { // rating만 입력된 경우
				sql += " AND rating=? ORDER BY fid LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, rating);
				stmt.setInt(4, beginRow);
				stmt.setInt(5, rowPerPage);
			} else if(!category.equals("") && rating.equals("") && price == -1 && length == -1) { // category만 입력된 경우
				sql += " AND category=? ORDER BY fid LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, category);
				stmt.setInt(4, beginRow);
				stmt.setInt(5, rowPerPage);
			} else if(!category.equals("") && !rating.equals("") && price == -1 && length == -1) { // category, rating이 입력된 경우
				sql += " AND category=? AND rating=? ORDER BY fid LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, category);
				stmt.setString(4, rating);
				stmt.setInt(5, beginRow);
				stmt.setInt(6, rowPerPage);
			} else if(!category.equals("") && rating.equals("") && price != -1 && length == -1) { // category, price가 입력된 경우
				sql += " AND category=? AND price=? ORDER BY fid LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, category);
				stmt.setDouble(4, price);
				stmt.setInt(5, beginRow);
				stmt.setInt(6, rowPerPage);
			} else if(!category.equals("") && rating.equals("") && price == -1 && length != -1) { // category, length가 입력된 경우
				if(length == 0) {
					sql += " AND category=? AND length<60 ORDER BY fid LIMIT ?,?";
				} else if (length == 1) {
					sql += " AND category=? AND length>=60 ORDER BY fid LIMIT ?,?";
				}
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, category);
				stmt.setInt(4, beginRow);
				stmt.setInt(5, rowPerPage);
			} else if(category.equals("") && !rating.equals("") && price != -1 && length == -1) { // rating, price가 입력된 경우
				sql += " AND rating=? AND price=? ORDER BY fid LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, rating);
				stmt.setDouble(4, price);
				stmt.setInt(5, beginRow);
				stmt.setInt(6, rowPerPage);
			} else if(category.equals("") && !rating.equals("") && price == -1 && length != -1) { // rating, length가 입력된 경우
				if(length == 0) {
					sql += " AND rating=? AND length<60 ORDER BY fid LIMIT ?,?";
				} else if (length == 1) {
					sql += " AND rating=? AND length>=60 ORDER BY fid LIMIT ?,?";
				}
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, rating);
				stmt.setInt(4, beginRow);
				stmt.setInt(5, rowPerPage);
			} else if(category.equals("") && rating.equals("") && price != -1 && length != -1) { // price, length가 입력된 경우
				if(length == 0) {
					sql += " AND price=? AND length<60 ORDER BY fid LIMIT ?,?";
				} else if (length == 1) {
					sql += " AND price=? AND length>=60 ORDER BY fid LIMIT ?,?";
				}
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setDouble(3, price);
				stmt.setInt(4, beginRow);
				stmt.setInt(5, rowPerPage);
			} else if(!category.equals("") && !rating.equals("") && price != -1 && length == -1) { // category, rating, price가 입력된 경우
				sql += " AND category=? AND rating=? AND price=? ORDER BY fid LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, category);
				stmt.setString(4, rating);
				stmt.setDouble(5, price);
				stmt.setInt(6, beginRow);
				stmt.setInt(7, rowPerPage);
			} else if(!category.equals("") && !rating.equals("") && price == -1 && length != -1) { // category, rating, length가 입력된 경우
				if(length == 0) {
					sql += " AND category=? AND rating=? AND length<60 ORDER BY fid LIMIT ?,?";
				} else if (length == 1) {
					sql += " AND category=? AND rating=? AND length>=60 ORDER BY fid LIMIT ?,?";
				}
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, category);
				stmt.setString(4, rating);
				stmt.setInt(5, beginRow);
				stmt.setInt(6, rowPerPage);
			} else if(!category.equals("") && rating.equals("") && price != -1 && length != -1) { // category, price, length가 입력된 경우
				if(length == 0) {
					sql += " AND category=? AND price=? AND length<60 ORDER BY fid LIMIT ?,?";
				} else if (length == 1) {
					sql += " AND category=? AND price=? AND length>=60 ORDER BY fid LIMIT ?,?";
				}
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, category);
				stmt.setDouble(4, price);
				stmt.setInt(5, beginRow);
				stmt.setInt(6, rowPerPage);
			} else if(category.equals("") && !rating.equals("") && price != -1 && length != -1) { // rating, price, length가 입력된 경우
				if(length == 0) {
					sql += " AND rating=? AND price=? AND length<60 ORDER BY fid LIMIT ?,?";
				} else if (length == 1) {
					sql += " AND rating=? AND price=? AND length>=60 ORDER BY fid LIMIT ?,?";
				}
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, rating);
				stmt.setDouble(4, price);
				stmt.setInt(5, beginRow);
				stmt.setInt(6, rowPerPage);
			} else if(!category.equals("") && !rating.equals("") && price != -1 && length != -1) { // category, rating, price, length가 모두 입력된 경우
				if(length == 0) {
					sql += " AND category=? AND rating=? AND price=? AND length<60 ORDER BY fid LIMIT ?,?";
				} else if (length == 1) {
					sql += " AND category=? AND rating=? AND price=? AND length>=60 ORDER BY fid LIMIT ?,?";
				}
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + title + "%");
				stmt.setString(2, "%" + actors + "%");
				stmt.setString(3, category);
				stmt.setString(4, rating);
				stmt.setDouble(5, price);
				stmt.setInt(6, beginRow);
				stmt.setInt(7, rowPerPage);
			} 
			
			rs = stmt.executeQuery();
			while(rs.next()) {
				FilmList f = new FilmList();
				f.setFid(rs.getInt("fid"));
				f.setTitle(rs.getString("title"));
				f.setDescription(rs.getString("description"));
				f.setCategory(rs.getString("category"));
				f.setPrice(rs.getDouble("price"));
				f.setLength(rs.getInt("length"));
				f.setRating(rs.getString("rating"));
				f.setActors(rs.getString("actors"));
				list.add(f);
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
	public List<Double> selectFilmPriceList() {
		List<Double> list = new ArrayList<Double>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT DISTINCT price FROM film_list ORDER BY price";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getDouble("price"));
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
	
	// filmInStock filmNotInStock 프로시저 film_id 유효성
	public int existFilmId(int filmId) {
		int id = 0;
		Connection conn = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT film_id filmId FROM film WHERE film_id=?";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, filmId);
			rs = stmt.executeQuery();
			// 데이터베이스 변환
			if(rs.next()) {
				id = rs.getInt("filmId");
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
		return id;
	}
	
}
