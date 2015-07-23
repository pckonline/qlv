package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;


/**
 * Created by online on 15-7-23.
 */
public class ConnectMysql {
    public static SessionFactory con() throws Exception{
        Configuration conf = new Configuration().configure();
        ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(conf.getProperties()).build();
        SessionFactory sf = conf.buildSessionFactory(serviceRegistry);
        return sf;
    }
    public static void closeSf(Session see,SessionFactory sf){
        see.close();
        sf.close();
    }
}
