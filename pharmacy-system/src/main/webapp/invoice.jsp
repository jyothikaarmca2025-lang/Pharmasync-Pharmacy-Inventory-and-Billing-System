<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*,java.text.*"%>

<!DOCTYPE html>
<html>
<head>

<title>ARJ Pharma Invoice</title>

<style>

body{
font-family:Arial;
background:#f4f6f9;
margin:0;
}

.invoice-container{
width:100%;
max-width:1000px;
margin:30px auto;
background:white;
padding:40px;
box-shadow:0 0 10px rgba(0,0,0,0.2);
}

.header{
display:flex;
justify-content:space-between;
align-items:center;
border-bottom:2px solid #ddd;
padding-bottom:10px;
}

.logo{
width:80px;
}

.pharma{
display:flex;
align-items:center;
gap:15px;
}

.pharma h1{
margin:0;
color:#2c3e50;
}

.address{
font-size:14px;
color:#555;
}

.invoice-info{
text-align:right;
}

.customer-box{
margin-top:20px;
}

table{
width:100%;
border-collapse:collapse;
margin-top:25px;
}

th{
background:#4CAF50;
color:white;
padding:10px;
}

td{
border:1px solid #ddd;
padding:8px;
text-align:center;
}

tr:nth-child(even){
background:#f9f9f9;
}

.total-box{
margin-top:25px;
text-align:right;
}

.total-box h2{
color:#2c3e50;
}

.signature{
margin-top:60px;
text-align:right;
}

button{
padding:12px 22px;
background:linear-gradient(45deg,#43a047,#66bb6a);
border:none;
color:white;
font-size:16px;
border-radius:6px;
cursor:pointer;
transition:0.3s;
}

button:hover{
transform:scale(1.05);
background:#2e7d32;
}

</style>


<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

<script>

function downloadPDF(){

var element=document.getElementById("invoice");

var opt={
margin:0,
filename:"ARJ_Pharma_Invoice.pdf",
image:{type:'jpeg',quality:1},
html2canvas:{scale:2},
jsPDF:{unit:'mm',format:'a4',orientation:'landscape'}
};

html2pdf().set(opt).from(element).save();

}

</script>

</head>

<body>

<%

Random r=new Random();
int invoiceNo=1000+r.nextInt(9000);

Date now=new Date();
SimpleDateFormat df=new SimpleDateFormat("dd-MM-yyyy HH:mm");

double grandTotal=0;

%>

<div class="invoice-container" id="invoice">

<div class="header">

<div class="pharma">

<img src="logo.png" class="logo">

<div>
<h1>ARJ PHARMA</h1>
<p class="address">Bengaluru, Karnataka, India</p>
</div>

</div>

<div class="invoice-info">

<p><b>Invoice No:</b> <%=invoiceNo%></p>
<p><b>Date:</b> <%=df.format(now)%></p>

</div>

</div>


<div class="customer-box">

<h3>Customer Details</h3>

<p><b>Name:</b> <%=request.getParameter("customerName")%></p>
<p><b>Address:</b> <%=request.getParameter("address")%></p>
<p><b>Phone:</b> <%=request.getParameter("phone")%></p>

</div>


<table>

<tr>
<th>Medicine</th>
<th>Quantity</th>
<th>Price</th>
<th>Total</th>
</tr>

<%

for(int i=1;i<=100;i++){

String med=request.getParameter("medicine"+i);

if(med!=null && !med.trim().equals("")){

String qty=request.getParameter("qty"+i);
String price=request.getParameter("price"+i);
String total=request.getParameter("total"+i);

if(total!=null && !total.equals("")){

double t=Double.parseDouble(total);
grandTotal+=t;

%>

<tr>

<td><%=med%></td>
<td><%=qty%></td>
<td>₹ <%=price%></td>
<td>₹ <%=total%></td>

</tr>

<%
}
}
}
%>

</table>


<div class="total-box">

<h2>Grand Total : ₹ <%=String.format("%.2f",grandTotal)%></h2>

</div>


<div class="signature">

<p>Authorized Signature</p>

</div>

</div>


<br>

<center>

<button onclick="downloadPDF()">Download Invoice</button>

</center>


</body>
</html>