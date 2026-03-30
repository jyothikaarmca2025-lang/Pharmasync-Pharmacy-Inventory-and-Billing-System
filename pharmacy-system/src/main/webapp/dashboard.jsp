<%@ page import="com.pharmacy.dao.MedicineDAO" %>

<%
MedicineDAO dao = new MedicineDAO();

int totalMedicines = dao.getTotalMedicines();
int lowStock = dao.getLowStockMedicines();
int totalStock = dao.getTotalStock();
%>

<!DOCTYPE html>
<html>

<head>

<title>ARJ Pharma Dashboard</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>

body{
margin:0;
font-family:Segoe UI;
background:url("dashboard.png") no-repeat center center/cover;
min-height:100vh;
}

/* Header */

.header{
background:rgba(0,0,0,0.7);
color:white;
padding:15px;
display:flex;
justify-content:space-between;
align-items:center;
}

.header h2{
margin:0;
}

/* Container */

.container{
padding:30px;
}

/* Cards */

.cards{
display:grid;
grid-template-columns:repeat(3,1fr);
gap:20px;
margin-bottom:30px;
}

.card{
background:rgba(255,255,255,0.9);
padding:20px;
border-radius:10px;
text-align:center;
box-shadow:0 6px 15px rgba(0,0,0,0.3);
transition:0.3s;
}

.card:hover{
transform:scale(1.05);
}

.card h3{
margin:10px 0;
}

.card p{
font-size:28px;
font-weight:bold;
color:#27ae60;
}

/* Menu */

.menu{
display:grid;
grid-template-columns:repeat(4,1fr);
gap:20px;
}

.menu a{
text-decoration:none;
background:linear-gradient(45deg,#4CAF50,#66bb6a);
color:white;
padding:20px;
border-radius:8px;
text-align:center;
font-size:18px;
transition:0.3s;
}

.menu a:hover{
background:#2e7d32;
transform:scale(1.05);
}

/* Chart */

.chart{
margin-top:40px;
background:rgba(255,255,255,0.9);
padding:30px;
border-radius:10px;
box-shadow:0 6px 15px rgba(0,0,0,0.3);
}

</style>

</head>

<body>

<div class="header">

<h2>ARJ Pharma Management System</h2>

<a href="logout" style="color:white;text-decoration:none;">Logout</a>

</div>

<div class="container">

<!-- Dashboard Cards -->

<div class="cards">

<div class="card">
<h3>Total Medicines</h3>
<p><%=totalMedicines%></p>
</div>

<div class="card">
<h3>Low Stock</h3>
<p><%=lowStock%></p>
</div>

<div class="card">
<h3>Total Stock</h3>
<p><%=totalStock%></p>
</div>

</div>

<!-- Menu -->

<div class="menu">

<a href="addMedicine.jsp">Add Medicine</a>

<a href="viewMedicine.jsp">View Medicines</a>

<a href="billing.jsp">Create Billing</a>


</div>

<!-- Chart -->

<div class="chart">

<h3>Medicine Statistics</h3>

<canvas id="medicineChart"></canvas>

</div>

</div>

<script>

const ctx=document.getElementById("medicineChart");

new Chart(ctx,{
type:"bar",
data:{
labels:["Total Medicines","Low Stock","Total Stock"],
datasets:[{
label:"Pharmacy Data",
data:[<%=totalMedicines%>,<%=lowStock%>,<%=totalStock%>]
}]
},
options:{
responsive:true
}
});

</script>

</body>

</html>