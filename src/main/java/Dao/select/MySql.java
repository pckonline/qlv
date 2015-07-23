package Dao.select;

import Dao.ConnectMysql;
import Dao.HibernateSql;
import Dao.popj.entity.Regist;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;


/**
 * Created by online on 15-7-23.
 */
public class MySql {
    public static boolean login(String username,String password) throws Exception {
        SessionFactory sf = ConnectMysql.con();
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        int count=0;
        boolean b =false;
        String sql = "select * from login where username=?1 and password=?2";
        List list = (List) see.createSQLQuery(sql)
                .addEntity(Regist.class)
                .setString("1",username)
                .setString("2",password)
                .list();
        for (Object ele : list){
            System.out.println(count++);
        }
        if (count>0){
            b=true;
        }
        tx.commit();
        ConnectMysql.closeSf(see,sf);
        return b;
    }

}
