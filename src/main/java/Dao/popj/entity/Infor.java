package Dao.popj.entity;

import javax.persistence.*;


/**
 * Created by online on 15-7-26.
 */
@Entity
@Table(name = "infor")
public class Infor {
    @Id @Column(name = "infor_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int inforId;
    private String information;
    private String profess;
    private String hobby;
    private String sex;

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Infor() {
    }

    public Infor(String information, String profess, String hobby,String sex) {
        this.information = information;
        this.profess = profess;
        this.hobby = hobby;
        this.sex = sex;
    }

    public int getInforId() {
        return inforId;
    }

    public void setInforId(int inforId) {
        this.inforId = inforId;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public String getProfess() {
        return profess;
    }

    public void setProfess(String profess) {
        this.profess = profess;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }
}
