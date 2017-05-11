package models;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by mjd85 on 5/11/2017.
 */
@Entity
public class Gamecomment {
    private long id;
    private String usercomment;

    @Id
    @Column(name = "ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "USERCOMMENT")
    public String getUsercomment() {
        return usercomment;
    }

    public void setUsercomment(String usercomment) {
        this.usercomment = usercomment;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Gamecomment that = (Gamecomment) o;

        if (id != that.id) return false;
        if (usercomment != null ? !usercomment.equals(that.usercomment) : that.usercomment != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (usercomment != null ? usercomment.hashCode() : 0);
        return result;
    }
}
