package cm.action;

import Dao.cookie.Coolie;
import Dao.select.AboutMessage;
import Dao.select.CompletInfor;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

/**
 * Created by online on 15-9-17.
 */
public class TellLoveAction extends ActionSupport {
    private String other_u;
    private String me_loveword;

    public String getOther_u() {
        return other_u;
    }

    public void setOther_u(String other_u) {
        this.other_u = other_u;
    }

    public String getMe_loveword() {
        return me_loveword;
    }

    public void setMe_loveword(String me_loveword) {
        this.me_loveword = me_loveword;
    }
    //提交对另一方的爱意
    public String tolove() throws UnsupportedEncodingException {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse resp = ServletActionContext.getResponse();
        ApplicationContext app = new ClassPathXmlApplicationContext("spring-hibernate.xml");
        CompletInfor am = app.getBean("complete", CompletInfor.class);
        am.writeBeforeLove(request,getOther_u(),getMe_loveword());
        if(Coolie.selectCookie(request, "sex").equals("男")){
            return "boy";
        }else {
            return "girl";
        }
    }
}
