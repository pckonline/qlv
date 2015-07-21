package Dao;

import java.sql.*;

/**
 * Created by online on 15-4-19.
 */
public class ConApply {
    public static void classApply(String aname, String aid, String reason, String time, String classid, String state,String amail) {
        //写入申请表
        Connection con = null;
        ResultSet res = null;
        Statement sta = null;
        try {
            con = ConSql.getCon();
            sta = con.createStatement();
            String sql = "insert into classApply(aname,aid,reason,time,classid,state,amail) values(" + "'" + aname + "'" + "," + "'" + aid + "'" + "," + "'" + reason + "'" + "," + "'" + time + "'" + "," + "'" + classid + "'" + "," + "'" + state + "'"+","+"'" + amail + "'" + ");";
            sta.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        ConSql.closeAll(res, sta, con);
    }

    public static String noCorrect() {
        //查看未批改的申请
        Connection con = null;
        ResultSet res = null;
        Statement sta = null;
        int i = 0;
        String kong = "<ul><li>已经批改完毕</li></ul>";
        String requ = "<ul>" + "<li>序号</li><li>姓名</li><li>学号</li><li>原由</li></ul>";
        try {
            con = ConSql.getCon();
            sta = con.createStatement();
            String sql = "select * from classApply where state='未批改';";
            res = sta.executeQuery(sql);
            while (res.next()) {
                i++;
                String id = res.getString(1);
                String aname = res.getString(2);
                String aid = res.getString(3);
                String reason = res.getString(4);
                requ = requ + "<ul><li>" + id + "</li><li>" + aname + "</li><li>" + aid + "</li><li class=\"reason\">" + reason + "</li></ul>";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return requ;
        }
        ConSql.closeAll(res,sta,con);
        if (i > 0) {
            return requ;
        } else {
            return kong;

        }


    }

    public static void rest(String id, String result) {//批改
        Connection con = null;
        Statement sta = null;
        try {
            con = ConSql.getCon();
            sta = con.createStatement();
            String sql = "update classApply set state='" + result + "' where id='" + id + "';";
            int i = sta.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        ConSql.closeAll(null,sta,con);
    }
    public static String toMail(String id){
        Connection con = null;
        PreparedStatement sta = null;
        ResultSet res = null;
        String mail=null;
        try {
            con = ConSql.getCon();
            String sql = "select amail from classApply where id=?;";
            sta = con.prepareStatement(sql);
            sta.setString(1,id);
            res=sta.executeQuery();
            while (res.next()){
                mail=res.getString(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        ConSql.closeAll(res,sta,con);
        return  mail;
    }


    public static String checkResult() {
        //用户查看批改的结果
        Connection con = null;
        ResultSet res = null;
        Statement sta = null;
        String requ = "<ul>" + "<li>序号</li><li>姓名</li><li>学号</li><li>结果</li></ul>";
        try {
            con = ConSql.getCon();
            sta = con.createStatement();
            String sql = "select * from classApply;";
            res = sta.executeQuery(sql);
            while (res.next()) {
                String id = res.getString(1);
                String aname = res.getString(2);
                String aid = res.getString(3);
                String state = res.getString(7);
                requ = requ + "<ul><li>" + id + "</li><li>" + aname + "</li><li>" + aid + "</li><li>" + state + "</li></ul>";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return requ;
        }
        ConSql.closeAll(res,sta,con);
            return requ;

    }
}
