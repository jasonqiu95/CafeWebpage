package com.example.cafes;
import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UpdateMeal {
	
	public static void insertNewMeal(String name, String type, String intro, String price) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement st = con.prepareStatement("insert into Meal (M_Name, M_T_ID, M_Intro, M_SPrice) values (?,?,?,?)");
			int MT_ID = UpdateMeal.getMealTypeID(type, con);
			st.setString(1, name);
			st.setInt(2, MT_ID);
			st.setString(3, intro);
			st.setBigDecimal(4, new BigDecimal(price));
			st.executeUpdate();
		} catch (Exception e) {
			System.out.println();
			System.out.println("Cannot insert new food.");
			System.out.println();
		}
	}
	
	private static int getMealTypeID(String type, Connection con) {
		try {
			PreparedStatement st = con.prepareStatement("select MT_ID from mealtype where MT_Name = ?");
			st.setString(1, type);
			ResultSet rs = st.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (Exception e) {
			System.out.println("Cannot find type ID!");
			return -1;
		}
	}
	
	public static void updateMeal(String mealID, String name, String type, String intro, String price) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("update Meal set M_NAME = ?, M_T_ID = ?, M_Intro = ?, M_SPrice = ? where M_ID = ?");
			int type_id = getMealTypeID(type, con);
			pst.setString(1, name);
			pst.setInt(2, type_id);
			pst.setString(3, intro);
			pst.setInt(5, Integer.parseInt(mealID));
			pst.setBigDecimal(4, new BigDecimal(price));
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("\nUpdate error!\n");
		}
	}
	
	public static void deleteMeal(String mealID) {
		int id = Integer.parseInt(mealID);
		try {
			System.out.println("Delete!!");
			System.out.println(mealID);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("UPDATE meal SET M_isAvailable=false where M_ID = ?");
			pst.setInt(1, id);
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("\ndelete error!!!\n");
		}
	}
}
