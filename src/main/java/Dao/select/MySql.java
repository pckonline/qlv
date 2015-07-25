package Dao.select;

import Dao.popj.entity.Regist;
import com.opensymphony.xwork2.ActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.type.StandardBasicTypes;

import java.util.List;


/**
 * Created by online on 15-7-23.
 */
public class MySql {
    private SessionFactory sf;
    private Regist lg;

    public void setLg(Regist lg) {
        this.lg = lg;
    }

    public SessionFactory getSf() {
        return sf;
    }

    public void setSf(SessionFactory sf) {
        this.sf = sf;
    }

    //    验证是否登录成功
    public boolean login(String username,String password) throws Exception {
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        int count=0;
        boolean b =false;
        String uname=null;
        String sql = "select * from login where username=?1 and password=?2";
        List list = see.createSQLQuery(sql)
                .addEntity(Regist.class)
                .setString("1",username)
                .setString("2",password)
                .list();
        for (Object ele : list){
            count++;
            Regist regist = (Regist) ele;
            uname=regist.getUname();
        }
        if (count>0){
            b=true;
            ActionContext ac = ActionContext.getContext();
            ac.getSession().put("uname",uname);
        }
        tx.commit();
        see.close();
        return b;
    }
    public boolean valiUsername(String username){//验证用户名是否有人注册,有人注册:true
        boolean b=false;
        int count = 0;
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        String sql = "select * from login where username=?1";
        List list = see.createSQLQuery(sql)
                .addScalar("username", StandardBasicTypes.STRING)
                .setString("1",username)
                .list();
        for(Object ele : list){
            count++;
        }
        if (count>0){
            b=true;
        }
        tx.commit();
        see.close();
        return b;
    }
    public void valUser(String username,String password,String uname) throws Exception {//注册信息写入数据库
        Session see= sf.openSession();
        Transaction tx = see.beginTransaction();
        lg.setUsername(username);
        lg.setPassword(password);
        lg.setUname(uname);
        see.save(lg);
        tx.commit();
        see.close();
    }

}
