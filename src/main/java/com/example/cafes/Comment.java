package com.example.cafes;
import java.sql.*;

public class Comment {
	public static void placeComment(String userID, String comment, String mID, String score) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("insert into evaluate (EV_M_ID, EV_U_ID, EV_Score, EV_Comment) values (?, ?, ?, ?)");
			pst.setInt(1, Integer.parseInt(mID));
			pst.setInt(2, Integer.parseInt(userID));
			pst.setInt(3, Integer.parseInt(score));
			pst.setString(4, comment);
			pst.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("Place comment Error!");
		}
	}
}
