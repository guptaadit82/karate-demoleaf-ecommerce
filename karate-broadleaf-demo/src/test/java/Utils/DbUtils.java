package Utils;

import java.sql.*;
import java.util.*;

public class DbUtils {
    public static List<Map<String, Object>> executeQuery(String query) throws Exception {
        String url = "jdbc:mysql://localhost:3306/demo";  // change your DB config
        String username = "root";
        String password = "password";

        Connection conn = DriverManager.getConnection(url, username, password);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        List<Map<String, Object>> results = new ArrayList<>();
        ResultSetMetaData meta = rs.getMetaData();
        int columnCount = meta.getColumnCount();

        while (rs.next()) {
            Map<String, Object> row = new HashMap<>();
            for (int i = 1; i <= columnCount; i++) {
                row.put(meta.getColumnName(i), rs.getObject(i));
            }
            results.add(row);
        }

        rs.close(); stmt.close(); conn.close();
        return results;
    }
}
