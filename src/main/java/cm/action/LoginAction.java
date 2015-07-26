package cm.action;

import Dao.VerCode;
import Dao.select.Dandz;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * Created by online on 15-4-2.
 */
public class LoginAction extends ActionSupport {
    private String username;
    private String password;
    private String verfi;

    public String getVerfi() {
        return verfi;
    }

    public void setVerfi(String verfi) {
        this.verfi = verfi;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }



    public String login() throws Exception{
        VerCode ver =new VerCode();
        ActionContext ac = ActionContext.getContext();
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
        Dandz sq = ctx.getBean("dandz",Dandz.class);
        boolean b= sq.login(getUsername(),getPassword());
        if (getPassword().equals("")||getUsername().equals("")||getVerfi().equals("")){//验证是否有没输入的文本
            setPassword("");
            String s = "<script type=\"text/javascript\">cuowu(\"请输入完整的信息！\")</script>";
            ac.getSession().put("cuowu",s);
            return ERROR;
        }else if (b==false){//判断用户信息是否正确
            setPassword("");
            String s ="<script type=\"text/javascript\">cuowu(\"用户名或密码错误！\")</script>";
            ac.getSession().put("cuowu",s);
            return ERROR;
        }else if (!getVerfi().equalsIgnoreCase((String)ac.getSession().get("verfi"))){//防止暴力登录，加入验证码功能。不区分大小写
            String s ="<script type=\"text/javascript\">cuowu(\"验证码错误！\")</script>";
            ac.getSession().put("cuowu",s);
            return ERROR;
        }
        else {
            return SUCCESS;
        }
    }
    public void img() throws IOException {//验证码图片功能
        ActionContext ac = ActionContext.getContext();
        HttpServletResponse resp = ServletActionContext.getResponse();
        VerCode verfi = new VerCode();
        BufferedImage bi = verfi.getImage();
        ac.getSession().put("verfi",verfi.getText());
        verfi.output(bi,resp.getOutputStream());
    }
}
