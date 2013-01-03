// JavaScript Document
 var contactsarray=[];
var friendscontact = [];
var friendsfronlocalstorage ;

// Wait for PhoneGap to load
document.addEventListener("deviceready", onDeviceReady, false);

$(document).ready(function(){
    
    
   
    $("#addfriendsbutton").click(function() {
        
               addnumbers();
        });
});   


// PhoneGap is ready
function onDeviceReady() {
    getLocation();
   
    
}

function getLocation() {
    navigator.geolocation.getCurrentPosition(onGeolocationSuccess, onGeolocationError);
}

//=======================Say Hello (Page 1) Operations=======================//
function sayHello() {
    var sayHelloInputElem = document.getElementById('helloWorldInput');
    var sayHelloTextElem = document.getElementById('helloWorldText');
    var inputText = document.getElementById('txtName');

    sayHelloTextElem.innerHTML = 'Hello, ' + inputText.value + '!';
    sayHelloTextElem.style.display = 'block';
    sayHelloInputElem.style.display = 'none';
}


//=======================Geolocation Operations=======================//
// onGeolocationSuccess Geolocation
function onGeolocationSuccess(position) {
    // Use Google API to get the location data for the current coordinates
    var geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    geocoder.geocode({ "latLng": latlng }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            if ((results.length > 1) && results[1]) {
                $("#myLocation").html(results[1].formatted_address);
            }
        }
    });

    // Use Google API to get a map of the current location
    // http://maps.googleapis.com/maps/api/staticmap?size=280x300&maptype=hybrid&zoom=16&markers=size:mid%7Ccolor:red%7C42.375022,-71.273729&sensor=true
    var googleApis_map_Url = 'http://maps.googleapis.com/maps/api/staticmap?size=300x300&maptype=hybrid&zoom=16&sensor=true&markers=size:mid%7Ccolor:red%7C' + latlng;
    var mapImg = '<img src="' + googleApis_map_Url + '" />';
    $("#map_canvas").html(mapImg);
}

// onGeolocationError Callback receives a PositionError object
function onGeolocationError(error) {
    $("#myLocation").html("<span class='err'>" + error.message + "</span>");
}


function sendmessages(e)
{
     
     var  friendsfronlocalstoragetosendmessage=[];
    var numberstosend ="";
    if (localStorage.friendscontactstorage)
        {
            friendsfronlocalstoragetosendmessage = JSON.parse(localStorage["friendscontactstorage"]);
             for(var i =0;i<friendsfronlocalstoragetosendmessage.length;i++)
                {
                        
                        numberstosend = friendsfronlocalstoragetosendmessage[i].friend + "," + numberstosend ;
                }
         
         window.location.href = "sms:" + numberstosend + "?body=" + "hello test message";
        }
    
   
    
    console.log(numberstosend);
    
    
}
function addnumbers(e)
{
    
   console.log("hi");
    var numberstoadd = document.getElementById('numberinputbox').value;
     
     if (localStorage.friendscontactstorage)
    {
         
        friendscontact = JSON.parse(localStorage.getItem('friendscontactstorage'));
        friendscontact.push({friend:numberstoadd});
        
    }
    else
    {
        
        friendscontact.push({friend:numberstoadd});
        
    }
    localStorage.setItem('friendscontactstorage', JSON.stringify(friendscontact));
    console.log(friendscontact);
   
    
}



function showfriends()
{
    
     var friendsdata = new kendo.data.DataSource({
     data: friendscontact
    
      });
    
    friendsdata.read();
}
function showfriends(e)
{
   
      
     if (localStorage.friendscontactstorage)
{
     friendsfronlocalstorage = JSON.parse(localStorage["friendscontactstorage"]);
}
    var friendsdata = new kendo.data.DataSource(
                {
                   
                  data : friendsfronlocalstorage
                            
         });
    
    
   
    
     if(friendsdata != null)
    {
       friendsdata.fetch(); 
    }
   
    var template1 = kendo.template($("#friendstemplate").text());
    $("#friendlist").kendoMobileListView({
    dataSource: friendsdata,
    template:template1,
    style:"inset"
   
    });
    
   
    
}
