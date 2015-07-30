package Dao.select;

import Dao.cookie.Coolie;
import Dao.popj.entity.Message;
import Dao.popj.entity.Person;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;


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

}
