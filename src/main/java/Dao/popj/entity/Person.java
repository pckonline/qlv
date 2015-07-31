package Dao.popj.entity;

import javax.persistence.*;


/**
 * Created by online on 15-7-27.
 */
@Entity
@Table(name = "message_inf")
public class Person {
    @Id @Column(name = "message_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String username;
    private Message message;
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

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message name) {
        this.message = name;
    }
}
