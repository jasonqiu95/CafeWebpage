package com.example.cafes;
import java.sql.*;

public class Provider {
	public static ResultSet fetchProviders() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			return con.prepareStatement("Select * from provider").executeQuery();
		} catch (Exception e) {
			System.out.println("Fetch Providers Error!");
			return null;
		}
	}
	
	public static void addProvider(String name, String addr, String intro, String contact) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("insert into Provider (P_Name, P_Intro, P_Addr, P_Contact) values (?,?,?,?)");
			pst.setString(1, name);
			pst.setString(2, intro);
			pst.setString(3, addr);
			pst.setString(4, contact);
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Add Providers Error!");
		}
	}
	
	public static void updateProvider(String id, String name, String intro, String contact, String addr) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("update provider set P_Name=?, P_Intro=?, P_addr=?, P_Contact=? where P_ID=?");
			pst.setString(1, name);
			pst.setString(2, intro);
			pst.setString(3, addr);
			pst.setString(4, contact);
			pst.setInt(5, Integer.parseInt(id));
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Update Providers Error!");
		}
	}
	
	public static void deleteProvider(String id) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("UPDATE provider SET P_isAvailable=false where P_ID = ?");
			pst.setInt(1, Integer.parseInt(id));
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Delete Provider Error!");
		}
	}
}
