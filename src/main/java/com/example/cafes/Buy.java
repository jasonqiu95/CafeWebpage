package com.example.cafes;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Buy {
	public static ResultSet fetch() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			return con.prepareStatement("Select * from buy join provider on B_P_id=P_id join originalmaterial on OM_ID=B_OM_ID").executeQuery();
		} catch (Exception e) {
			System.out.println("Fetch Buy Error!");
			return null;
		}
	}
	
	public static void add(String p, String om, String count, String price, String opID) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			int omID = getOMID(om);
			PreparedStatement pst = con.prepareStatement("insert into buy (B_P_ID, B_OM_ID, B_Count, B_Price, B_Op_ID) values (?,?,?,?,?)");
			int pID = OM.getProviderID(p);
			updateOM(omID+"", new BigDecimal(0), new BigDecimal(count));
			pst.setInt(1, pID);
			pst.setInt(2, omID);
			pst.setBigDecimal(3, new BigDecimal(count));
			pst.setBigDecimal(4, new BigDecimal(price));
			pst.setInt(5, Integer.parseInt(opID));
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Add Buy Record Error!");
		}
	}
	
	public static void update(String id, String p, String om, String count, String price, String opID) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			int omID = getOMID(om);
			PreparedStatement pst1 = con.prepareStatement("Select B_Count from Buy where B_ID=?");
			pst1.setInt(1, Integer.parseInt(id));
			ResultSet rs = pst1.executeQuery();
			rs.next();
			String old = rs.getString(1);
			updateOM(omID+"", new BigDecimal(old), new BigDecimal(count));
			PreparedStatement pst = con.prepareStatement("update Buy set B_P_ID=?, B_OM_ID=?, B_Count=?, B_Price=? ,B_Op_ID=? where B_ID=?");
			int pID = OM.getProviderID(p);
			pst.setInt(1, pID);
			pst.setInt(2, omID);
			pst.setBigDecimal(3, new BigDecimal(count));
			pst.setBigDecimal(4, new BigDecimal(price));
			pst.setInt(5, Integer.parseInt(opID));
			pst.setInt(6, Integer.parseInt(id));
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Update Buy Record Error!");
		}
	}
	
	public static void delete(String id) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst1 = con.prepareStatement("Select B_Count, B_OM_ID from Buy where B_ID=?");
			pst1.setInt(1, Integer.parseInt(id));
			ResultSet rs = pst1.executeQuery();
			rs.next();
			String old = rs.getString(1);
			String omID = rs.getString(2);
			updateOM(omID, new BigDecimal(old), new BigDecimal(0));
			PreparedStatement pst = con.prepareStatement("delete from buy where B_ID = ?");
			pst.setInt(1, Integer.parseInt(id));
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Delete Buy Record Error!");
		}
	}
	
	public static List<String> getOM() {
		List<String> ps = new ArrayList<String>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			ResultSet rs = con.createStatement().executeQuery("Select OM_Name from originalmaterial where OM_isAvailable=true");
			while (rs.next()) {
				ps.add(rs.getString(1));
			}
			return ps;
		} catch (Exception e) {
			System.out.println("Fetch OM Error!");
			return null;
		}
	}
	
	public static int getOMID(String name) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("Select OM_ID from originalmaterial where OM_name=?");
			pst.setString(1, name);
			ResultSet rs = pst.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (Exception e) {
			System.out.println("Get OM ID error!");
			return -1;
		}
	}
	
	public static void updateOM(String id, BigDecimal old, BigDecimal now) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("select * from originalmaterial join provider on om_providerid=p_id where om_id=?");
			pst.setInt(1, Integer.parseInt(id));
			ResultSet rs = pst.executeQuery();
			rs.next();
			String OM_name = rs.getString(2);
			String OM_storage = rs.getString(3);
			String OM_providerName = rs.getString(7);
			System.out.println(OM_name);
			System.out.println(OM_storage);
			System.out.println(OM_providerName);
			BigDecimal storage = new BigDecimal(OM_storage);
			storage = storage.subtract(old);
			storage = storage.add(now);
			if (storage.signum() >= 0) {
				OM.update(id, OM_name, storage.toString(), OM_providerName);
			}
		} catch (Exception e) {
			System.out.println("Update OM in buy error!");
			e.printStackTrace();
		}
	}
}
