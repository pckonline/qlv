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
    private String boy_username;
    private String girl_username;

    public String getBoy_username() {
        return boy_username;
    }

    public void setBoy_username(String boy_username) {
        this.boy_username = boy_username;
    }

    public String getGirl_username() {
        return girl_username;
    }

    public void setGirl_username(String girl_username) {
        this.girl_username = girl_username;
    }

    public void setInfor(String infor) {
        this.infor = infor;
    }
    //提交关于我
    public String me() throws UnsupportedEncodingException {
        ActionContext ac = ActionContext.getContext();
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
        CompletInfor ci = ctx.getBean("complete", CompletInfor.class);
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
    public String onetoone() throws UnsupportedEncodingException {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
        CompletInfor ci = ctx.getBean("complete", CompletInfor.class);
        HttpServletRequest request = ServletActionContext.getRequest();
        ci.insetql(request,ci.selectid(request,getBoy_username()),ci.selectid(request,getGirl_username()));
        return "onetoone";
    }
}
