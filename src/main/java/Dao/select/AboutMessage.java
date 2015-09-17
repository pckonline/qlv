package Dao.select;

import Dao.cookie.Coolie;
import Dao.popj.entity.Infor;
import Dao.popj.entity.Lmessage;
import Dao.popj.entity.Message;
import Dao.popj.entity.Person;
import org.hibernate.*;
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
    private Lmessage lmessage;

    public void setLmessage(Lmessage lmessage) {
        this.lmessage = lmessage;
    }

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
    //查看指定的消息的内容
    public List selfMessageBody(String username,String title){
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        String sql ="select * from message_inf where username =?1 and message_title=?2 ";
        List list = see.createSQLQuery(sql)
                .addEntity(Person.class)
                .setString("1",username)
                .setString("2",title)
                .list();
        tx.commit();
        see.close();
        return list;
    }
    //查看全部消息
    public List selfMessageAll(String username,int fenye){
        if (fenye<0){
            fenye=0;
        }
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        String sql ="select * from message_inf where username =?1 order by message_id desc";
        List list = see.createSQLQuery(sql)
                .addEntity(Person.class)
                .setString("1",username)
                .list();
        if (fenye>list.size()){
            fenye=list.size()-10;
        }
        if (fenye+10>list.size()){
            list=list.subList(fenye,list.size());
        }else {
            list=list.subList(fenye,fenye+10);
        }

        tx.commit();
        see.close();
        return list;
    }
    //删除文章
    public void deletemessage(String id){
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        String sql = "select * from message_inf where message_id=?1";
        List l= see.createSQLQuery(sql)
                .addEntity(Person.class)
                .setString("1",id)
                .list();
        for(Object obj:l){
            Person p = (Person) obj;
            see.delete(p);
        }
        tx.commit();
        see.close();
    }

}
