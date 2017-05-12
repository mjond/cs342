import oracle.kv.*;
import java.sql.SQLException;
import java.util.*;

/**
 * Created by mjd85 on 5/12/2017.
 */
public class GetTeams {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        HashMap<String, List<String>> data = new HashMap<>();

        Key key = Key.createKey(Arrays.asList("team"));
        Iterator<KeyValueVersion> it = store.storeIterator(Direction.UNORDERED, 0, key, null, null);

        while (it.hasNext()) {
            List<String> currentData = new ArrayList<>();
            KeyValueVersion kv = it.next();
            if (kv.getKey().getMinorPath().get(0).equals("id")) {
                String teamId = kv.getKey().getMajorPath().get(1);
                currentData.add(teamId);
                currentData.add(getFields(teamId, store));
                data.put(teamId, currentData);
            }
        }
        System.out.print(data);
        store.close();
    }

    public static String getFields(String id, KVStore store) {
        String temp="";
        Key majorKeyPath = Key.createKey(Arrays.asList("team, playerID)"));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            if(field.getKey().getMinorPath().get(0).equals("name")) {
                temp = new String(field.getValue().getValue().getValue());
            }
        }
        return temp;

    }
}
