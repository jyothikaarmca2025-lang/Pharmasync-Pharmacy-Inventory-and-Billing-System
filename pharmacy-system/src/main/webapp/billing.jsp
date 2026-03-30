<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>ARJ Pharma Billing</title>

<style>

body{
font-family:Segoe UI;
background:linear-gradient(to right,#e3f2fd,#f1f8e9);
margin:0;
}

.container{
width:950px;
margin:40px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 8px 25px rgba(0,0,0,0.2);
}

.header{
display:flex;
align-items:center;
gap:20px;
border-bottom:2px solid #eee;
padding-bottom:15px;
}

.logo{
width:70px;
}

.header h1{
margin:0;
color:#2c3e50;
}

.address{
color:#555;
font-size:14px;
}

h3{
color:#2c3e50;
margin-top:25px;
}

input{
width:100%;
padding:10px;
border-radius:6px;
border:1px solid #ccc;
font-size:14px;
}

input:focus{
border-color:#4CAF50;
outline:none;
}

.customer-grid{
display:grid;
grid-template-columns:1fr 1fr 1fr;
gap:15px;
margin-top:10px;
}

table{
width:100%;
border-collapse:collapse;
margin-top:20px;
}

th{
background:#4CAF50;
color:white;
padding:12px;
}

td{
border:1px solid #ddd;
padding:8px;
}

tr:nth-child(even){
background:#f9f9f9;
}

button{
padding:10px 18px;
border:none;
border-radius:6px;
cursor:pointer;
}

.addBtn{
background:#2196F3;
color:white;
margin-top:10px;
}

.addBtn:hover{
background:#1976D2;
}

.deleteBtn{
background:#e53935;
color:white;
}

.deleteBtn:hover{
background:#c62828;
}

.generateBtn{
background:linear-gradient(45deg,#43a047,#66bb6a);
color:white;
margin-top:20px;
font-size:16px;
}

.generateBtn:hover{
transform:scale(1.05);
}

.totalBox{
text-align:right;
margin-top:20px;
}

.totalBox input{
width:200px;
font-size:18px;
font-weight:bold;
background:#f5f5f5;
}

</style>

<script>

var row=1;

function addRow(){

row++;

var table=document.getElementById("medicineTable");

var r=table.insertRow();

r.innerHTML=
"<td><input type='text' name='medicine"+row+"' placeholder='Enter medicine'></td>"+

"<td><input type='number' id='qty"+row+"' name='qty"+row+"' oninput='calculate("+row+")'></td>"+

"<td><input type='number' id='price"+row+"' name='price"+row+"' oninput='calculate("+row+")'></td>"+

"<td><input type='text' id='total"+row+"' name='total"+row+"' readonly></td>"+

"<td><button type='button' class='deleteBtn' onclick='deleteRow(this)'>Delete</button></td>";

}

function deleteRow(btn){

var r=btn.parentNode.parentNode;
r.parentNode.removeChild(r);

grandTotal();

}

function calculate(r){

var qty=parseFloat(document.getElementById("qty"+r).value)||0;
var price=parseFloat(document.getElementById("price"+r).value)||0;

var total=qty*price;

document.getElementById("total"+r).value=total.toFixed(2);

grandTotal();

}

function grandTotal(){

var sum=0;

for(var i=1;i<=row;i++){

var t=document.getElementById("total"+i);

if(t){ sum+=parseFloat(t.value)||0; }

}

document.getElementById("grandTotal").value=sum.toFixed(2);

}

</script>

</head>

<body>

<div class="container">

<div class="header">

<img src="logo.png" class="logo">

<div>
<h1>ARJ PHARMA</h1>
<p class="address">Bengaluru, Karnataka, India</p>
</div>

</div>

<form action="invoice.jsp" method="post">

<h3>Customer Details</h3>

<div class="customer-grid">

<input type="text" name="customerName" placeholder="Customer Name" required>

<input type="text" name="address" placeholder="Address" required>

<input type="text" name="phone" placeholder="Phone Number" required>

</div>

<h3>Medicine Billing</h3>

<table>

<tr>
<th>Medicine</th>
<th>Quantity</th>
<th>Price</th>
<th>Total</th>
<th>Action</th>
</tr>

<tbody id="medicineTable">

<tr>

<td>
<input type="text" name="medicine1" placeholder="Enter medicine name">
</td>

<td>
<input type="number" id="qty1" name="qty1" oninput="calculate(1)">
</td>

<td>
<input type="number" id="price1" name="price1" oninput="calculate(1)">
</td>

<td>
<input type="text" id="total1" name="total1" readonly>
</td>

<td>
<button type="button" class="deleteBtn" onclick="deleteRow(this)">Delete</button>
</td>

</tr>

</tbody>

</table>

<button type="button" class="addBtn" onclick="addRow()">+ Add Medicine</button>

<div class="totalBox">

<h2>Grand Total</h2>

<input type="text" id="grandTotal" name="grandTotal" readonly>

</div>

<button type="submit" class="generateBtn">Generate Invoice</button>

</form>

</div>

</body>
</html>