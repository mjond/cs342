import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import models.Person;

import java.util.List;

import static javax.swing.text.html.FormSubmitEvent.MethodType.POST;
import static jdk.nashorn.internal.runtime.PropertyDescriptor.*;

/**
 * This stateless session bean serves as a RESTful resource handler for the CPDB.
 * It uses a container-managed entity manager.
 *
 * @author kvlinden
 * @version Spring, 2017
 */
@Stateless
@Path("cpdb")
public class CPDBResource {

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
    @Path("person/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Person getPerson(@PathParam("id") long id) {
        return em.find(Person.class, id);
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
    public List<Person> getPeople() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Person.class)).getResultList();
    }

    /**
     Homework 12
     PUT cpdb/person/x
     Modify the given person entity, it it exists,
     using the values in the JSON-formatted person entity passed with the request.
     */
    @PUT
    @Path("cpdb/person/{id}")
    @Produces("text/plain")
    @Consumes("text/plain")
    public Person modifyPerson(@PathParam("id") long x) {
        em.merge(em.find(Person.class, x));
        return x + "was updated";
    }

    /**
     Homework 12
     POST cpdb/people
     Add the person entity passed with the request to the database
     allowing the CPDB sequence to assign a new, unique ID number,
     linking to an existing household with teh ID given in the
     passed person entity.
     */
    @POST
    @Path("cpdb/people")
    @Produces("text/plain")
    @Consumes("text/plain")
    public Person modifyPerson(Person person) {
        em.persist(person);
        return "Person was added to the database";
    }

    /**
     Homework 12
     DELETE cpdb/person/x
     Delete teh person entity with the given ID, if it exists
     */
    @DELETE
    @Path("cpdb/person/{id}")
    @Produces("text/plain")
    @Consumes("text/plain")
    public Person modifyPerson(@PathParam("id") long x) {
        em.remove(em.find(Person.class, x));
        return "Person was removed from the database";
    }

}