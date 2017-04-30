/**
 * Created by mjd85 on 4/21/2017.
 */
import jdk.nashorn.internal.objects.annotations.Getter;

import javax.ws.rs.*;

import static jdk.nashorn.internal.runtime.PropertyDescriptor.GET;

// The Java class will be hosted at the URI path "/helloworld"
@Path("/helloworld")
public class HelloWorld {
    // The Java method will process HTTP GET requests
    @GET
    // The Java method will produce content identified by the MIME Media type "text/plain"
    @Produces("text/plain")
    public String getClichedMessage() {
        // Return some cliched textual content
        return "Hello World";
    }

    //GET request function
    //assuming /api/ should be the path because the assignment URL is  http://localhost:8080/Lab11_war/hello/api
    @Path("/Lab11_war/hello/api/")
    @GET
    @Produces("text/plain")
    public String getFunction() {
        return "Getting...";
    }

    //PUT request function
    @PUT
    @Path("/Lab11_war/hello/api/{number}")
    @Consumes("text/plain")
    @Produces("text/plain")
    public String putFunction(@PathParam("number") int input) {
        return "Putting: " + input;
    }

    //POST request function
    @POST
    @Path("/Lab11_war/hello/api/{string}")
    @Produces("text/plain")
    @Consumes("text/plain")
    public String postFunction(@PathParam("string") String input) {
        return "Posting: " + input;
    }

    //DELETE request function
    @DELETE
    @Path("/Lab11_war/hello/api/{number}") //helloworld is the rootURL?
    @Produces("text/plain")
    @Consumes("text/plain")
    public String deleteFunction(@PathParam("number") int input) {
        return "Deleting: " + input;
    }
}