package multitools;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONObject;

public class JsonUtilities {

    public JsonUtilities() {
    }

    public Object parse(String jsonText, String className) {
        Object object = null;
        return object;
    }

    public String parse(Object object) {
        return object != null ? object.toString() : "";
    }

    public String parse(ResultSet resultSet) {
        JSONArray dataArray = new JSONArray();

        try {
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();

            while (resultSet.next()) {
                JSONArray rowArray = new JSONArray();

                for (int i = 1; i <= columnCount; i++) {
                    Object value = resultSet.getObject(i);
                    rowArray.put(value != null ? value.toString() : JSONObject.NULL);
                }

                dataArray.put(rowArray);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "{}";
        }

        JSONObject resultJson = new JSONObject();
        resultJson.put("data", dataArray);

        return resultJson.toString(3); 
    }


    public String parse(HashMap<String, String> hashMap) {
        JSONObject json = new JSONObject(hashMap);
        return json.toString();
    }

    public String parse(String[] values) {
        JSONArray jsonArray = new JSONArray();
        for (String value : values) {
            jsonArray.put(value);
        }
        return jsonArray.toString();
    }

    public String parse(String[][] values) {
        JSONArray outerArray = new JSONArray();
        for (String[] row : values) {
            JSONArray innerArray = new JSONArray();
            for (String value : row) {
                innerArray.put(value);
            }
            outerArray.put(innerArray);
        }

        JSONObject resultJson = new JSONObject();
        resultJson.put("data", outerArray);

        return resultJson.toString();
    }
}
