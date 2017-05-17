import oracle.kv.*;
import java.sql.SQLException;
import java.util.*;
/**
 * Created by mjd85 on 5/12/2017.
 */

public class GetPlayers {

    /**
     * @author Mark Davis
     * @param args
     * @throws SQLException
     * This method gets values from the kvstore and stores in a hashmap
     */
    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        HashMap<String, List<String>> data = new HashMap<>();

        Key key = Key.createKey(Arrays.asList("player"));
        Iterator<KeyValueVersion> it = store.storeIterator(Direction.UNORDERED, 0, key, null, null);

        while (it.hasNext()) {
            List<String> currentData = new ArrayList<>();
            KeyValueVersion kv = it.next();
            if (kv.getKey().getMinorPath().get(0).equals("id")) {
                String playerId = kv.getKey().getMajorPath().get(1);
                currentData.add(playerId);
                currentData.add(getFields(playerId, store));
                data.put(playerId, currentData);
            }
        }
        System.out.print(data);
        store.close();
    }

    /**
     * @author Mark Davis
     * @param id
     * @param store
     * This method gets the key-value pairs and stores in a map
     */
    public static String getFields(String id, KVStore store) {
        String temp="";
        Key majorKeyPath = Key.createKey(Arrays.asList("player, playerID)"));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            if(field.getKey().getMinorPath().get(0).equals("name")) {
                temp = new String(field.getValue().getValue().getValue());
            }
        }
        return temp;
    }
}
