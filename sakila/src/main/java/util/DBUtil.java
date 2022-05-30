package util;

import java.sql.*;
import java.sql.DriverManager;
// 후에 마리아db의 비밀번호 변경 등의 변화가 있을 때 유지보수를 조금 더 용이하게하기 위한 페이지
public class DBUtil {
	public static Connection getConnection () {
		Connection conn = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://3.38.213.210/sakila","root","mariadb1234");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
}
