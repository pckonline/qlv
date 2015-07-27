import Dao.popj.entity.Love;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by online on 15-7-20.
 */
public class Text {
    public static void main(String[] args) throws Exception {
//        System.out.println("1");
//        ApplicationContext app = new ClassPathXmlApplicationContext("spring-hibernate.xml");
//        System.out.println("2");
//        SessionFactory sf = app.getBean("sessionFactory",SessionFactory.class);
//
//        System.out.println("3");
//        Session see=sf.openSession();
//        Transaction tx = see.beginTransaction();
//        Love love = new Love();
//        love.setAn_id(1);
//        love.setMe_id(2);
//        see.save(love);
//        tx.commit();
//        see.close();
//        sf.close();
    }
}
