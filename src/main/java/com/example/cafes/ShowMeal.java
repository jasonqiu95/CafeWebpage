package com.example.cafes;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ShowMeal {
	
	public static List<String> getMT() {
		List<String> mts = new ArrayList<String>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= null;
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from MealType");
			while (rs.next()) {
				mts.add(rs.getString(2));
			}
		} catch(Exception e) {
		}
		
		return mts;
	}
	
	public static ResultSet getMeals() {
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= null;
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			Statement st = con.createStatement();
			rs = st.executeQuery("select * from Meal join MealType on meal.M_T_ID = MealType.MT_ID");
		} catch (Exception e) {
			
		}
		return rs;		
	}
	
	public static String[] fetchIntroAndName(String mID) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("select m_intro, m_name from meal where m_ID = ?");
			pst.setInt(1, Integer.parseInt(mID));
			ResultSet rs = pst.executeQuery();
			rs.next();
			String[] rt = new String[2];
			rt[0] = rs.getString(1);
			rt[1] = rs.getString(2);
			return rt;
		} catch (Exception e) {
			System.out.println("Fetch Intro Error!!");
			return null;
		}
	}
	
	public static ResultSet fetchComment(String mID) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("SELECT EV_Comment, U_ID, EV_Score FROM evaluate join users on EV_U_ID = U_ID where EV_M_ID = ?");
			pst.setInt(1, Integer.parseInt(mID));
			return pst.executeQuery();
		} catch (Exception e) {
			System.out.println("Fetch Comment Error!");
			return null;
		}
	}
}
