// menue functionality on mobile//
function showMenu(){
   document.getElementById("menu").className = " ";
   // document.getElementById("haze").className = "screen";
}

function hideMenu(){
  document.getElementById("menu").className = "hide";
  // document.getElementById("haze").className = " ";
}

// function addhideMenu(){
//    document.getElementById("menu").style.display = none;
// }
hideMenu();

document.getElementById("adminicon").onclick = showMenu;

document.getElementById("adminicon").ondblclick = hideMenu;

// document.getElementsByTagName("a").onclick = addhideMenu;


function menuCreate(){
  var list = document.getElementsByClassName("menu")[0];
  list.classList.toggle("show");
  
}

var menu_button_click = document.getElementsByClassName("adminicon")[0];

menu_button_click.onclick = menuCreate;