package cm.action;

import Dao.VerCode;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
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



    public String login() throws Exception{//判断是否有未输入的文本框
        return SUCCESS;
    }
    public void img() throws IOException {//验证码图片功能
        ActionContext ac = ActionContext.getContext();
        HttpServletRequest req = ServletActionContext.getRequest();
        HttpServletResponse resp = ServletActionContext.getResponse();
        VerCode verfi = new VerCode();
        BufferedImage bi = verfi.getImage();
        ac.getSession().put("verfi",verfi.getText());
        VerCode.output(bi,resp.getOutputStream());
    }

}
