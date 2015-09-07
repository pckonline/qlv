package Dao.popj.entity;

import javax.persistence.*;

/**
 * Created by online on 15-9-7.
 */
@Entity
@Table(name = "lmessage_inf")
public class Lmessage {
    @Id
    @Column(name = "lmessage_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String username;
    @Column(name = "lmessage_body" ,length = 255)
    private String leaveMessage;

    public String getLeaveMessage() {
        return leaveMessage;
    }

    public void setLeaveMessage(String leaveMessage) {
        this.leaveMessage = leaveMessage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

}
