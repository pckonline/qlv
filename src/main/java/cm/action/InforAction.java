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
    private String meet_day;
    private String know_day;
    private String love_day;

    public String getLmessage() {
        return lmessage;
    }

    public void setLmessage(String lmessage) {
        this.lmessage = lmessage;
    }

    private String lmessage;

    public String getKnow_day() {
        return know_day;
    }

    public void setKnow_day(String know_day) {
        this.know_day = know_day;
    }

    public String getLove_day() {
        return love_day;
    }

    public void setLove_day(String love_day) {
        this.love_day = love_day;
    }

    public String getMeet_day() {

        return meet_day;
    }

    public void setMeet_day(String meet_day) {
        this.meet_day = meet_day;
    }

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
        ci.newInfor(request,resp,getLmessage());
        if(Coolie.selectCookie(request,"sex").equals("男")){
            return "boy";
        }else {
            return "girl";
        }
    }
    //提交留言
    public String lmessage () throws UnsupportedEncodingException {
        ActionContext ac = ActionContext.getContext();
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
        CompletInfor ci = ctx.getBean("complete", CompletInfor.class);
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse resp = ServletActionContext.getResponse();
        ci.writelmessage(request,resp,getLmessage());
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
        ci.insetql(request,ci.selectid(request,getBoy_username()),ci.selectid(request,getGirl_username()),getMeet_day(),getKnow_day(),getLove_day());
        setBoy_username("");
        setGirl_username("");
        setLove_day("");
        setMeet_day("");
        setKnow_day("");
        return "onetoone";
    }
}
