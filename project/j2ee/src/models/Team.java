package models;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by mjd85 on 5/11/2017.
 */
@Entity
public class Team {
    private long id;
    private String name;
    private Long numberofplayers;
    private String type;

    @Id
    @Column(name = "ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "NAME")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "NUMBEROFPLAYERS")
    public Long getNumberofplayers() {
        return numberofplayers;
    }

    public void setNumberofplayers(Long numberofplayers) {
        this.numberofplayers = numberofplayers;
    }

    @Basic
    @Column(name = "TYPE")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Team team = (Team) o;

        if (id != team.id) return false;
        if (name != null ? !name.equals(team.name) : team.name != null) return false;
        if (numberofplayers != null ? !numberofplayers.equals(team.numberofplayers) : team.numberofplayers != null)
            return false;
        if (type != null ? !type.equals(team.type) : team.type != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (numberofplayers != null ? numberofplayers.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        return result;
    }
}
