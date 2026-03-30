function searchMedicine(){

let input=document.getElementById("search").value.toLowerCase();

let rows=document.getElementsByTagName("tr");

for(let i=1;i<rows.length;i++){

let name=rows[i].cells[1].innerText.toLowerCase();

if(name.includes(input)){
rows[i].style.display="";
}
else{
rows[i].style.display="none";
}

}

}