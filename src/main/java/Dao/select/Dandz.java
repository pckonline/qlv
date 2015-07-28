package Dao.select;

import Dao.cookie.Coolie;
import Dao.popj.entity.Infor;
import Dao.popj.entity.Regist;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.type.StandardBasicTypes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by online on 15-7-23.
 */
public class Dandz {
    private SessionFactory sf;
    private Regist lg;
    private Infor infor;
    private Coolie coolie;

    public void setCoolie(Coolie coolie) {
        this.coolie = coolie;
    }

    public void setInfor(Infor infor) {
        this.infor = infor;
    }

    public void setLg(Regist lg) {
        this.lg = lg;
    }

    public SessionFactory getSf() {
        return sf;
    }

    public void setSf(SessionFactory sf) {
        this.sf = sf;
    }

    //    验证是否登录成功
    public boolean login(String username,String password) throws Exception {
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        int count=0;
        boolean b =false;
        String uname=null;
        String information=null;
        String profess=null;
        String hobby=null;
        String sex=null;
        String zhanghao=null;
        String sql = "select * from login l,infor i where l.infor_id=i.infor_id and username=?1 and password=?2";
        List list = see.createSQLQuery(sql)
                .addEntity(Regist.class)
                .addEntity(Infor.class)
                .setString("1", username)
                .setString("2",password)
                .list();

        for (Object ele : list){
            count++;
            Object[] objects = (Object[]) ele;
            Regist regist = (Regist) objects[0];
            Infor infor1 = (Infor) objects[1];
            uname=regist.getUname();
            information=infor1.getInformation();
            profess = infor1.getProfess();
            hobby = infor1.getHobby();
            sex = infor1.getSex();
            zhanghao=regist.getUsername();
        }
        if (count>0){
            b=true;
            ActionContext ac = ActionContext.getContext();
            HttpServletResponse resp = ServletActionContext.getResponse();
            coolie.addCookie(resp,"information",information);
            coolie.addCookie(resp,"username",uname);
            coolie.addCookie(resp,"profess",profess);
            coolie.addCookie(resp,"hobby",hobby);
            coolie.addCookie(resp,"sex",sex);
            coolie.addCookie(resp,"zhanghao",zhanghao);
            ac.getSession().put("uname",uname);

        }
        tx.commit();
        see.close();
        return b;
    }
    public boolean valiUsername(String username){//验证用户名是否有人注册,有人注册:true
        boolean b=false;
        int count = 0;
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        String sql = "select * from login where username=?1";
        List list = see.createSQLQuery(sql)
                .addScalar("username", StandardBasicTypes.STRING)
                .setString("1",username)
                .list();
        for(Object ele : list){
            count++;
        }
        if (count>0){
            b=true;
        }
        tx.commit();
        see.close();
        return b;
    }
    public void valUser(String sex,String username,String password,String uname,String information,String profess,String hobby) throws Exception {//注册信息写入数据库
        Session see= sf.openSession();
        Transaction tx = see.beginTransaction();
        infor.setHobby(hobby);
        infor.setProfess(profess);
        infor.setInformation(information);
        infor.setSex(sex);
        System.out.println(information);
        lg.setUsername(username);
        lg.setPassword(password);
        lg.setUname(uname);
        lg.setInfor(infor);
        see.save(lg);
        tx.commit();
        see.close();
    }

}
