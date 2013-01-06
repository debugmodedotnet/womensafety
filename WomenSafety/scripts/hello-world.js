// JavaScript Document
 var contactsarray=[];
var friendscontact = [];
var friendsfronlocalstorage ;
var currentlong = "";
var currentlat = "";
var currentlocation = "";
var datetime ="";

// Wait for PhoneGap to load
document.addEventListener("deviceready", onDeviceReady, false);

  


// PhoneGap is ready
function onDeviceReady() {
    getLocation();
    //alert("You are running application in Test Mode.To change the mode go to settings. In Test mode we send message as \"Hey I am Testing this App \"");
    getCurrentDateandTime();
}

function getCurrentDateandTime()
{
    
    var currentdate = new Date(); 
   datetime =  currentdate.getDate() + "/"
                + (currentdate.getMonth()+1)  + "/" 
                + currentdate.getFullYear() + " @ "  
                + currentdate.getHours() + ":"  
                + currentdate.getMinutes() + ":" 
                + currentdate.getSeconds();
    console.log(datetime);
}

function getLocation() {
    navigator.geolocation.getCurrentPosition(onGeolocationSuccess, onGeolocationError);
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


function initreport(e)
{
   // console.log(datetime);
    //console.log("hi");
   // document.getElementById("timebox").value= datetime;
    console.log(datetime);
    $('#timebox').text(datetime); 
     $('#locationbox').text(currentlocation);
    
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
    var locationofincident =  $('#locationbox').text();
    var timeofincident =  $('#timebox').text();
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
     $('#timebox').text("");
     $('#locationbox').text("");
    document.getElementById("timebox").value ="";
   document.getElementById("commenttext").value ="";
    
}

var policestationssetailsdelhi = [

                                    {name :"Darya Ganj", phonenumber:" 01123274683", group :"CENTRAL"},
                                    {name :"Kamla Mkt", phonenumber:"01123233743", group :"CENTRAL"  },
                                    {name :"I.P. Estate", phonenumber:"01123318474", group :"CENTRAL"  },
                                    {name :"Karol Bagh", phonenumber:"01125786639", group :"CENTRAL"  },
                                    {name :"Rajinder Nagar", phonenumber:"01125735012", group :"CENTRAL"  },
                                    {name :"Chandni Mahal", phonenumber:"01123271751", group :"CENTRAL"  },
                                    {name :"Hauz Qazi", phonenumber:" 01123522482", group :"CENTRAL"  },
                                    {name :"Nabi Karim", phonenumber:"01123221081", group :"CENTRAL"  },
                                    {name :"Prasad Nagar", phonenumber:"01125725652", group :"CENTRAL"  },
                                    {name :"Kalyanpuri", phonenumber:"01122472251", group :"EAST"  },
                                    {name :"Trilokpuri", phonenumber:"01122253317", group :"EAST"  },
                                    


];

var policestationssetailsdelhidatasource = new kendo.data.DataSource.create({data: policestationssetailsdelhi, group: "group"});
var resources = [

                                    {name :"Police Stations", resimage:"appimages\indianpolice.jpg"},
                                    {name :"Hospitals", resimage:"appimages\hospital.jpg"},
                                    {name :"NGO", resimage:"appimages\ngoimage.pnf"},
                                    {name :"Emergency Numbers", resimage:"appimages\emergtencyimg.png"},

];

function  callthepolice(e)
{
   
    
    var phonenumbertocall = e.dataItem.phonenumber;    
    window.location.href='tel:'+phonenumbertocall;
}
