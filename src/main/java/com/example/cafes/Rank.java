package com.example.cafes;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Rank {
	public static TreeMap<Integer, Integer> getMapping() {
		//key is ID value is sell count
		Map<Integer, Integer> m = new HashMap<Integer, Integer>();
		ValueComparator vc = new ValueComparator(m);
		Map<Integer, Integer> sortedMap = new TreeMap<Integer, Integer>(vc);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			ResultSet rs = con.createStatement().executeQuery("Select M_ID from meal where M_isAvailable=true");
			while (rs.next()) {
				m.put(rs.getInt(1), 0);
			}
			
			rs = con.createStatement().executeQuery("select S_M_ID, S_Count from sell join meal on m_ID = S_M_ID where M_isAvailable=true");
			while (rs.next()) {
				int mealID = rs.getInt(1);
				int count = rs.getInt(2);
				int oldCount = m.get(mealID);
				m.put(mealID, count + oldCount);
			}
			sortedMap.putAll(m);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (TreeMap<Integer, Integer>)sortedMap;
	}
	
	static class ValueComparator implements Comparator {
	    Map<Integer, Integer> base;

	    public ValueComparator(Map<Integer, Integer> base) {
	        this.base = base;
	    }

		@Override
		public int compare(Object arg0, Object arg1) {
			// TODO Auto-generated method stub
			if (base.get(arg0) >= base.get(arg1)) {
	            return -1;
	        } else {
	            return 1;
	        }
		}
	}
}
