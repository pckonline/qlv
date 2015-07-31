package Dao.popj.entity;



import org.hibernate.annotations.Parent;

import javax.persistence.*;

/**
 * Created by online on 15-7-27.
 */
@Embeddable
public class Message {
    @Column(name = "message_title")
    private String title;
    @Column(name = "message_body" ,length = 65530)
    private String body;
    @Parent
    private Person person;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public Message(String title, String body) {

        this.title = title;
        this.body = body;
    }

    public Message() {

    }
}
