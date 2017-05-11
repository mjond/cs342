import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import java.util.List;
import models.Player;

/**
 * This stateless session bean serves as a RESTful resource handler for the CPDB.
 * It uses a container-managed entity manager.
 *
 * @author kvlinden
 * @version Spring, 2017
 */
@Stateless
@Path("project")
public class ProjectResource{

    /**
     * JPA creates and maintains a managed entity manager with an integrated JTA that we can inject here.
     *     E.g., http://wiki.eclipse.org/EclipseLink/Examples/REST/GettingStarted
     */
    @PersistenceContext
    private EntityManager em;

    /**
     * GET a default message.
     *
     * @return a static hello-world message
     */
    @GET
    @Path("hello")
    @Produces("text/plain")
    public String getClichedMessage() {
        return "Hello, JPA!";
    }

    /**
     * GET an individual person record.
     *
     * @param id the ID of the person to retrieve
     * @return a person record
     */
    @GET
    @Path("player/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Player getPlayer(@PathParam("id") long id) {
        return em.find(Player.class, id);
    }

    /**
     * GET all people using the criteria query API.
     * This could be refactored to use a JPQL query, but this entitymanager-based approach
     * is consistent with the other handlers.
     *
     * @return a list of all person records
     */
    @GET
    @Path("people")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Player> getPeople() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Player.class)).getResultList();
    }

    /**
     * modifyPerson() updates a player
     * @param x
     * @return updated player
     */
    @PUT
    @Path("project/person/{id}")
    @Produces("text/plain")
    @Consumes("text/plain")
    public Player modifyPlayer(@PathParam("id") long x) {
        em.merge(em.find(Player.class, x));
        return em.find(Player.class, x);
    }

    /**
     Add the person entity passed with the request to the database
     allowing the project sequence to assign a new, unique ID number,
     linking to an existing household with the ID given in the
     passed player entity.
     */
    @POST
    @Path("project/people")
    @Produces("text/plain")
    @Consumes("text/plain")
    public Player addPlayer(Player person) {
        em.persist(person);
        return em.find(Player.class, person);
    }

    /**
     DELETE project/person/x
     Delete teh person entity with the given ID, if it exists
     */
    @DELETE
    @Path("project/person/{id}")
    @Produces("text/plain")
    @Consumes("text/plain")
    public Player deletePlayer(@PathParam("id") long x) {
        em.remove(em.find(Player.class, x));
        return em.find(Player.class, x);
    }
}