/**
 * Created by mjd85 on 4/21/2017.
 */
import jdk.nashorn.internal.objects.annotations.Getter;

import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.DELETE;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

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

    @Get
    @Produces("text/plain")
    public String getFunction() {
        return "Getting...";
    }

    @Put
    @Produces("text/plain")
    public String putFunction(int input) {
        return "Putting: " + input;
    }

    @Post
    @Consumes("text/plain")
    public String putFunction(String input) {
        return "Posting: " + input;
    }

    @Delete
    @Produces("text/plain")
    public String putFunction(int input) {
        return "Deleting: " + input;
    }
}