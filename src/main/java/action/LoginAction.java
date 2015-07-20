package action;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by online on 15-7-20.
 */
public class LoginAction extends ActionSupport {
    private String username;
    public String login(){

        System.out.println("hello");
        return SUCCESS;

    }
}
