// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
  setDate();
  setInterval(GetClock, 1200);

  $("#start_session").click(function(){
    $.ajax({
      type: "POST",
      url: window.location.origin + "/start_session",
      dataType: "script"
    });
  });
});
tday = new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
tmonth = new Array("January","February","March","April","May","June","July","August","September","October","November","December");

function setDate(){
  var d = new Date();
  var nday = d.getDay(),nmonth=d.getMonth(),ndate=d.getDate(),nyear=d.getFullYear();
  $("#day p").text(tday[nday]);
  $("#month p").text(ndate + " " + tmonth[nmonth]);
  $("#year p").text(nyear);
}

function GetClock(){
  var d = new Date();
  var nhour = d.getHours(),nmin=d.getMinutes(),nsec=d.getSeconds();
  if(nhour<=9) nhour="0"+nhour;
  if(nmin<=9) nmin="0"+nmin;
  if(nsec<=9) nsec="0"+nsec;
  if ($("#hh p").text() != nhour){
    $("#hh").addClass("change");
  }
  if ($("#mm p").text() != nmin){
    $("#mm").addClass("change");
  }
  if ($("#ss p").text() != nsec){
    $("#ss").addClass("change");
  }
  $(".ui.horizontal.segments.time .change").transition('slide down');
  $("#hh p").html(nhour);
  $("#mm p").html(nmin);
  $("#ss p").html(nsec);
  $(".ui.horizontal.segments.time  .change").transition('slide up');
  $(".change").removeClass("change");
  // document.getElementById('clockbox').innerHTML=""+tday[nday]+", "+tmonth[nmonth]+" "+ndate+", "+nyear+" "+nhour+":"+nmin+":"+nsec+"";
}

