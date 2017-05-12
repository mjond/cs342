/**
 * Created by mjd85 on 5/11/2017.
 * homework 13
 */


import oracle.kv.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class LoadDB {

    private static KVStore store;
    private static Connection jdbcConnection;

    /**
     * Driver method that calls getActors, getRoles and getMovies
     * @param args
     * @throws SQLException
     */
    public static void main(String[] args) throws SQLException {
        store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        jdbcConnection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "imdb", "bjarne");

        getMovies();
        getActors();
        getRoles();

        jdbcConnection.close();
        store.close();
    }


    /**
     * loads movies from imdb class database
     * @param -
     * @throws SQLException
     */
    private static void getMovies() throws SQLException {
        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT id, name, year, rank FROM Movie");
        while (resultSet.next()) {
            int id = resultSet.getInt(1);
            String rank = resultSet.getString(4);

            //get movie name
            Key nameKey = Key.createKey(id.toString(), Arrays.asList("name"));
            Value nameValue = Value.createValue(resultSet.getString(2).getBytes());
            store.put(nameKey, nameValue);

            //get movie year
            Key yearKey = Key.createKey(id.toString(), Arrays.asList("year"));
            Value yearValue = Value.createValue(resultSet.getString(3).getBytes());
            store.put(yearKey, yearValue);

            //get movie rank
            Key rankKey = Key.createKey(id.toString(), Arrays.asList("rank"));
            Value rankValue = Value.createValue("".getBytes());
            store.put(rankKey, rankValue);
        }
        resultSet.close();
        jdbcStatement.close();
    }


    /**
     * loads actors from imdb class database
     * @param -
     * @throws SQLException
     */
    private static void getActors() throws SQLException {
        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT id, firstName, lastName FROM Actor");
        while (resultSet.next()) {
            List<String> masterKey = Arrays.asList("actor", resultSet.getString(1));

            Key firstNameKey = Key.createKey(masterKey, Arrays.asList("lastName"));
            Value firstNameValue = Value.createValue(resultSet.getString(2).getBytes());
            store.put(firstNameKey, firstNameValue);

            Key lastNameKey = Key.createKey(masterKey, Arrays.asList("lastName"));
            Value lastNameKValue = Value.createValue(resultSet.getString(2).getBytes());
            store.put(lastNameKey, lastNameKValue);
        }
        resultSet.close();
        jdbcStatement.close();
    }


    /**
     * loads roles from imdb class database
     * @param -
     * @throws SQLException
     */
    private static void getRoles() throws SQLException {
        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT actorId, movieId, role FROM Role");
        while (resultSet.next()) {
            Key key = Key.createKey(Arrays.asList("role", resultSet.getString(2)), Arrays.asList(resultSet.getString(3)));
            Value value = Value.createValue(resultSet.getString(1).getBytes());
            store.put(key, value);
        }
        resultSet.close();
        jdbcStatement.close();
    }
}
