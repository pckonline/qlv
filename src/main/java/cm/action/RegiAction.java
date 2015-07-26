package cm.action;

import Dao.VerCode;
import Dao.select.MySql;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by online on 15-7-24.
 */
public class RegiAction extends ActionSupport {
    private String password;
    private String username;
    private String uname;
    private String verfi;
    private String passwordtoo;

    public String getVerfi() {
        return verfi;
    }

    public void setVerfi(String verfi) {
        this.verfi = verfi;
    }


    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUname() {
        return uname;
    }
    public String regi() throws Exception {
        ActionContext ac = ActionContext.getContext();
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
        MySql sq = ctx.getBean("mySql",MySql.class);
        boolean b = sq.valiUsername(getUsername());
        String regx = "\\w{6,12}";
        Pattern p = Pattern.compile(regx);
        Matcher m1 = p.matcher(getPassword());
        Matcher m2 = p.matcher(getUsername());
        boolean b1 = m1.matches();
        boolean b2 = m2.matches();
        if (getPassword().equals("")||getUsername().equals("")||getVerfi().equals("")||getUname().equals("")||getPasswordtoo().equals("")){//验证是否有没输入的文本
            setUsername("");
            String s = "<script type=\"text/javascript\">cuowu(\"请输入完整的信息！\")</script>";
            ac.getSession().put("cuowu", s);
            return ERROR;
        }else if(b1==false||b2==false){
            String s ="<script type=\"text/javascript\">cuowu(\"不符合规范！\")</script>";
            ac.getSession().put("cuowu", s);
            return ERROR;
        }else if (b==true){//判断用户名是否有人注册
            setUsername("");
            String s ="<script type=\"text/javascript\">cuowu(\"用户名已存在！\")</script>";
            ac.getSession().put("cuowu", s);
            return ERROR;
        }else if(!getPasswordtoo().equals(getPassword())){
            String s ="<script type=\"text/javascript\">cuowu(\"密码不匹配！\")</script>";
            ac.getSession().put("cuowu", s);
            return ERROR;
        }else if(!getVerfi().equalsIgnoreCase((String) ac.getSession().get("verfire"))){//防止暴力登录，加入验证码功能。不区分大小写
            String s ="<script type=\"text/javascript\">cuowu(\"验证码错误！\")</script>";
            ac.getSession().put("cuowu", s);
            return ERROR;
        }else {
            sq.valUser(getUsername(),getPassword(),getUname());
            return SUCCESS;
        }
    }
    public void img() throws IOException {//验证码图片功能
        ActionContext ac = ActionContext.getContext();
        HttpServletRequest req = ServletActionContext.getRequest();
        HttpServletResponse resp = ServletActionContext.getResponse();
        VerCode verfi = new VerCode();
        BufferedImage bi = verfi.getImage();
        ac.getSession().put("verfire",verfi.getText());
        verfi.output(bi,resp.getOutputStream());
    }

    public void setPasswordtoo(String passwordtoo) {
        this.passwordtoo = passwordtoo;
    }

    public String getPasswordtoo() {
        return passwordtoo;
    }
}
