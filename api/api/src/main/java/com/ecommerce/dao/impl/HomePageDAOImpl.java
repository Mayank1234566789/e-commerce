package com.ecommerce.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.hibernate.internal.SessionImpl;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.HomePageDAO;

@Repository
public class HomePageDAOImpl implements HomePageDAO {

	@PersistenceContext
	private EntityManager entityManager;
	
	

	@Override
	public JSONArray getMenuDetails() {
			JSONArray json=null;
			ResultSet resultSet=null;
		
	        Connection connection = entityManager.unwrap(SessionImpl.class).connection();
	        PreparedStatement preparedStatement;
	       
		
				try {
					preparedStatement = connection.prepareStatement("{call ecommerce.sp_show_menu_details()}");
					 resultSet = preparedStatement.executeQuery();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				json=this.extractResultSet(resultSet);
				return json;
				
	}
	
	
	public JSONArray extractResultSet(ResultSet resultSet) {
		JSONArray json=null;
	try {
	    ResultSetMetaData metadata = resultSet.getMetaData();
        json = new JSONArray();
      
        while(resultSet.next()) {
        	  int numColumns = metadata.getColumnCount();
        	  JSONObject obj = new JSONObject();

        	  for( int i=1; i<numColumns+1; i++) {
        	    String column_name = metadata.getColumnName(i);

        	    switch( metadata.getColumnType( i ) ) {
        	      case java.sql.Types.ARRAY:
        	        obj.put(column_name, resultSet.getArray(column_name));     break;
        	      case java.sql.Types.BIGINT:
        	        obj.put(column_name, resultSet.getInt(column_name));       break;
        	      case java.sql.Types.BOOLEAN:
        	        obj.put(column_name, resultSet.getBoolean(column_name));   break;
        	      case java.sql.Types.BLOB:
        	        obj.put(column_name, resultSet.getBlob(column_name));      break;
        	      case java.sql.Types.DOUBLE:
        	        obj.put(column_name, resultSet.getDouble(column_name));    break;
        	      case java.sql.Types.FLOAT:
        	        obj.put(column_name, resultSet.getFloat(column_name));     break;
        	      case java.sql.Types.INTEGER:
        	        obj.put(column_name, resultSet.getInt(column_name));       break;
        	      case java.sql.Types.NVARCHAR:
        	        obj.put(column_name, resultSet.getNString(column_name));   break;
        	      case java.sql.Types.VARCHAR:
        	        obj.put(column_name, resultSet.getString(column_name));    break;
        	      case java.sql.Types.TINYINT:
        	        obj.put(column_name, resultSet.getInt(column_name));       break;
        	      case java.sql.Types.SMALLINT:
        	        obj.put(column_name, resultSet.getInt(column_name));       break;
        	      case java.sql.Types.DATE:
        	        obj.put(column_name, resultSet.getDate(column_name));      break;
        	      case java.sql.Types.TIMESTAMP:
        	        obj.put(column_name, resultSet.getTimestamp(column_name)); break;
        	      default:
        	        obj.put(column_name, resultSet.getObject(column_name));    break;
        	    }
        	  }

        	  json.put(obj);
        	}
 
  
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (JSONException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    
  return json;
}


}
