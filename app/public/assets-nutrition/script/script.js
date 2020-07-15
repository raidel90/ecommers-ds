var
  fac = 1,
  inst = 1
;

function divFacebook(){
   if(fac==1){
     document.getElementById("facebook").style.height = "50vh"
     document.getElementById("facebook").style.width = "348px";
     document.getElementById("instagram").style.height = "0px";
     document.getElementById("instagram").style.width = "0px";
     fac = fac + 1;
     inst = 1;
   } else{
     document.getElementById("facebook").style.height = "0px";
     document.getElementById("facebook").style.width = "0px";
     fac = 1;
   }

}
function divInstagram(){
   if(inst==1){
     document.getElementById("instagram").style.height = "50vh"
     document.getElementById("instagram").style.width = "348px";
     document.getElementById("facebook").style.height = "0px"
     document.getElementById("facebook").style.width = "0px";
     inst = inst + 1;
     fac = 1;
   } else{
     document.getElementById("instagram").style.height = "0px";
     document.getElementById("instagram").style.width = "0px";
     inst = 1;
   }

}
