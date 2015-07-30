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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.List;


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

    //    验证是否登录成功 并加入关于自己网名，爱好，职业的coolkie
    public boolean login(String username,String password,boolean know) throws Exception {
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        int count=0;
        boolean b =false;
        String uname=null;
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
            profess = infor1.getProfess();
            hobby = infor1.getHobby();
            sex = infor1.getSex();
            zhanghao=regist.getUsername();
        }
        if (count>0){
            b=true;
            ActionContext ac = ActionContext.getContext();
            HttpServletResponse resp = ServletActionContext.getResponse();
            if (know){
                coolie.addCookie(resp,"username",uname);
                coolie.addCookie(resp,"profess",profess);
                coolie.addCookie(resp,"hobby",hobby);
                coolie.addCookie(resp,"sex",sex);
                coolie.addCookie(resp, "zhanghao", zhanghao);
            }
            else {
                coolie.addCookieone(resp, "username", uname);
                coolie.addCookieone(resp, "profess", profess);
                coolie.addCookieone(resp, "hobby", hobby);
                coolie.addCookieone(resp, "sex", sex);
                coolie.addCookieone(resp, "zhanghao", zhanghao);
            }
            ac.getSession().put("uname", uname);
        }
        tx.commit();
        see.close();
        return b;
    }
    //加入对方的网名，爱好，职业cookie
    public void addAnother(HttpServletRequest request,String zhanghao) throws UnsupportedEncodingException {
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        String anotherUname=null;
        String anotherHobby=null;
        String anotherProfess=null;
        String sql =null;
        if (Coolie.selectCookie(request,"sex").equals("男")){
            sql = " select * from login l,infor i where l.infor_id=i.infor_id and" +
                    " l.infor_id=(select girl_id from love ll,login l where ll.boy_id=l.infor_id" +
                    " and l.username=?1)";
        }else {
            sql = " select * from login l,infor i where l.infor_id=i.infor_id and" +
                    " l.infor_id=(select boy_id from love ll,login l where ll.girl_id=l.infor_id" +
                    " and l.username=?1)";
        }

        List list=see.createSQLQuery(sql)
                .addEntity(Regist.class)
                .addEntity(Infor.class)
                .setString("1",zhanghao )
                .list();
        for(Object ele : list){
            Object[] objects = (Object[]) ele;
            Regist regist= (Regist) objects[0];
            Infor infor2 = (Infor) objects[1];
            anotherUname=regist.getUname();
            anotherHobby=infor2.getHobby();
            anotherProfess=infor2.getProfess();
            HttpServletResponse resp = ServletActionContext.getResponse();
            coolie.addCookie(resp,"anotherHobby",anotherHobby);
            coolie.addCookie(resp,"anotherUname",anotherUname);
            coolie.addCookie(resp,"anotherProfess",anotherProfess);
        }
        tx.commit();
        see.close();
    }
    //查自己的信息,用于关于我里面的内容
    public String information(String username) throws UnsupportedEncodingException {
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        String information=null;
        CompletInfor com=new CompletInfor();
        HttpServletRequest request=ServletActionContext.getRequest();
        String sql="select * from login l, infor i where l.infor_id=i.infor_id and username=?1";
        List list=see.createSQLQuery(sql)
                .addEntity(Regist.class)
                .addEntity(Infor.class)
                .setString("1", username)
                .list();
        for(Object ele : list){
            Object[] objects = (Object[]) ele;
            Infor infor2 = (Infor) objects[1];
            information=infor2.getInformation();
        }
        tx.commit();
        see.close();
        return information;
    }
    //查看另一方的information
    public String informationAnother(HttpServletRequest request,String username) throws UnsupportedEncodingException {
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        String information=null;
        String sql=null;
        if (Coolie.selectCookie(request,"sex").equals("男")){
            sql = " select * from infor where infor_id=(select girl_id from" +
                    " login l,love ll where ll.boy_id=l.id and l.username=?1)";
        }else {
            sql = " select * from infor where infor_id=(select boy_id from" +
                    " login l,love ll where ll.girl_id=l.id and l.username=?1)";
        }
        List list=see.createSQLQuery(sql)
                .addEntity(Infor.class)
                .setString("1",username )
                .list();
        for(Object ele : list){
            Object object = (Object) ele;
            Infor infor2 = (Infor) object;
            System.out.println("2");
            information=infor2.getInformation();
        }
        return information;
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
    //注册信息写入数据库
    public void valUser(String sex,String username,String password,String uname,String information,String profess,String hobby) throws Exception {
        Session see= sf.openSession();
        Transaction tx = see.beginTransaction();
        infor.setHobby(hobby);
        infor.setProfess(profess);
        infor.setInformation(information);
        infor.setSex(sex);
        lg.setUsername(username);
        lg.setPassword(password);
        lg.setUname(uname);
        lg.setInfor(infor);
        System.out.println("1");
        see.save(lg);
        tx.commit();
        see.close();
    }

}