package Dao.select;

import Dao.cookie.Coolie;
import Dao.popj.entity.Infor;
import Dao.popj.entity.Love;
import Dao.popj.entity.Regist;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by online on 15-7-26.
 */
public class CompletInfor {
    private SessionFactory sf;
    private Infor infor;
    private Coolie coolie;

    public void setCoolie(Coolie coolie) {
        this.coolie = coolie;
    }

    public void setInfor(Infor infor) {
        this.infor = infor;
    }

    public void setSf(SessionFactory sf) {
        this.sf = sf;
    }

    //更新自我描述的information
    public void newInfor(HttpServletRequest request, HttpServletResponse resp, String infor) throws UnsupportedEncodingException {
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        int infor_id1 = 0;
        String sql = "select * from login where username=?1";
        List list = see.createSQLQuery(sql)
                .addEntity(Regist.class)
                .setString("1", Coolie.selectCookie(request, "zhanghao"))
                .list();

        for (Object ele : list) {
            Regist regist = (Regist) ele;
            infor_id1 = regist.getId();
        }
        String sql1 = "update infor set information=?1 where infor_id=?2";
        coolie.addCookie(resp, "information", infor);
        Query query = see.createSQLQuery(sql1)
                .setString("1", infor).setInteger("2", infor_id1);
        query.executeUpdate();
        tx.commit();
        see.close();
    }

    //通过username查id
    public int selectid(HttpServletRequest request, String username) throws UnsupportedEncodingException {
        int id = 0;
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        System.out.println("2");
        String sql = "select * from login where username=?1";
        System.out.println("3");
        List list = see.createSQLQuery(sql)
                .addEntity(Regist.class)
                .setString("1", username)
                .list();
        System.out.println(username);
        for (Object ele : list) {
            Regist regist = (Regist) ele;
            id = regist.getId();
        }
        System.out.println(id);
        tx.commit();
        see.close();
        return id;
    }
    //传入Session,因为在查询中需要用到查询
    public void insetql(HttpServletRequest request, int boy_id,int girl_id){
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        Love love=new Love();
        love.setBoy_id(boy_id);
        love.setGirl_id(girl_id);
        see.save(love);
        tx.commit();
        see.close();
    }
}
