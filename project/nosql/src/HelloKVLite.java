import java.util.Arrays;

import oracle.kv.KVStore;
import oracle.kv.KVStoreConfig;
import oracle.kv.KVStoreFactory;
import oracle.kv.Key;
import oracle.kv.Value;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;


/**
 * KVLite is not the best type of system to use for this application. The Oracle relational system is best because
 * all tables are in 4th normal form. There isn't really a reason to use a key-value system since I would only be using
 * tables' primary keys as the key in the key-value system.
 *
 * @author mjd85 with code from kvlinden
 */
public class HelloKVLite {
    private static KVStore store;
    private static Connection jdbcConnection;

    public static void main(String[] args) throws SQLException {

        jdbcConnection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hockey", "MonkeyHat8");
        store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        getPlayers();
        getTeams();

        store.close();
    }

    private static void getPlayers() throws SQLException {
        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT p.id, p.firstName, p.lastName t.name FROM Player p, Team t WHERE p.teamId=t.id");
        int count = 0;

        while (resultSet.next()) {
            List<String> masterKey = Arrays.asList("player", Integer.toString(count));

            //id
            Key idKey = Key.createKey(masterKey, Arrays.asList("id"));
            Value idValue = Value.createValue(resultSet.getString(1).getBytes());
            store.put(idKey, idValue);

            //first name
            Key firstNameKey = Key.createKey(masterKey, Arrays.asList("firstName"));
            Value firstNameValue = Value.createValue(resultSet.getString(2).getBytes());
            store.put(firstNameKey, firstNameValue);

            //last name
            Key lastNameKey = Key.createKey(masterKey, Arrays.asList("lastName"));
            Value lastNameValue = Value.createValue(resultSet.getString(3).getBytes());
            store.put(lastNameKey, lastNameValue);

            //last name
            Key teamNameKey = Key.createKey(masterKey, Arrays.asList("teamName"));
            Value teamNameValue = Value.createValue(resultSet.getString(4).getBytes());
            store.put(teamNameKey, teamNameValue);

            count++;
        }
    }

    private static void getTeams() throws SQLException {
        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT id, name, numberOfPlayers, type FROM Team");
        int count = 0;

        while (resultSet.next()) {
            List<String> masterKey = Arrays.asList("team", Integer.toString(count));

            //id
            Key idKey = Key.createKey(masterKey, Arrays.asList("id"));
            Value idValue = Value.createValue(resultSet.getString(1).getBytes());
            store.put(idKey, idValue);

            //name
            Key nameKey = Key.createKey(masterKey, Arrays.asList("name"));
            Value nameValue = Value.createValue(resultSet.getString(2).getBytes());
            store.put(nameKey, nameValue);

            //numberOfPlayers
            Key numberKey = Key.createKey(masterKey, Arrays.asList("numberOfPlayers"));
            Value numberValue = Value.createValue(resultSet.getString(3).getBytes());
            store.put(numberKey, numberValue);

            //type
            Key typeKey = Key.createKey(masterKey, Arrays.asList("type"));
            Value typeValue = Value.createValue(resultSet.getString(4).getBytes());
            store.put(typeKey, typeValue);

            count++;
        }
    }
}