<%@page import="javax.sql.DataSource"%>
<%@ page language="java"
	import="java.util.*,javax.naming.*,java.sql.*,com.pro.entity.*"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body>
	<%
		try {
			Context ct = new InitialContext();
			DataSource ds = (DataSource) ct
					.lookup("java:comp/env/jdbc/news");

			Connection conn = ds.getConnection();

			String sql = "select * from news_user";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			Users user = null;
			List<Users> ulist = new ArrayList<Users>();
			if (rs != null) {

				while (rs.next()) {

					user = new Users();
					user.setUsername(rs.getString("username"));
					user.setPassword(rs.getString("userpwd"));
					ulist.add(user);
				}

			}

			for (Users us : ulist) {

				out.print(">>>>" + us.getUsername() + ">>>>"
						+ us.getPassword());
			}

		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	%>
</body>
</html>
