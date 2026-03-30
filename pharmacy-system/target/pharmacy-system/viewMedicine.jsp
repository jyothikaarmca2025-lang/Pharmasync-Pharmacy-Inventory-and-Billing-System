<%@ page import="java.util.*,com.pharmacy.dao.MedicineDAO,com.pharmacy.model.Medicine"%>

<%

MedicineDAO dao=new MedicineDAO();
List<Medicine> list=dao.getAllMedicines();

int serial=1;

%>

<!DOCTYPE html>
<html>

<head>

<title>View Medicines</title>

<link rel="stylesheet" href="css/table.css">
<link rel="stylesheet" href="css/style.css">

<style>

body{
font-family:Segoe UI;
background:#f4f6f9;
margin:0;
padding:30px;
}

h2{
text-align:center;
color:#2c3e50;
}

table{
width:90%;
margin:auto;
border-collapse:collapse;
background:white;
box-shadow:0 5px 15px rgba(0,0,0,0.2);
}

th{
background:#4CAF50;
color:white;
padding:12px;
}

td{
padding:10px;
border-bottom:1px solid #ddd;
text-align:center;
}

tr:hover{
background:#f1f1f1;
}

a{
padding:6px 12px;
border-radius:5px;
text-decoration:none;
color:white;
}

.edit{
background:#2196F3;
}

.delete{
background:#e53935;
}

.edit:hover{
background:#1976D2;
}

.delete:hover{
background:#c62828;
}

</style>

<script>

function confirmDelete(){
return confirm("Are you sure you want to delete this medicine?");
}

</script>

</head>

<body>

<h2>Medicine List</h2>

<table>

<tr>
<th>S.No</th>
<th>ID</th>
<th>Name</th>
<th>Company</th>
<th>Price</th>
<th>Quantity</th>
<th>Action</th>
</tr>

<%
for(Medicine m:list){
%>

<tr>

<td><%=serial++%></td>

<td><%=m.getId()%></td>

<td><%=m.getName()%></td>

<td><%=m.getCompany()%></td>

<td><%=m.getPrice()%></td>

<td><%=m.getQuantity()%></td>

<td>


<a class="delete" href="deleteMedicine?id=<%=m.getId()%>" onclick="return confirmDelete()">Delete</a>

</td>

</tr>

<%
}
%>

</table>

</body>
</html>