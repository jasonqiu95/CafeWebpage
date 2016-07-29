package com.example.cafes;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Take {
	public static ResultSet fetch() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			return con.prepareStatement("Select * from take").executeQuery();
		} catch (Exception e) {
			System.out.println("Fetch Take Error!");
			return null;
		}
	}
	
	public static void add(String om, String count, String opID) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			int omID = Buy.getOMID(om);
			Buy.updateOM(omID+"", new BigDecimal(count), new BigDecimal(0));
			PreparedStatement pst = con.prepareStatement("insert into take (T_OM_ID, T_Count, T_Op_ID) values (?,?,?)");
			pst.setInt(1, omID);
			pst.setBigDecimal(2, new BigDecimal(count));
			pst.setInt(3, Integer.parseInt(opID));
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Add Take Record Error!");
		}
	}
	
	public static void update(String id, String om, String count, String opID) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			int omID = Buy.getOMID(om);			
			PreparedStatement pst1 = con.prepareStatement("Select T_Count from Take where T_ID=?");
			pst1.setInt(1, Integer.parseInt(id));
			ResultSet rs = pst1.executeQuery();
			rs.next();
			String old = rs.getString(1);
			Buy.updateOM(omID+"", new BigDecimal(count), new BigDecimal(old));
			PreparedStatement pst = con.prepareStatement("update take set T_OM_ID=?, T_Count=?, T_Op_ID=? where T_ID=?");
			pst.setInt(1, omID);
			pst.setBigDecimal(2, new BigDecimal(count));
			pst.setInt(3, Integer.parseInt(opID));
			pst.setInt(4, Integer.parseInt(id));
			System.out.println(om);
			System.out.println(omID);
			System.out.println(count);
			System.out.println(opID);
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Update Take Record Error!");
		}
	}
	
	public static void delete(String id) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst1 = con.prepareStatement("Select T_Count, T_OM_ID from Take where T_ID=?");
			pst1.setInt(1, Integer.parseInt(id));
			ResultSet rs = pst1.executeQuery();
			rs.next();
			String old = rs.getString(1);
			String omID = rs.getString(2);
			Buy.updateOM(omID, new BigDecimal(0), new BigDecimal(old));
			PreparedStatement pst = con.prepareStatement("delete from take where T_ID = ?");
			pst.setInt(1, Integer.parseInt(id));
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Delete Buy Record Error!");
		}
	}
}
