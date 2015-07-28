import Dao.popj.entity.Love;
import Dao.select.Dandz;
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
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
        Dandz sq = ctx.getBean("dandz",Dandz.class);
        String sql = sq.information("online");
        System.out.println(sql);
    }
}
