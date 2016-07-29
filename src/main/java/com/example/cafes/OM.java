package com.example.cafes;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class OM {
	public static ResultSet fetch() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			return con.prepareStatement("Select * from originalmaterial join provider on OM_ProviderID=provider.P_ID").executeQuery();
		} catch (Exception e) {
			System.out.println("Fetch OM Error!");
			return null;
		}
	}
	
	public static void add(String name, String storage, String provider) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("insert into originalMaterial (OM_Name, OM_storage, OM_providerID) values (?,?,?)");
			pst.setString(1, name);
			pst.setBigDecimal(2, new BigDecimal(storage));
			int providerID = getProviderID(provider);
			pst.setInt(3, providerID);
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Add OM Error!");
		}
	}
	
	public static void update(String id, String name, String storage, String provider) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("update originalmaterial set OM_Name=?, OM_Storage=?, OM_providerID=? where OM_ID=?");
			pst.setString(1, name);
			pst.setBigDecimal(2, new BigDecimal(storage));
			int providerID = getProviderID(provider);
			pst.setInt(3, providerID);
			pst.setInt(4, Integer.parseInt(id));
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Update OM Error!");
		}
	}
	
	public static void delete(String id) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("UPDATE originalmaterial SET OM_isAvailable=false where OM_ID = ?");
			pst.setInt(1, Integer.parseInt(id));
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Delete OM Error!");
		}
	}
	
	public static List<String> getProviders() {
		List<String> ps = new ArrayList<String>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			ResultSet rs = con.createStatement().executeQuery("Select P_Name from provider where p_isAvailable=true");
			while (rs.next()) {
				ps.add(rs.getString(1));
			}
			return ps;
		} catch (Exception e) {
			System.out.println("Fetch providers Error!");
			return null;
		}
	}
	
	public static int getProviderID(String p) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("Select p_ID from provider where p_name=?");
			pst.setString(1, p);
			ResultSet rs = pst.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (Exception e) {
			System.out.println("Get Provider ID error!");
			return -1;
		}
	}
}
