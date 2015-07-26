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

    public Infor() {
    }

    public Infor(String information, String profess, String hobby) {
        this.information = information;
        this.profess = profess;
        this.hobby = hobby;
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
