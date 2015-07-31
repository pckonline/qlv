package Dao.select;

import Dao.cookie.Coolie;
import Dao.popj.entity.Infor;
import Dao.popj.entity.Message;
import Dao.popj.entity.Person;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.type.StandardBasicTypes;


import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;


/**
 * Created by online on 15-7-30.
 */
public class AboutMessage  {
    private SessionFactory sf;
    private Coolie coolie;
    private Person person;

    public void setSf(SessionFactory sf) {
        this.sf = sf;
    }

    public void setCoolie(Coolie coolie) {
        this.coolie = coolie;
    }

    public void setPerson(Person person) {
        this.person = person;
    }


    //文章写入数据库
    public void valMessage(HttpServletRequest request,String title,String body) throws UnsupportedEncodingException {
        Session see= sf.openSession();
        Transaction tx = see.beginTransaction();
        person.setUsername(Coolie.selectCookie(request,"zhanghao"));
        person.setMessage(new Message(title, body));
        see.save(person);
        tx.commit();
        see.close();
    }
    //查看自己发布的消息
    public List selfMessage(String username){
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        String sql ="select * from message_inf where username =?1 order by message_id desc limit 5 ";
        List list = see.createSQLQuery(sql)
                .addEntity(Person.class)
                .setString("1",username)
                .list();
        tx.commit();
        see.close();
        return list;
    }
    //查看全部人发布的消息
    public List allMessage(String username){
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        String sql ="select * from message_inf order by message_id desc limit 20 ";
        List list = see.createSQLQuery(sql)
                .addEntity(Person.class)
                .list();
        tx.commit();
        see.close();
        return list;
    }

}
