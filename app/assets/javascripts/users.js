// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
  GetClock();
  setInterval(GetClock,1000);
});
tday = new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
tmonth = new Array("January","February","March","April","May","June","July","August","September","October","November","December");

function GetClock(){
  var d = new Date();
  var nday = d.getDay(),nmonth=d.getMonth(),ndate=d.getDate(),nyear=d.getFullYear();
  var nhour = d.getHours(),nmin=d.getMinutes(),nsec=d.getSeconds();
  if(nmin<=9) nmin="0"+nmin
  if(nsec<=9) nsec="0"+nsec;

  // document.getElementById('clockbox').innerHTML=""+tday[nday]+", "+tmonth[nmonth]+" "+ndate+", "+nyear+" "+nhour+":"+nmin+":"+nsec+"";
}
