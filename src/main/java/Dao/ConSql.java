package Dao;

import java.sql.*;

/**
 * Created by online on 15-4-2.
 */
public class ConSql {
    public static Connection getCon(){//获取数据库的链接。
        Connection con = null;
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/classroom?"+
                "user=root&password=p5385676&useUnicode=true&characterEncoding=UTF8";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            con = DriverManager.getConnection(url);
            return con;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void insertUser(String way,String mid,String mpass){//功能:增加用户，教务处
        Connection con = null;
        PreparedStatement sta = null;
        ResultSet res = null;
        try{
            con = getCon();
            String sql=  "insert into "+way+"(mid,mpass) values(?,?);";
            sta = con.prepareStatement(sql);
            sta.setString(1,mid);
            sta.setString(2,mpass);
            sta.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        closeAll(res,sta,con);
    }
    public static boolean validationUser(String way,String mid,String mpass){//验证用户名和密码是否匹配。
        Connection con = null;
        PreparedStatement sta = null;
        ResultSet rs = null;
        int i = 0;
        try{
            if (way.equals("教师"))
                way="wayClass";
            if (way.equals("部门"))
                way="wayMan";
            con = getCon();
            String sql = "select * from "+way+" where mid=? and mpass=?;";
            sta = con.prepareStatement(sql);
            sta.setString(1,mid);
            sta.setString(2,mpass);
            rs=sta.executeQuery();
        while (rs.next()){
            i++;
        }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        closeAll(rs,sta,con);
        if (i>0){
            return true;
        }
        else {
            return false;
        }
    }
    public static boolean validationUserName(String way,String mid){//验证用户名和密码是否匹配。
        Connection con = null;
        Statement sta = null;
        ResultSet rs = null;
        int i = 0;
        try{
            if (way.equals("教师"))
                way="wayClass";
            if (way.equals("部门"))
                way="wayMan";
            con = getCon();
            sta = con.createStatement();
            String sql = "select * from "+way+" where mid="+"'"+mid+"'"+";";
            rs=sta.executeQuery(sql);
            while (rs.next()){
                i++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        closeAll(rs,sta,con);
        if (i>0){
            return true;
        }
        else {
            return false;
        }
    }
    public static void closeAll(ResultSet rs,Statement stmt,Connection con){
        try{
            if(rs!=null)
                rs.close();
            if (stmt!=null)
                stmt.close();
            if (con!=null)
                con.close();
        } catch (Exception ex) {
            System.out.println("Error : " + ex.toString());
        }

    }
}
