package Dao.popj.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created by online on 15-7-27.
 */
//写入一对情侣的id，联合主键，一个男一个女，或者男男。。。。。
@Entity
@Table(name = "love")
public class Love implements Serializable {
    @Id @Column(name = "boy_id")
    private int boy_id;

    public int getGirl_id() {
        return girl_id;
    }

    public void setGirl_id(int girl_id) {
        this.girl_id = girl_id;
    }

    public int getBoy_id() {
        return boy_id;
    }

    public void setBoy_id(int boy_id) {
        this.boy_id = boy_id;
    }

    @Id @Column(name = "girl_id")
    private int girl_id;
    private String meet_day;
    private String know_day;
    private String love_day;

    public String getMeet_day() {
        return meet_day;
    }

    public void setMeet_day(String meet_day) {
        this.meet_day = meet_day;
    }

    public String getKnow_day() {
        return know_day;
    }

    public void setKnow_day(String know_day) {
        this.know_day = know_day;
    }

    public String getLove_day() {
        return love_day;
    }

    public void setLove_day(String love_day) {
        this.love_day = love_day;
    }
}
