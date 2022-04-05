package dao;

import java.util.*;
import util.DBUtil;
import java.sql.*;

public class RewardsReportDao {
   public Map<String, Object> rewardsReportCall(int minPurchase, double minDollar) {
	  List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	  Map<String, Object> map = null;
      Connection conn = null;
      CallableStatement stmt = null; // 프로시저 실행
      ResultSet rs = null;
      Integer count = 0;
      conn = DBUtil.getConnection();
      try {
         stmt = conn.prepareCall("{CALL rewards_report(?,?,?)}");
         stmt.setInt(1, minPurchase);
         stmt.setDouble(2, minDollar);
         stmt.registerOutParameter(3, Types.INTEGER);
         rs = stmt.executeQuery();
         count = stmt.getInt(3); // 프로시저 3번째 out변수 값 
         while(rs.next()) {
        	Map<String,Object> tempMap = new HashMap<String,Object>();
        	tempMap.put("customerId",rs.getInt("customer_id"));
        	tempMap.put("storeId",rs.getInt("store_id"));
        	tempMap.put("firstName",rs.getString("first_name"));
        	tempMap.put("lastName",rs.getString("last_name"));
        	tempMap.put("email",rs.getString("email"));
        	tempMap.put("addressId",rs.getInt("address_id"));
        	tempMap.put("active",rs.getInt("active"));
        	tempMap.put("createDate",rs.getString("create_date"));
        	tempMap.put("lastUpdate",rs.getString("last_update"));
            list.add(tempMap);
         }
         map = new HashMap<String, Object>(); // count + 리스트
         map.put("count", stmt.getInt(3)); // 프로시저 3번째 out변수 count
         map.put("list", list); // 리스트 맵에 담기
         
      } catch (SQLException e) {
         e.printStackTrace();
      }  finally {
    	  try {
            // 데이터베이스 자원 반환
            rs.close();
            stmt.close();
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      return map;
   }
}