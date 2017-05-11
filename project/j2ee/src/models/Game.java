package models;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by mjd85 on 5/11/2017.
 */
@Entity
public class Game {
    private long id;
    private Long teamonescore;
    private Long teamtwoscore;

    @Id
    @Column(name = "ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "TEAMONESCORE")
    public Long getTeamonescore() {
        return teamonescore;
    }

    public void setTeamonescore(Long teamonescore) {
        this.teamonescore = teamonescore;
    }

    @Basic
    @Column(name = "TEAMTWOSCORE")
    public Long getTeamtwoscore() {
        return teamtwoscore;
    }

    public void setTeamtwoscore(Long teamtwoscore) {
        this.teamtwoscore = teamtwoscore;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Game game = (Game) o;

        if (id != game.id) return false;
        if (teamonescore != null ? !teamonescore.equals(game.teamonescore) : game.teamonescore != null) return false;
        if (teamtwoscore != null ? !teamtwoscore.equals(game.teamtwoscore) : game.teamtwoscore != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (teamonescore != null ? teamonescore.hashCode() : 0);
        result = 31 * result + (teamtwoscore != null ? teamtwoscore.hashCode() : 0);
        return result;
    }
}
