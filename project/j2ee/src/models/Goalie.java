package models;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by mjd85 on 5/11/2017.
 */
@Entity
public class Goalie {
    private long id;
    private String firstname;
    private String lastname;
    private Long savepercentage;

    @Id
    @Column(name = "ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "FIRSTNAME")
    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    @Basic
    @Column(name = "LASTNAME")
    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    @Basic
    @Column(name = "SAVEPERCENTAGE")
    public Long getSavepercentage() {
        return savepercentage;
    }

    public void setSavepercentage(Long savepercentage) {
        this.savepercentage = savepercentage;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Goalie goalie = (Goalie) o;

        if (id != goalie.id) return false;
        if (firstname != null ? !firstname.equals(goalie.firstname) : goalie.firstname != null) return false;
        if (lastname != null ? !lastname.equals(goalie.lastname) : goalie.lastname != null) return false;
        if (savepercentage != null ? !savepercentage.equals(goalie.savepercentage) : goalie.savepercentage != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (firstname != null ? firstname.hashCode() : 0);
        result = 31 * result + (lastname != null ? lastname.hashCode() : 0);
        result = 31 * result + (savepercentage != null ? savepercentage.hashCode() : 0);
        return result;
    }
}
