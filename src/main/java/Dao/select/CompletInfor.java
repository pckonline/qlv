package Dao.select;

import Dao.cookie.Coolie;
import Dao.popj.entity.*;
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
    private Love love;
    private Lmessage lmessage;
    private BeforeLove beforeLove;

    public void setBeforeLove(BeforeLove beforeLove) {
        this.beforeLove = beforeLove;
    }

    public void setLove(Love love) {
        this.love = love;
    }

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
    public void insetql(HttpServletRequest request, int boy_id,int girl_id,String meet_day,String know_day,String love_day){
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        Love love=new Love();
        love.setBoy_id(boy_id);
        love.setGirl_id(girl_id);
        love.setMeet_day(meet_day);
        love.setKnow_day(know_day);
        love.setLove_day(love_day);
        see.save(love);
        tx.commit();
        see.close();
    }
    //写入留言

    public void setLmessage(Lmessage lmessage) {
        this.lmessage = lmessage;
    }

    public void writelmessage(HttpServletRequest request, HttpServletResponse resp, String lmessage1) throws UnsupportedEncodingException {
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        lmessage.setUsername(Coolie.selectCookie(request,"zhanghao"));
        lmessage.setLeaveMessage(lmessage1);
        see.save(lmessage);
        tx.commit();
        see.close();
    }
    //写入申请情侣
    public void writeBeforeLove(HttpServletRequest request,String other_u,String me_loveword) throws UnsupportedEncodingException {
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        beforeLove.setMe_u(Coolie.selectCookie(request,"zhanghao"));
        beforeLove.setOther_u(other_u);
        beforeLove.setLoveword(me_loveword+Coolie.selectCookie(request, "sex"));
        beforeLove.setOder("未同意");
        see.save(beforeLove);
        tx.commit();
        see.close();
    }

    //如果自己是被示爱的对象，则在页面中显示并给予同意链接
    public List yesBeforeLove(String other_u){
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        String sql="select * from beforelove where other_u=?1 and oder='未同意'";
        List list = see.createSQLQuery(sql)
                .addEntity(BeforeLove.class)
                .setString("1",other_u)
                .list();
        tx.commit();
        see.close();
        return list;
    }
    //确定关系
    public void yestwo(String other_u,String me_u){
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        String sql = "select * from beforelove where other_u=?1 and me_u=?2";
        List l= see.createSQLQuery(sql)
                .addEntity(BeforeLove.class)
                .setString("1",other_u)
                .setString("2",me_u)
                .list();
        for(Object obj:l){
            BeforeLove p = (BeforeLove) obj;
            p.setOder("同意");
            see.update(p);
        }
        tx.commit();
        see.close();
    }
    //查看确定关系的情侣
    public List yesLove(String other_u){
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        String sql="select * from beforelove where oder='同意'";
        List list = see.createSQLQuery(sql)
                .addEntity(BeforeLove.class)
                .list();
        tx.commit();
        see.close();
        return list;
    }
    //申请成功
    public void alyestwo(String me_u){
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        String sql = "select * from beforelove where me_u=?1";//这样可样把申请人所有的申请都取消只保存同意的一条
        List l= see.createSQLQuery(sql)
                .addEntity(BeforeLove.class)
                .setString("1",me_u)
                .list();
        for(Object obj:l){
            BeforeLove p = (BeforeLove) obj;
            p.setOder("已批改");
            see.update(p);
        }
        tx.commit();
        see.close();
    }
}
