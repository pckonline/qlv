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
 * Created by online on 15-7-24.
 */
public class RegistAction extends ActionSupport {
    private String password;
    private String username;
    private String uname;
    private String verfi;

    public String getVerfi() {
        return verfi;
    }

    public void setVerfi(String verfi) {
        this.verfi = verfi;
    }

    public String regist(){
        return SUCCESS;
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
