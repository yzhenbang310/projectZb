
/**
 * Created by user on 14/12/2016.
 */
package database;

import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import entity.*;

public class DB {
    Connection con;
    // Database configuration
    public static String url = "jdbc:mysql://localhost/project";
    public static String dbdriver = "com.mysql.jdbc.Driver";
    public static String username = "root";
    public static String password = "mysql";
    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    DateFormat dateOnly = new SimpleDateFormat("yyyy-MM-dd");

    public DB() throws Exception {
        Class.forName(dbdriver);
        con = DriverManager.getConnection(url, username, password);
    }
    // this is to make sure that connection is not null when you used it
    public void getConnection() throws SQLException {
        if (con == null) con = DriverManager.getConnection(url, username, password);
    }

    public boolean createQueueNumber(queue q){
        String sql = "insert into appointment VALUES(?,?,?)";
        boolean success = false;
        //java.util.Date sDate = null;
        try {
            //sDate = formatter.parse(q.getDate());
            //java.sql.Timestamp sqlDate = new java.sql.Timestamp(sDate.getTime());
            getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,q.getQueueNo());
            pstmt.setInt(2,q.getPatientId());
            pstmt.setString(3,q.getDoctorName());

            if(pstmt.executeUpdate()==1){
                success = true;
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    public queue getQueueNumber(int queueNo) {
        String sql = "select * from queue where queueNo = ?";
       queue q = null;
        try {
            getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,queueNo);
            ResultSet rs = pstmt.executeQuery();
            if (rs != null && rs.next()) {
                q = new queue();
                q.setPatientId(rs.getInt(1));
                q.setDoctorName(rs.getString(2));
                //q.set(rs.getString(3));
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return q;
    }

}
