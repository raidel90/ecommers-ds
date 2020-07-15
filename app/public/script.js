var
  fac = 1,
  twi = 1,
  inst = 1,
  you = 1
;

function divFacebook(){
   if(fac==1){
     document.getElementById("facebook").style.height = "50vh"
     document.getElementById("facebook").style.width = "385px";
     document.getElementById("instagram").style.height = "0px";
     document.getElementById("instagram").style.width = "0px";
     document.getElementById("youtube").style.height = "0px";
     document.getElementById("youtube").style.width = "0px";
     document.getElementById("twitter").style.height = "0px"
     document.getElementById("twitter").style.width = "0px";
     fac = fac + 1;
     twi = 1;
     inst = 1;
     you = 1;
   } else{
     document.getElementById("facebook").style.height = "0px";
     document.getElementById("facebook").style.width = "0px";
     fac = 1;
   }

}

function divTwitter(){
   if(twi==1){
     document.getElementById("twitter").style.height = "328px"
     document.getElementById("twitter").style.width = "385px";
     document.getElementById("instagram").style.height = "0px";
     document.getElementById("instagram").style.width = "0px";
     document.getElementById("youtube").style.height = "0px";
     document.getElementById("youtube").style.width = "0px";
     document.getElementById("facebook").style.height = "0px"
     document.getElementById("facebook").style.width = "0px";
     twi = twi + 1;
     fac = 1;
     inst = 1;
     you = 1;
   } else{
     document.getElementById("twitter").style.height = "0px";
     document.getElementById("twitter").style.width = "0px";
     twi = 1;
   }

}
function divInstagram(){
   if(inst==1){
     document.getElementById("instagram").style.height = "50vh"
     document.getElementById("instagram").style.width = "385px";
     document.getElementById("facebook").style.height = "0px"
     document.getElementById("facebook").style.width = "0px";
     document.getElementById("youtube").style.height = "0px";
     document.getElementById("youtube").style.width = "0px";
     document.getElementById("twitter").style.height = "0px"
     document.getElementById("twitter").style.width = "0px";
     inst = inst + 1;
     fac = 1;
     twi = 1;
     you = 1;
   } else{
     document.getElementById("instagram").style.height = "0px";
     document.getElementById("instagram").style.width = "0px";
     inst = 1;
   }

}
function divYoutube(){
   if(you==1){
     document.getElementById("youtube").style.height = "328px"
     document.getElementById("youtube").style.width = "385px";
     document.getElementById("facebook").style.height = "0px"
     document.getElementById("facebook").style.width = "0px";
     document.getElementById("instagram").style.height = "0px";
     document.getElementById("instagram").style.width = "0px";
     document.getElementById("twitter").style.height = "0px"
     document.getElementById("twitter").style.width = "0px";
     you = you + 1;
     fac = 1;
     twi = 1;
     inst = 1;
   } else{
     document.getElementById("youtube").style.height = "0px";
     document.getElementById("youtube").style.width = "0px";
     you = 1;
   }

}
