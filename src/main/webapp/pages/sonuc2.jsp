<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="data.Dlip"%>
<%@ page import="java.sql.*"%>
<%
	ResultSet rs = null;
double x1, x2, x3, x4, x5;
%>
<!DOCTYPE html>
<html lang="">
<head>
<title>Hipotez 2 Sonuç Sayfası</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="../styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body id="top">
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- Top Background Image Wrapper -->
	<div class="bgded overlay"
		style="background-image: url('https://images.unsplash.com/photo-1453090927415-5f45085b65c0?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=1031&amp;q=80');">
		<!-- ################################################################################################ -->
		<div class="wrapper row1">
			<header id="header" class="hoc clear">
				<!-- ################################################################################################ -->
				<div id="logo" class="fl_left">
					<h1>
						<a href="../index.html">Altın Oran</a>
					</h1>
				</div>
				<nav id="mainav" class="fl_right">
					<ul class="clear">
						<li><a href="../index.html">Anasayfa</a></li>
						<li><a href="anket.html">Anket</a></li>
						<li><a href="sonuc.jsp">Hipotez 1</a></li>
						<li><a href="sonuc2.jsp">Hipotez 2</a></li>
					</ul>
				</nav>
				<!-- ################################################################################################ -->
			</header>
		</div>
		<!-- ################################################################################################ -->
		<!-- ################################################################################################ -->
		<!-- ################################################################################################ -->
		<section id="breadcrumb" class="hoc clear">
			<!-- ################################################################################################ -->
			<ul>
				<li><a href="../index.html">Anasayfa</a></li>
				<li><a href="sonuc2.jsp">Hipotez 2</a></li>
			</ul>
			<!-- ################################################################################################ -->
			<h6 class="heading">Sonuç</h6>
			<!-- ################################################################################################ -->
		</section>
		<!-- ################################################################################################ -->
	</div>
	<!-- End Top Background Image Wrapper -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper row3">
		<main class="hoc container clear">
			<!-- main body -->
			<!-- ################################################################################################ -->
			<div class="content">

				<h1>Anket Sonuçları</h1>
				<p class="imgr">Kullanıcı verileri Çok Çirkin ve Çok Güzel
					olarak 1-4 Arası puanlanmıştır.</p>
				<p class="imgr">Algoritmalarda Altın Orana göre 1.618 değeri çok
					güzel oran kabul edilir.</p>
				<div class="scrollable">
					<table>
						<thead>
							<tr>
								<th style="text-align: center;">Kişiler</th>
								<th>Verilere Göre Güzellik Yüzdesi</th>

							</tr>
						</thead>
						<tbody>
							<%
								Connection connection = null;
							try {
								System.out.println("Sonuc2");
								Class.forName("com.mysql.cj.jdbc.Driver");
								String url = "jdbc:mysql://localhost:3306/goldenRatio";
								String user = "root";
								String password = "umut1810";
								connection = DriverManager.getConnection(url, user, password);
								Statement statement = connection.createStatement();
								System.out.println("Bağlandı2");
								String sql = "SELECT Ratio.id, Ratio.Total, haar.Total, anketsonuc.anketSonuc, Ratio.A1, Ratio.A2, Ratio.A3, Ratio.A4, Ratio.A5, haar.A1, haar.A2, haar.A3, haar.A4, haar.A5 FROM Ratio INNER JOIN haar ON Ratio.id = haar.id INNER JOIN anketsonuc ON haar.id = anketsonuc.id";
								rs = statement.executeQuery(sql);
								while (rs.next()) {
							%>
							<%
							double anketSonuc = Double.valueOf(rs.getDouble(4));
							double t = (rs.getDouble(4) / rs.getDouble(12)) * 0.25;
							double a = (rs.getDouble(4) / rs.getDouble(6)) * 0.25;
							double B = t * ((rs.getDouble(11) + rs.getDouble(12) + rs.getDouble(13) + rs.getDouble(14)) / rs.getDouble(4));
							double A = a * ((rs.getDouble(6) + rs.getDouble(7) + rs.getDouble(8) + rs.getDouble(9)) / rs.getDouble(4));
							double t1 = (1 - B) * (rs.getDouble(4) / rs.getDouble(10));
							double a1 = (1 - A) * (rs.getDouble(4) / rs.getDouble(5));
							double haarSonuc = t1 * rs.getDouble(10)
									+ t * (rs.getDouble(11) + rs.getDouble(12) + rs.getDouble(13) + rs.getDouble(14));
							double dlibSonuc = a1 * rs.getDouble(5) + a * (rs.getDouble(6) + rs.getDouble(7) + rs.getDouble(8) + rs.getDouble(9));
						
							double m1 = -1.19269696;
							double m2 = 0.693763099;
							double m3 = 0.232062466;
							double m4 = -0.396460191;
							double m5 = 1.524960862;
							double matrixSonuc = m1 * rs.getDouble(5) + m2 * rs.getDouble(6) + m3 * rs.getDouble(7) + m4 * rs.getDouble(8)
									+ m5 * rs.getDouble(9);
							double mx1 = -1.19444;
							double mx2 = 0.803963099;
							double mx3 = 0.472062466;
							double mx4 = -0.656460191;
							double mx5 = 1.030960862;
							double matrixxSonuc = mx1 * rs.getDouble(10) + mx2 * rs.getDouble(11) + mx3 * rs.getDouble(12) + mx4 * rs.getDouble(13)
									+ mx5 * rs.getDouble(14);
							%>
							<tr>
								<td width="20%"><a href="#"><br> <img
										class="imgl borderedbox inspace-5"
										src="../images/anket/<%=rs.getInt(1)%>.jpeg" alt=""></a></td>
								<td><br>
									<p>Kullanıcı Verileri Göre</p>
									<div class="progress">
										<div class="progress-bar progress-bar-striped bg-info"
											role="progressbar"
											style="width:<%=(rs.getDouble(4) * 100) / 4%>%"
											aria-valuenow="<%=rs.getDouble(4)%>" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div> <br>
									<p>Dlib Algoritması Göre</p>
									<div class="progress">
										<div class="progress-bar progress-bar-striped bg-warning"
											role="progressbar"
											style="width:<%=(matrixSonuc * 100) / 4%>%"
											aria-valuenow="<%=(dlibSonuc * 100) / 4%>" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div> <br>
									<p>HaarCascade Algoritması Göre</p>
									<div class="progress">
										<div class="progress-bar progress-bar-striped bg-danger"
											role="progressbar"
											style="width: <%=(matrixxSonuc * 100) / 4%>%"
											aria-valuenow="<%=(haarSonuc * 100) / 4%>" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div> <br></td>
							</tr>
							<%//System.out.println(rs.getInt(1)+" "+rs.getDouble(2)+" "+rs.getDouble(3)); %>
							<%
								System.out.println(rs.getInt(1) + " " + dlibSonuc + "||" + haarSonuc + "||" + rs.getDouble(4));
							%>
							<%
								}
							} catch (SQLException e) {
								System.out.println("Error!!!!!!" + e);
							}
							%>

						</tbody>
					</table>
				</div>
				<!-- ################################################################################################ -->
			</div>
			</table>
	</div>
	<!-- ################################################################################################ -->
	</div>
	<!-- ################################################################################################ -->
	<!-- / main body -->
	<div class="clear"></div>
	</main>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper row5">
		<div id="copyright" class="hoc clear">
			<!-- ################################################################################################ -->
			<p class="fl_left">
				Copyright &copy; 2020 - İstanbul Aydin Üniversitesi - <a href="#"></a>
				Mühendislik Fakültesi
			</p>
			<p class="fl_right">Bilgisayar Mühendisliği Bölümü Bitirme
				Projesi</p>
			<!-- ################################################################################################ -->
		</div>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
	<!-- JAVASCRIPTS -->
	<script src="../scripts/jquery.min.js"></script>
	<script src="../scripts/jquery.backtotop.js"></script>
	<script src="../scripts/jquery.mobilemenu.js"></script>
</body>
</html>