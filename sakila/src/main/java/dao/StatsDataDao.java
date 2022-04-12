package dao;

import java.util.*;
import java.sql.*;
import util.DBUtil;

public class StatsDataDao {
	public List<Map<String, Object>> amountByCustomer() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT p.customer_id customerId,"
				+ " CONCAT(c.first_name,' ',c.last_name) name,"
				+ " SUM(amount) total,"
				+ " COUNT(*) cnt"
				+ " FROM payment p INNER JOIN customer c"
				+ " ON p.customer_id = c.customer_id"
				+ " GROUP BY p.customer_id"
				+ " ORDER BY SUM(p.amount) DESC LIMIT 0,10";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("customerId", rs.getInt("customerId"));
				m.put("name", rs.getString("name"));
				m.put("total", rs.getString("total"));
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	
	public List<Map<String, Object>> filmCountByRentalRate() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT rental_rate rentalRate,COUNT(*) cnt FROM film"
				+ " GROUP BY rental_rate"
				+ " ORDER BY rental_rate";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("rentalRate", rs.getDouble("rentalRate"));
				m.put("cnt", rs.getString("cnt"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	
	public List<Map<String, Object>> filmCountByRating() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT r.rating rating, r.cnt cnt"
				+ " FROM (SELECT rating, COUNT(*) cnt,"
				+ "			(CASE WHEN rating='G' THEN '1'"
				+ "		  		   WHEN rating='PG-13' THEN '2'"
				+ "		  		   WHEN rating='R' THEN '3'"
				+ "		  		   WHEN rating='NC-17' THEN '4'"
				+ "		  		   ELSE '5'"
				+ "			END)ratingOrder"
				+ "		FROM film"
				+ "		GROUP BY rating"
				+ "		ORDER BY ratingOrder)r";
		// G : 전체관람, PG-13 : 13세 미만, R : 17세 미만, NC-17 : 18세 이상, PG : 부모의 지도 필요
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("rating", rs.getString("rating"));
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	public Map<String, Object> bestRentalCustomer() {
		Map<String, Object> map = new HashMap<String, Object>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT customer_id customerId, store_id storeId, CONCAT(first_name,' ',last_name) cName, email, address_id addressId, active, create_date createDate, last_update lastUpdate  FROM customer"
				+ " WHERE customer_id = (SELECT customer_id FROM payment GROUP BY customer_id ORDER BY COUNT(*) DESC LIMIT 0,1)";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				map.put("customerId", rs.getInt("customerId"));
				map.put("storeId", rs.getInt("storeId"));
				map.put("cName", rs.getString("cName"));
				map.put("email", rs.getString("email"));
				map.put("addressId", rs.getInt("addressId"));
				map.put("active", rs.getInt("active"));
				map.put("createDate", rs.getString("createDate"));
				map.put("lastUpdate", rs.getString("lastUpdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return map;
	}
	public List<Map<String, Object>> filmCountByLanguage() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT l.name name, COUNT(*) cnt"
				+ " FROM film f INNER JOIN language l"
				+ " ON f.language_id = l.language_id"
				+ " GROUP BY l.name";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("name", rs.getString("name"));
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	
	public List<Map<String, Object>> filmCountByLength() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT tt.filmLength filmLength, tt.cnt cnt"
				+ " FROM (SELECT t.filmLength, COUNT(*) cnt,"
				+ "				  (CASE WHEN t.filmLength='less60' THEN '1'"
				+ "				 	     WHEN t.filmLength='between61and120' THEN '2'"
				+ "				  		 WHEN t.filmLength='between121and180' THEN '3'"
				+ "				 	     ELSE '4'"
				+ "				   END) lengthOrder"
				+ "		FROM (SELECT title, LENGTH,"
				+ "					(CASE WHEN LENGTH<=60 THEN 'less60'"
				+ "				     	   WHEN LENGTH BETWEEN 61 AND 120 THEN 'between61and120'"
				+ "				      	WHEN LENGTH BETWEEN 121 AND 180 THEN 'between121and180'"
				+ "				      	ELSE 'more180'"
				+ "				 	 END) filmLength"
				+ "			   FROM film) t"
				+ "		GROUP BY t.filmLength"
				+ "		ORDER BY lengthOrder ) tt";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("filmLength", rs.getString("filmLength"));
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	public List<Map<String, Object>> filmCountByActor() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT f.actor_id actorId, CONCAT(a.first_name,' ',a.last_name) actorName, COUNT(*) cnt"
				+ " FROM film_actor f INNER JOIN actor a"
				+ " ON f.actor_id=a.actor_id"
				+ " GROUP BY f.actor_id"
				+ " ORDER BY COUNT(*) DESC LIMIT 0,10";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("actorId", rs.getInt("actorId"));
				m.put("actorName", rs.getString("actorName"));
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	
	public List<Map<String, Object>> inventoryCountByStore() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT store_id storeId, COUNT(*) cnt"
				+ " FROM inventory"
				+ " GROUP BY store_id";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("storeId", rs.getInt("storeId"));
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	
	public List<Map<String, Object>> rentalCountByStaff() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT r.staff_id staffId, CONCAT(s.first_name,' ',s.last_name) staffName, COUNT(*) cnt"
				+ " FROM rental r INNER JOIN staff s"
				+ " ON r.staff_id = s.staff_id"
				+ " GROUP BY r.staff_id";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("staffId", rs.getInt("staffId"));
				m.put("staffName", rs.getString("staffName"));
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	
	public List<Map<String, Object>> storeByCustomer() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT r.customer_id customerId, s.store_id storeId, COUNT(*) cnt"
				+ " FROM rental r INNER JOIN staff s"
				+ " ON r.staff_id = s.staff_id"
				+ " GROUP BY r.customer_id, s.store_id"
				+ " ORDER BY COUNT(*) DESC LIMIT 0,10";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("customerId", rs.getInt("customerId"));
				m.put("storeId", rs.getInt("storeId"));
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	
	public List<Map<String, Object>> amountByFilm() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT i.film_id filmId, f.title title, SUM(p.amount) amount"
				+ " FROM payment p"
				+ " INNER JOIN rental r ON p.rental_id = r.rental_id"
				+ " INNER JOIN inventory i ON r.inventory_id = i.inventory_id"
				+ " INNER JOIN film f ON i.film_id = f.film_id"
				+ " GROUP BY i.film_id"
				+ " ORDER BY amount DESC LIMIT 0,10";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("filmId", rs.getInt("filmId"));
				m.put("title", rs.getString("title"));
				m.put("amount", rs.getDouble("amount"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	
	public List<Map<String, Object>> rentalCountByFilm() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT i.film_id filmId, f.title title, COUNT(*) cnt"
				+ " FROM rental r"
				+ " INNER JOIN inventory i ON r.inventory_id = i.inventory_id"
				+ " INNER JOIN film f ON i.film_id = f.film_id"
				+ " GROUP BY i.film_id"
				+ " ORDER BY COUNT(*) DESC LIMIT 0,10";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("filmId", rs.getInt("filmId"));
				m.put("title", rs.getString("title"));
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	
	public List<Map<String, Object>> rentalCountByInventory() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT inventory_id inventoryId, COUNT(*) cnt"
				+ " FROM rental r"
				+ " GROUP BY inventory_id"
				+ " ORDER BY COUNT(*) DESC LIMIT 0,10";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("inventoryId", rs.getInt("inventoryId"));
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	public List<Map<String, Object>> amountByActor() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT fa.actor_id actorId,CONCAT(a.first_name,' ',a.last_name) actorName, SUM(p.amount) amount"
				+ " FROM payment p"
				+ " INNER JOIN rental r ON p.rental_id = r.rental_id"
				+ " INNER JOIN inventory i ON r.inventory_id = i.inventory_id"
				+ " INNER JOIN film f ON i.film_id = f.film_id"
				+ " INNER JOIN film_actor fa ON f.film_id = fa.film_id"
				+ " INNER JOIN actor a ON fa.actor_id = a.actor_id"
				+ " GROUP BY fa.actor_id"
				+ " ORDER BY amount DESC LIMIT 0,10";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("actorId", rs.getInt("actorId"));
				m.put("actorName", rs.getString("actorName"));
				m.put("amount", rs.getDouble("amount"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	
	public List<Map<String, Object>> customerCountByCountry() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT ctr.country_id countryId, ctr.country country,COUNT(*) cnt"
				+ " FROM customer c"
				+ " INNER JOIN address a ON c.address_id = a.address_id"
				+ " INNER JOIN city ct ON a.city_id = ct.city_id"
				+ " INNER JOIN country ctr ON ct.country_id = ctr.country_id"
				+ " GROUP BY ctr.country_id"
				+ " ORDER BY COUNT(*) DESC LIMIT 0,10";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("countryId", rs.getInt("countryId"));
				m.put("country", rs.getString("country"));
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	public List<Map<String, Object>> lengthAvgByCategory() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT fc.category_id categoryId, c.name categoryName, ROUND(AVG(f.length), 1) lengthAvg"
				+ " FROM film f"
				+ " INNER JOIN film_category fc ON f.film_id=fc.film_id"
				+ " INNER JOIN category c ON fc.category_id=c.category_id"
				+ " GROUP BY fc.category_id";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("categoryId", rs.getInt("categoryId"));
				m.put("categoryName", rs.getString("categoryName"));
				m.put("lengthAvg", rs.getDouble("lengthAvg"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	public List<Map<String, Object>> amountByZeroActiveCustomer() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT p.customer_id customerId, CONCAT(c.first_name,' ',c.last_name) cName, SUM(p.amount) amount"
				+ " FROM payment p"
				+ " INNER JOIN customer c ON p.customer_id=c.customer_id"
				+ " WHERE c.active = 0"
				+ " GROUP BY c.customer_id"
				+ " ORDER BY COUNT(*) DESC LIMIT 0,10";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("customerId", rs.getInt("customerId"));
				m.put("cName", rs.getString("cName"));
				m.put("amount", rs.getDouble("amount"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	public List<Map<String, Object>> monthByStore() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT s.store_id storeId, CONCAT(YEAR(p.payment_date),'-',MONTH(p.payment_date))yearMonth ,SUM(amount) amount"
				+ " FROM payment p"
				+ " INNER JOIN staff s ON p.staff_id=s.staff_id"
				+ " GROUP BY store_id, yearMonth"
				+ " ORDER BY store_id";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("storeId", rs.getInt("storeId"));
				m.put("yearMonth", rs.getString("yearMonth"));
				m.put("amount", rs.getDouble("amount"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	
	public List<Map<String, Object>> dayOfWeekByStore() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT s.store_id storeId, case t.w"
				+ "					WHEN 0 THEN 'Mon'"
				+ "					WHEN 1 THEN 'Tue'"
				+ "					WHEN 2 THEN 'Wed'"
				+ "					WHEN 3 THEN 'Thu'"
				+ "					WHEN 4 THEN 'Fri'"
				+ "					WHEN 5 THEN 'Sat'"
				+ "					WHEN 6 THEN 'Sun'"
				+ "				END dayOfWeek,t.c amount"
				+ " FROM (SELECT staff_id, WEEKDAY(payment_date) w, COUNT(*) c"
				+ "		FROM payment"
				+ "		GROUP BY staff_id, WEEKDAY(payment_date)) t"
				+ "		INNER JOIN staff s"
				+ "		ON t.staff_id = s.staff_id"
				+ " ORDER BY t.w, s.store_id ASC";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("storeId", rs.getInt("storeId"));
				m.put("dayOfWeek", rs.getString("dayOfWeek"));
				m.put("amount", rs.getDouble("amount"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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
	
	public List<Map<String, Object>> timeAmountByStore() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT IF(HOUR(p.payment_date)=0,24,HOUR(p.payment_date)) paymentHour, SUM(amount) amount"
				+ " FROM payment p"
				+ " GROUP BY HOUR(p.payment_date)"
				+ " ORDER BY paymentHour";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("paymentHour", rs.getInt("paymentHour"));
				m.put("amount", rs.getDouble("amount"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB자원 해지
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

}
