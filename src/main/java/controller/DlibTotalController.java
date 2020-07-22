package controller;
import data.Dlip;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DlibTotalController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String imageNumber =  request.getParameter("idNumber");
		Dlip d = new Dlip();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"localhost:3306/goldenRatio?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey",
					"root", "umut1810");
			PreparedStatement pst = conn.prepareStatement("Select Total from ratio where id=?");
			pst.setString(1, imageNumber);
			ResultSet rs = pst.executeQuery();
	
			while(rs.next()) {
				d.setIdNumber(rs.getString(1));
				d.setTotalNumber(rs.getString(7));			
			}
		
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}	
		request.setAttribute("imageNumber", d);
		request.getRequestDispatcher("./sonuc.jsp").forward(request, response);
	}
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
