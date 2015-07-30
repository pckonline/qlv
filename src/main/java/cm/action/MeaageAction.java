package cm.action;

import Dao.cookie.Coolie;
import Dao.select.AboutMessage;
import Dao.select.Dandz;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

/**
 * Created by online on 15-7-30.
 */
public class MeaageAction extends ActionSupport {
    private String title;
    private String body;

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getTitle() {

        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    //提交文章
    public String message() throws UnsupportedEncodingException {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse resp = ServletActionContext.getResponse();
        ApplicationContext app = new ClassPathXmlApplicationContext("spring-hibernate.xml");
        AboutMessage am = app.getBean("aboutmessage",AboutMessage.class);
        am.valMessage(request,getTitle(),getBody());
        if(Coolie.selectCookie(request, "sex").equals("男")){
            return "boy";
        }else {
            return "girl";
        }
    }
}
