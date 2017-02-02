

/**
 * Created by user on 14/12/2016.
 */
package database;

import entity.queue;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

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
        String sql = "insert into queue VALUES(?,?,?,?)";
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
            pstmt.setInt(4,q.getId());

            if(pstmt.executeUpdate()==1){
                success = true;
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    public List<queue> getAllQueue() {
        String sql = "select * from queue";
        List<queue> list = new ArrayList<>();
        try {
            getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs != null && rs.next()) {
                queue q = new queue();
                q.setQueueNo(rs.getInt(1));
                q.setPatientId(rs.getInt(2));
                q.setDoctorName(rs.getString(3));
                list.add(q);
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Integer> getQueueNumbers() {
        String sql = "select queueNo from queue ";
        List<Integer> list = new ArrayList<>();
        try {
            getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs != null && rs.next()) {
                list.add(rs.getInt(1));
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
