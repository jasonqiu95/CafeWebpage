package com.example.cafes;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SellRecord {
	public static ResultSet fetch() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			return con.prepareStatement("Select * from sell join meal on M_id=S_M_ID").executeQuery();
		} catch (Exception e) {
			System.out.println("Fetch Providers Error!");
			return null;
		}
	}
	
	public static void add(String meal, String price, String count, String opid) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("insert into sell (S_M_ID, S_SPrice, S_Count, S_OP_ID) values (?,?,?,?)");
			int mealID = getMealID(meal);
			pst.setInt(1, mealID);
			pst.setBigDecimal(2, new BigDecimal(price));
			pst.setInt(3, Integer.parseInt(count));
			pst.setInt(4, Integer.parseInt(opid));
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Add Sell Record Error!");
		}
	}
	
	public static void update(String id, String meal, String price, String count, String opid) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("update sell set S_M_ID=?, S_SPrice=?, S_Count=?, S_Op_ID=? where S_ID_N=?");
			int mealID = getMealID(meal);
			pst.setInt(1, mealID);
			pst.setBigDecimal(2, new BigDecimal(price));
			pst.setInt(3, Integer.parseInt(count));
			pst.setInt(4, Integer.parseInt(opid));
			pst.setInt(5, Integer.parseInt(id));
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Update Sell Record Error!");
		}
	}
	
	public static void delete(String id) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("delete from sell where S_ID_N = ?");
			pst.setInt(1, Integer.parseInt(id));
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Delete Sell Record Error!");
		}
	}
	
	public static List<String> getMeal() {
		List<String> ps = new ArrayList<String>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			ResultSet rs = con.createStatement().executeQuery("Select M_Name from Meal where M_isAvailable=true");
			while (rs.next()) {
				ps.add(rs.getString(1));
			}
			return ps;
		} catch (Exception e) {
			System.out.println("Fetch Meal Error!");
			return null;
		}
	}
	
	public static int getMealID(String name) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("Select M_ID from meal where M_name=?");
			pst.setString(1, name);
			ResultSet rs = pst.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (Exception e) {
			System.out.println("Get Meal ID error!");
			return -1;
		}
	}
}
