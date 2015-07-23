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

//    注册用户
    public static void valUser() throws Exception {
        SessionFactory sf = ConnectMysql.con();
        Session see= sf.openSession();
        Transaction tx = see.beginTransaction();
        Regist lg = new Regist();
        lg.setUsername("1223");
        lg.setPassword("123456");
        lg.setUname("online");
        see.save(lg);
        tx.commit();
        ConnectMysql.closeSf(see,sf);

    }
}
