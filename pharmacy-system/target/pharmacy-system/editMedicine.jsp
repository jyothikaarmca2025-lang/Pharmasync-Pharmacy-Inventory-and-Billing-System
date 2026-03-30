<%@ page import="java.sql.*,com.pharmacy.util.DBConnection"%>

<%

int id=Integer.parseInt(request.getParameter("id"));

Connection con=DBConnection.getConnection();

PreparedStatement ps=con.prepareStatement("select * from medicine where id=?");

ps.setInt(1,id);

ResultSet rs=ps.executeQuery();

rs.next();

%>

<html>

<head>
<title>Edit Medicine</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>

<h2>Edit Medicine</h2>

<form action="updateMedicine" method="post">

<input type="hidden" name="id" value="<%=rs.getInt("id")%>">

<input type="text" name="name" value="<%=rs.getString("name")%>">

<input type="text" name="company" value="<%=rs.getString("company")%>">

<input type="text" name="price" value="<%=rs.getDouble("price")%>">

<input type="number" name="quantity" value="<%=rs.getInt("quantity")%>">

<button type="submit">Update</button>

</form>

</body>
</html>