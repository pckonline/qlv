package Dao;

import Dao.popj.entity.Regist;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 * Created by online on 15-7-23.
 */
//这个类用来写所有sql持久类操作。
public class HibernateSql {
    private SessionFactory sf;

    public void setLg(Regist lg) {
        this.lg = lg;
    }

    private Regist lg;

    public SessionFactory getSf() {
        return sf;
    }

    public void setSf(SessionFactory sf) {
        this.sf = sf;
    }

    //    注册用户
    public void valUser() throws Exception {
        Session see= sf.openSession();
        Transaction tx = see.beginTransaction();
        lg.setUsername("1223");
        lg.setPassword("123456");
        lg.setUname("online");
        see.save(lg);
        tx.commit();
        see.close();
        sf.close();

    }
}
