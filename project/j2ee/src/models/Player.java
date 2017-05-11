package models;

import javax.persistence.*;

/**
 * Created by mjd85 on 5/11/2017.
 */
@Entity
public class Player {
    private long id;
    private String firstname;
    private String lastname;
    private Long goals;
    private Long assists;
    private String position;

    /**
     * Many to One method
     * Project Extension
     */
    @ManyToOne
    @JoinColumn(name = "TEAMID", referencedColumnName = "ID")
    private Team team;
    public Team getTeam() {return team};

    public void setTeam(Team team) { this.team = team; }

    /**
     * Many to Many method
     * Project Extension
     */
    @ManyToMany
    @JoinTable(name = "PERSONTEAM", schema = "project",
            joinColumns = @JoinColumn(name = "PLAYERID", referencedColumnName = "ID", nullable = false),
            inverseJoinColumns = @JoinColumn(name = "TEAMNAME", referencedColumnName = "NAME", nullable = false))
    public void List<Team> getTeams() {return team;}

    public void setTeam(List<Team> team) {this.team = team; }

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
    @Column(name = "GOALS")
    public Long getGoals() {
        return goals;
    }

    public void setGoals(Long goals) {
        this.goals = goals;
    }

    @Basic
    @Column(name = "ASSISTS")
    public Long getAssists() {
        return assists;
    }

    public void setAssists(Long assists) {
        this.assists = assists;
    }

    @Basic
    @Column(name = "POSITION")
    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Player player = (Player) o;

        if (id != player.id) return false;
        if (firstname != null ? !firstname.equals(player.firstname) : player.firstname != null) return false;
        if (lastname != null ? !lastname.equals(player.lastname) : player.lastname != null) return false;
        if (goals != null ? !goals.equals(player.goals) : player.goals != null) return false;
        if (assists != null ? !assists.equals(player.assists) : player.assists != null) return false;
        if (position != null ? !position.equals(player.position) : player.position != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (firstname != null ? firstname.hashCode() : 0);
        result = 31 * result + (lastname != null ? lastname.hashCode() : 0);
        result = 31 * result + (goals != null ? goals.hashCode() : 0);
        result = 31 * result + (assists != null ? assists.hashCode() : 0);
        result = 31 * result + (position != null ? position.hashCode() : 0);
        return result;
    }
}
