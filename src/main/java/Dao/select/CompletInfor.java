package Dao.select;

import Dao.cookie.Coolie;
import Dao.popj.entity.Infor;
import Dao.popj.entity.Regist;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by online on 15-7-26.
 */
public class CompletInfor {
    private SessionFactory sf;
    private Infor infor;
    private Coolie coolie;

    public void setCoolie(Coolie coolie) {
        this.coolie = coolie;
    }

    public void setInfor(Infor infor) {
        this.infor = infor;
    }

    public void setSf(SessionFactory sf) {
        this.sf = sf;
    }
    //更新自我描述的information
    public void newInfor(HttpServletRequest request,HttpServletResponse resp,String infor) throws UnsupportedEncodingException {
        Session see = sf.openSession();
        Transaction tx = see.beginTransaction();
        int infor_id1=0;
        String sql ="select * from login where uname=?1";
        List list = see.createSQLQuery(sql)
                .addEntity(Regist.class)
                .setString("1",Coolie.selectCookie(request,"username"))
                .list();

        for (Object ele:list){
            Regist regist = (Regist) ele;
            infor_id1=regist.getId();
        }
        String sql1 ="update infor set information=?1 where infor_id=?2";
        coolie.addCookie(resp,"information",infor);
        Query query = see.createSQLQuery(sql1)
                .setString("1",infor).setInteger("2", infor_id1);
        query.executeUpdate();
        tx.commit();
        see.close();
    }
}
