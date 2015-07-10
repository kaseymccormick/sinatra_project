// menue functionality on mobile//
function showMenu(){
   document.getElementById("menu").className = " "; 
   // document.getElementById("haze").className = "screen";
}

function hideMenu(){
  document.getElementById("menu").className = "hide";
  // document.getElementById("haze").className = " ";
}

hideMenu();

document.getElementById("adminicon").onclick = showMenu;

document.getElementById("adminicon").ondblclick = hideMenu;
