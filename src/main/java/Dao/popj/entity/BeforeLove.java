package Dao.popj.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by online on 15-9-17.
 */
@Entity
@Table(name = "beforelove")
public class BeforeLove implements Serializable {
    @Id @Column
    private String me_u;
    @Id @Column
    private String other_u;
    private String loveword;
    private String oder;

    public String getMe_u() {
        return me_u;
    }

    public void setMe_u(String me_u) {
        this.me_u = me_u;
    }

    public String getOther_u() {
        return other_u;
    }

    public void setOther_u(String other_u) {
        this.other_u = other_u;
    }

    public String getLoveword() {
        return loveword;
    }

    public void setLoveword(String loveword) {
        this.loveword = loveword;
    }

    public String getOder() {
        return oder;
    }

    public void setOder(String oder) {
        this.oder = oder;
    }
}
