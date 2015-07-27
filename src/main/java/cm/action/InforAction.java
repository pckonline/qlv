package cm.action;

import Dao.cookie.Coolie;
import Dao.popj.entity.Love;
import Dao.select.CompletInfor;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

/**
 * Created by online on 15-7-26.
 */
public class InforAction extends ActionSupport {
    private String infor;

    public String getInfor() {
        return infor;
    }
    private int boy_id;
    private int girl_id;

    public int getBoy_id() {
        return boy_id;
    }

    public void setBoy_id(int boy_id) {
        this.boy_id = boy_id;
    }

    public int getGirl_id() {
        return girl_id;
    }

    public void setGirl_id(int girl_id) {
        this.girl_id = girl_id;
    }

    public void setInfor(String infor) {
        this.infor = infor;
    }
    //提交关于我
    public String me() throws UnsupportedEncodingException {
        ActionContext ac = ActionContext.getContext();
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
        CompletInfor ci = ctx.getBean("complete",CompletInfor.class);
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse resp = ServletActionContext.getResponse();
        ci.newInfor(request,resp,getInfor());
        if(Coolie.selectCookie(request,"sex").equals("男")){
            return "boy";
        }else {
            return "girl";
        }
    }
    //提交情侣关系的超管
    public String onetoone(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
        SessionFactory sf = ctx.getBean("sessionFactory", SessionFactory.class);
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        Love love = new Love();
        love.setBoy_id(3);
        love.setGirl_id(4);
        see.save(love);
       tx.commit();
        see.close();
        sf.close();
        return "onetoone";
    }
}
