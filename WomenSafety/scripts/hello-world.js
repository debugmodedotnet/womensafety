// JavaScript Document
 var contactsarray=[];
var friendscontact = [];
var friendsfronlocalstorage ;
var currentlong = "";
var currentlat = "";
var currentlocation = "";

// Wait for PhoneGap to load
document.addEventListener("deviceready", onDeviceReady, false);

  


// PhoneGap is ready
function onDeviceReady() {
    getLocation();
    //alert("You are running application in Test Mode.To change the mode go to settings. In Test mode we send message as \"Hey I am Testing this App \"");
    
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
               
                currentlocation = results[1].formatted_address;
                
            }
        }
    });

   
}

// onGeolocationError Callback receives a PositionError object
function onGeolocationError(error) {
    $("#myLocation").html("<span class='err'>" + error.message + "</span>");
}


function sendmessages(e)
{
    
   var messagetosend ;
    
     if (localStorage.messagestorage)
    {
       
       
         messagetosend =localStorage["messagestorage"];
         
       
    }
    
    else
    {
        
        messagetosend = " Hey Dear , Please help me . I am in danger ";
        
    }
    
    
    
    var  friendsfronlocalstoragetosendmessage=[];
    var numberstosend ="";
    if (localStorage.friendscontactstorage)
        {
            friendsfronlocalstoragetosendmessage = JSON.parse(localStorage["friendscontactstorage"]);
             for(var i =0;i<friendsfronlocalstoragetosendmessage.length;i++)
                {
                        
                        numberstosend = friendsfronlocalstoragetosendmessage[i].friend + "," + numberstosend ;
                }
         
            
            
         window.location.href = "sms:" + numberstosend + "?body=" + messagetosend + "    I am at   "  + currentlocation;
        }
    else
    {
        window.location.href = "sms:" + numberstosend + "?body=" + messagetosend+ " I am at   " + currentlocation;
    }
    
    
}


function addnumbers(e)
{
   
   
    var numberstoadd = document.getElementById('numberinputbox').value;
     
     if (localStorage.friendscontactstorage)
    {
       
        friendscontact = JSON.parse(localStorage["friendscontactstorage"]);
        friendscontact.push({friend:numberstoadd});
       
    }
    else
    {
        friendscontact.push({friend:numberstoadd});
        
    }
    
    
    
    localStorage["friendscontactstorage"]= JSON.stringify(friendscontact);
    document.getElementById('numberinputbox').value = "";
    
    showfriends();
    
   
    
}

function showfriends(e)
{
   
      
	if (localStorage.friendscontactstorage) {
		friendsfronlocalstorage = JSON.parse(localStorage["friendscontactstorage"]);
	}
	var friendsdata = new kendo.data.DataSource(
		{
                   
		data : friendsfronlocalstorage
                            
	});
    
    
   
    
	if (friendsdata != null) {
		friendsdata.fetch(); 
	}
   
	var template1 = kendo.template($("#friendstemplate").text());
	$("#friendlist").kendoMobileListView({
		dataSource: friendsdata,
		template:template1,
		style:"inset",
        endlessScroll: true
   
	});
	
   
    
}

function deletefriend(e)
{
   // console.log("hi");
    //console.log(($(e.item).index()));
    var index = $(e.item).index();
   var friendscontact1 = JSON.parse(localStorage["friendscontactstorage"]);
     //friendscontact.push({friend:numberstoadd});
    removeByIndex(friendscontact1,index);
    localStorage["friendscontactstorage"]= JSON.stringify(friendscontact1);
    showfriends();
    
    
    
}
function removeByIndex(arr, index) {
    arr.splice(index, 1);
}

 
function savemessage()
{
     var messagetosend = document.getElementById('messagetext').value;    
   
        
    localStorage["messagestorage"]= messagetosend;
    
  
    
    
}

function initsetting()
{
     if (localStorage.messagestorage)
    {
       
       
         document.getElementById('messagetext').value =localStorage["messagestorage"];
       
    }
}


function savereport()
{
    
    var reports = [];
    var locationofincident = document.getElementById("locationbox").value;
    var timeofincident = document.getElementById("timebox").value;
    var commentonincident  = document.getElementById("commenttext").value;
    var typeofincident = $("#typeofreport option:selected").text();
    console.log(typeofincident);
    if (localStorage.reportstorage)
    {
       
        reports = JSON.parse(localStorage["reportstorage"]);
        reports.push({location:locationofincident,time:timeofincident,comment:commentonincident,type:typeofincident});
       
    }
    else
    {
        reports.push({location:locationofincident,time:timeofincident,comment:commentonincident,type:typeofincident});
        
    }
    
    
    
    localStorage["reportstorage"]= JSON.stringify(reports);
    document.getElementById('numberinputbox').value = "";
  
    
}

