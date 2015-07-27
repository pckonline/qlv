package cm.action;

import Dao.cookie.Coolie;
import Dao.select.CompletInfor;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
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

    public void setInfor(String infor) {
        this.infor = infor;
    }
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
            return "女";
        }

    }
}
