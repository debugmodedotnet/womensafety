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
    getCurrentDateandTime();
    checkevolutionmode();
    
    
}

function homeviewshow()
{
    
    $("#trackonoffswitch").data("kendoMobileSwitch").bind("change", function(e) {
        
     console.log(e.checked); // true or false
        
        if(e.checked)
        {
            
            getLocation();
			var friendsfronlocalstoragetosendmessage = [];
			var numberstosend = "";
            var messagetosend = "Please track me as I travel.I will send updates of my current location perodically. On reaching the destination I will send a final update.";
			if (localStorage.friendscontactstorage) {
				friendsfronlocalstoragetosendmessage = JSON.parse(localStorage["friendscontactstorage"]);
				for (var i = 0;i < friendsfronlocalstoragetosendmessage.length;i++) {
                        
					numberstosend = friendsfronlocalstoragetosendmessage[i].friend + "," + numberstosend ;
				}
         
				window.location.href = "sms:" + numberstosend + "?body=" + messagetosend + "Currently I am at   " + currentlocation;
          
			}
			else {
				window.location.href = "sms:" + numberstosend + "?body=" + messagetosend + "Currently I am at   " + currentlocation;
			}
			
            starttrackinglocation();
        }
        else
        {
         
            stoptrackinglocation();
        }
    }
    )
}

function checkevolutionmode()
{
    var modetouse=false;
    if(localStorage.ModeOfUse)
    {
        
        var rd = localStorage["ModeOfUse"];       
        modetouse = rd.toLowerCase()=="true"?1:0;
       
    }
    
   // else
 //   {
   //    modetouse = $("#modeswitch").data("kendoMobileSwitch").check();
  //  }
    
    if(modetouse)
    {
        alert("You are using application in Test Mode! Go to Settings to remove it from Test Mode.");
        app.navigate("#settingsview");
    }
  //  else
  //  {
        
  //  }
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
   
}

var watchID = null;
function starttrackinglocation()
{
	
     
     var  trackintvalue= 60000;
     if(localStorage.TrackingInterval)
    {
        trackintvalue =localStorage["TrackingInterval"]*1000;
        
    }  

    
   
	var options = {
		enableHighAccuracy: true,
       frequency: trackintvalue,
        
	};
	// Watch the position and update
	// when a change has been detected
	watchID =
	navigator.geolocation.watchPosition(
		onSuccess, onError, options);
    
}

function stoptrackinglocation()
{
    
    alert("clear");
    var messagetosend = "I have reached my destination. Thanks for tracking my journey :)";
    if (watchID != null) {
            navigator.geolocation.clearWatch(watchID);
            watchID = null;
            var friendsfronlocalstoragetosendmessage = [];
				var numberstosend = "";
				if (localStorage.friendscontactstorage) {
					friendsfronlocalstoragetosendmessage = JSON.parse(localStorage["friendscontactstorage"]);
					for (var i = 0;i < friendsfronlocalstoragetosendmessage.length;i++) {
                        
						numberstosend = friendsfronlocalstoragetosendmessage[i].friend + "," + numberstosend ;
					}
         
					
                    window.location.href = "sms:" + numberstosend + "?body=" + messagetosend ;
          
				}
				else {
					window.location.href = "sms:" + numberstosend + "?body=" + messagetosend ;
				}
        }


    
}
// Run after successful transaction
// Let's display the position data
function onSuccess(position) {
	var  latitude, longitude;   
    var clocation;
	latitude = position.coords.latitude; 
	longitude = position.coords.longitude;
    var messagetosend = "I am good as of now.";
    
    var geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(latitude,longitude);
    geocoder.geocode({ "latLng": latlng }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            
            if ((results.length > 1) && results[1]) {
               
                clocation = results[1].formatted_address;
              
               
				var friendsfronlocalstoragetosendmessage = [];
				var numberstosend = "";
				if (localStorage.friendscontactstorage) {
					friendsfronlocalstoragetosendmessage = JSON.parse(localStorage["friendscontactstorage"]);
					for (var i = 0;i < friendsfronlocalstoragetosendmessage.length;i++) {
                        
						numberstosend = friendsfronlocalstoragetosendmessage[i].friend + "," + numberstosend ;
					}
         
					window.location.href = "sms:" + numberstosend + "?body=" + messagetosend + " Currently I am at   " + clocation;
          
				}
				else {
					window.location.href = "sms:" + numberstosend + "?body=" + messagetosend + "Currently I am at   " + clocation;
				}
                            
         
                
            }
        }
    });
    
    
}
function onError(error) {
    }

// Functions for show current location in the map 

//var locId;

function showMap() {
	//locId = navigator.geolocation.watchPosition(onGeolocationSuccessCurrentLocation, onGeolocationErrorCurrentLocation, { enableHighAccuracy: true });
    
	navigator.geolocation.getCurrentPosition(
		onSuccessShowMap,
		onErrorShowMap
		);
   
}

function onSuccessShowMap(position)
{
	var latlng = new google.maps.LatLng(
		position.coords.latitude,
		position.coords.longitude);
    
    var mapOptions = {
                            
		sensor:true,
		center: latlng,
		panControl: false,                            
		zoomControl: true,
		zoom: 16,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		streetViewControl: false,
		mapTypeControl: true,
	
                           
	};
    
    var map = new google.maps.Map(
                document.getElementById('map_canvas'),
                mapOptions
        );
    
    var marker = new google.maps.Marker({
                position: latlng,
                map: map
    });
   console.log(marker);
   console.log("map rendering");
}

function onErrorShowMap(error) {
    
    alert("error");
}




function syncreport()
{
     alert("Coming Soon ");
}
function deletereport()
{
     alert("Coming Soon ");
}
function senddangermessages(e)
{
    
   var messagetosend ;
    var modetouse=false;
    if(localStorage.ModeOfUse)
    {
        
        var rd = localStorage["ModeOfUse"];       
        modetouse = rd.toLowerCase()=="true"?1:0;
       
    }
    
    //else
   // {
    //   modetouse = $("#modeswitch").data("kendoMobileSwitch").check();
  //  }
    
    if(modetouse)
    {
        messagetosend = "I am Testing the Safety Application. Please ignore this message.";
      
    }
    else
    {
       
      
          if (localStorage.DangerMessage)
    {
       
       
         messagetosend = localStorage["DangerMessage"];
        
    }
    
    else
    {
        
        messagetosend = "URGENT! I may be in danger and need your help. Please call me back immidiately. This is not a test.";
        
        
    }
    
        
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

function sendsafemessage(e)
{
    
   var messagetosend ;
   var modetouse=false;
    if(localStorage.ModeOfUse)
    {
        
        var rd = localStorage["ModeOfUse"];       
        modetouse = rd.toLowerCase()=="true"?1:0;
       
    }
    
  //  else
  //  {
  //     modetouse = $("#modeswitch").data("kendoMobileSwitch").check();
  //  }
    
     if(modetouse)
    {
        messagetosend = "I am Testing the Safety Application. Please ignore this message.";
       
    }
    else
    {
          if (localStorage.SafeMessage)
    {
       
       
         messagetosend = localStorage["SafeMessage"];
        
       
    }
    
    else
    {
        
        messagetosend = "I feel safe now";
        
    }
        
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
    
    if($("#numberinputbox").val().trim().length === 0 )
    {
        
        $("#enterphonenumbererror").text("Please enter a valid phone number.");
    }
    else
    {
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
     
    
    
   
    
}

function showfriends(e)
{
   
       $("#enterphonenumbererror").text("");
	
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

 
function savesetting()
{
    
    var dangermessagetosend = document.getElementById('dangermessagetext').value;
    var  safemessagetosend =  document.getElementById('safemessagetext').value;   
    var  nameofuser =  document.getElementById('nametxt').value;
    var  phonenumberofuser =  document.getElementById('phonenumbertxt').value;
    var  emailofuser =  document.getElementById('emailtxt').value;
    var trackingduration = document.getElementById('trackingdurationtxt').value;
    var trackinginterval = document.getElementById('trackinginervaltxt').value;
    var modeofuse =  $("#modeswitch").data("kendoMobileSwitch").check(); 
    var tracklocation = $("#trackmelocationswitch").data("kendoMobileSwitch").check();   
    localStorage["DangerMessage"]= dangermessagetosend;
    localStorage["SafeMessage"]= safemessagetosend;
    localStorage["NameOfUser"]= nameofuser;
    localStorage["PhoneNumberOfUser"]= phonenumberofuser;
    localStorage["EmailOfUser"]= emailofuser;
    localStorage["TrackingDuration"]= trackingduration;
    localStorage["TrackingInterval"]= trackinginterval;
    localStorage["ModeOfUse"]= modeofuse;
    localStorage["TrackMeValue"]= tracklocation;
         
    
}
function submitreport()
{
    alert("Coming Soon ");
}

function initsetting()
{
    
    document.getElementById('safemessagetext').value = "Hey I am Safe ! Don't worry " ;
    document.getElementById('dangermessagetext').value = "I am in danger , Please help me ";
    document.getElementById('nametxt').value = "Anonymous " ;
    document.getElementById('phonenumbertxt').value = "9999999999";
    document.getElementById('emailtxt').value = "user@xyz.com";
    document.getElementById('trackinginervaltxt').value = 60;
    document.getElementById('trackingdurationtxt').value = 10;
    
    if(localStorage.DangerMessage)
    {
         document.getElementById('safemessagetext').value =localStorage["DangerMessage"];
    }
     if(localStorage.SafeMessage)
    {
         document.getElementById('dangermessagetext').value =localStorage["SafeMessage"];
    }
     if(localStorage.NameOfUser)
    {
         document.getElementById('nametxt').value =localStorage["NameOfUser"];
    }
     if(localStorage.PhoneNumberOfUser)
    {
         document.getElementById('phonenumbertxt').value =localStorage["PhoneNumberOfUser"];
    } 
     if(localStorage.EmailOfUser)
    {
         document.getElementById('emailtxt').value =localStorage["EmailOfUser"];
    }    
    if(localStorage.ModeOfUse)
    {
        
        var rd = localStorage["ModeOfUse"];       
        var vrd = rd.toLowerCase()=="true"?1:0;
        $("#modeswitch").data("kendoMobileSwitch").check(vrd);
    }
     if(localStorage.TrackMeValue)
    {
     
        var rd1 = localStorage["TrackMeValue"];
       var vrd1 = rd1.toLowerCase()=="true"?1:0;
        $("#trackmelocationswitch").data("kendoMobileSwitch").check(vrd1);
    }
   
     if(localStorage.TrackingInterval)
    {
         document.getElementById('trackinginervaltxt').value =localStorage["TrackingInterval"];
    }  
    
     if(localStorage.TrackingDuration)
    {
         document.getElementById('trackingdurationtxt').value =localStorage["TrackingDuration"];
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

function initreport(e)
{
   $('#showreport').attr("disabled","");
    var reportscount=[];
    $('#timebox').text(datetime); 
    $('#locationbox').text(currentlocation);
     if (localStorage.reportstorage)
    {
       
        reportscount = JSON.parse(localStorage["reportstorage"]);
        
       
    }
    if(reportscount.length>0)
    {
        console.log(reportscount.length);
        $('#showreport').show();
        $('#showreport').text("Show " + reportscount.length + "  Pending Reports");
    }
    else
    {
        console.log("No Reports saved");
        $('#showreport').hide();
    }
    
}
function showsavedreport(e)
{
    console.log("show report");
     if (localStorage.reportstorage)
    {
       
        
        
        reportscount = JSON.parse(localStorage["reportstorage"]);
        
        var reportsdata = new kendo.data.DataSource.create({data: reportscount});
		var template1 = kendo.template($("#savedreporttemplate").text());
		$("#savedreportlistview").kendoMobileListView({
			dataSource: reportsdata,
			template:template1,
			style:"inset",
			endlessScroll: true
   
		});
        
       app.navigate("#savedreportshowview");
    }
    
}

function GetPoliceStationSearchedResultView()
{
    $("#modal-search").kendoMobileModalView("close");
    app.navigate("#policestationview");
}

function closeModalViewGroup() {
	
	$("#modal-search").kendoMobileModalView("close");
}


//Reference http://www.jasolavihar.com/emergency-phone-numbers/delhi-ncr-important-police-station-phone-numbers.html 
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
                                    {name :"Trilokpuri", phonenumber:"01122253317", group :"EAST"},
                                    {name :"Vivek Vihar", phonenumber:"01122150370", group :"EAST"},
                                    {name :"Preet Vihar", phonenumber:"01122210291", group :"EAST"},
                                    {name :"Shaker Pur", phonenumber:"01122242441", group :"EAST"},
                                    {name :"Gandhi Nagar", phonenumber:"01122212761", group :"EAST"},
                                    {name :"Krishna Nagar", phonenumber:"01122213224", group :"EAST"},
                                    {name :"Geeta Colony", phonenumber:"01122208164", group :"EAST"},
                                    {name :"Sansad Marg", phonenumber:"01123361100", group :"NEW DELHI"},
                                    {name :"Tughlak Road", phonenumber:"01123014878", group :"NEW DELHI"},
{name :"Tilak Marg", phonenumber:"01123382100", group :"NEW DELHI"},
{name :"Anand Parbat", phonenumber:"01125734807", group :"WEST"},
{name :"Patel Nagar", phonenumber:"01125742637", group :"WEST"},
{name :"Moti Nagar", phonenumber:"01125938880", group :"WEST"},
{name :"Tilak Nagar", phonenumber:"01125409290", group :"WEST"},
{name :"Janakpuri", phonenumber:"01125553166", group :"WEST"},
{name :"Vikaspuri", phonenumber:"01125592600", group :"WEST"},
{name :"Punjabi Bagh", phonenumber:"01125435616", group :"WEST"},
{name :"Paschim Vihar", phonenumber:"01125583471", group :"WEST"},
{name :"Nangloi", phonenumber:"01125471470", group :"WEST"},
{name :"Rajouri Garden", phonenumber:"01125448885", group :"WEST"},
{name :"Hari Nagar", phonenumber:"01125408782", group :"WEST"},
{name :"Kirti Nagar", phonenumber:"01125190462", group :"WEST"},
{name :"Paschim Vihar", phonenumber:"01125583471", group :"WEST"},
{name :"Vasant Vihar", phonenumber:"01126152577", group :"SOUTH WEST"},
{name :"Sarojini Nagar", phonenumber:"01126882346", group :"SOUTH WEST"},
{name :"R.K. Puram", phonenumber:"01126185222", group :"SOUTH WEST"},
{name :"Vasant Kunj", phonenumber:"01126892530", group :"SOUTH WEST"},
{name :"Naraina", phonenumber:"01125792021", group :"SOUTH WEST"},
{name :"Mayapuri", phonenumber:"01125140644", group :"SOUTH WEST"},
{name :"Inder Puri", phonenumber:"01125781476", group :"SOUTH WEST"},
{name :"Najafgarh", phonenumber:"01125537372", group :"SOUTH WEST"},
{name :"Jafferpur", phonenumber:"01125016827", group :"SOUTH WEST"},
{name :"Dabri", phonenumber:"01125555178", group :"SOUTH WEST"},
{name :"Delhi Cantt", phonenumber:"01125693161", group :"SOUTH WEST"},
{name :"Kotla Mubarak Pur", phonenumber:"01124624825", group :"SOUTH"},
{name :"Lajpat Nagar", phonenumber:"01126912456", group :"SOUTH"},
{name :"Sri Nivas Puri", phonenumber:"01126830750", group :"SOUTH"},
{name :"Greater Kailash", phonenumber:"01126415815", group :"SOUTH"},
{name :"Chitranjan Park", phonenumber:"01126461587", group :"SOUTH"},
{name :"Ahmed Nagar", phonenumber:"01126980917", group :"SOUTH"},
{name :"Kalkaji", phonenumber:"01126439165", group :"SOUTH"},
{name :"Badarpur", phonenumber:"01126944753", group :"SOUTH"},
{name :"Okhla Industrial Area", phonenumber:"01126818572", group :"SOUTH"},
{name :"Mehrauli", phonenumber:"01126863200", group :"SOUTH"},
{name :"Hauz Khas", phonenumber:"01126867878", group :"SOUTH"},
{name :"Malviya Nagar", phonenumber:"01126461062", group :"SOUTH"},
{name :"Defence Colony", phonenumber:"01126253601", group :"SOUTH"},
{name :"Lodhi Colony", phonenumber:"01124620283", group :"SOUTH"},
{name :"Civil Lines", phonenumber:"01122930633", group :"NORTH"},
{name :"Timarpur", phonenumber:"01122914421", group :"NORTH"},
{name :"Roop Nagar", phonenumber:"01122914632", group :"NORTH"},
{name :"Mourice Nagar", phonenumber:"01127257418", group :"NORTH"},
{name :"Subzi Mundi", phonenumber:"01122913161", group :"NORTH"},
{name :"Partap Nagar", phonenumber:"01127510100", group :"NORTH"},
{name :"Sarai Rohila", phonenumber:"01127773611", group :"NORTH"},
{name :"Bara Hindu Rao", phonenumber:"01123529707", group :"NORTH"},
{name :"Kashmiri Gate", phonenumber:"01123968730", group :"NORTH"},
{name :"Kotwali", phonenumber:"01123277918", group :"NORTH"},
{name :"Lahori Gate", phonenumber:"01123958234", group :"NORTH"},
{name :"Chandni Chowk", phonenumber:"01123953442", group :"NORTH"},
{name :"Kashmiri Gate", phonenumber:"01123968730", group :"NORTH"},
{name :"Sector 29", phonenumber:"01242396700", group :"GURGAON"},
{name :"Sushant Lok", phonenumber:"01242386231", group :"GURGAON"},
{name :"DLF PH-1", phonenumber:"01244059084", group :"GURGAON"},
{name :"DLF PH-2", phonenumber:"01242566387", group :"GURGAON"},
{name :"Sector 56", phonenumber:"01242578101 ", group :"GURGAON"},
{name :"Sector 40", phonenumber:"01242381567 ", group :"GURGAON"},                                   
{name :"Sadar", phonenumber:"01242201476", group :"GURGAON"},  
{name :"Sector 5", phonenumber:"01242254610 ", group :"GURGAON"},  
{name :"Palam Vihar", phonenumber:"01242360148", group :"GURGAON"}, 
{name :"Rajendra Park", phonenumber:"01242469210", group :"GURGAON"}, 
{name :"Udyog Vihar", phonenumber:"01242345054", group :"GURGAON"}, 
{name :"Sector 17/18", phonenumber:"01242398140", group :"GURGAON"}, 
{name :"Sector 10A", phonenumber:"01242370490", group :"GURGAON"}, 
{name :"Civil Lines", phonenumber:"01242224233", group :"GURGAON"}, 
{name :"Bilaspur", phonenumber:"01242379580", group :"GURGAON"}, 
{name :"Manesar", phonenumber:"01242290100", group :"GURGAON"},
{name :"Badshapur", phonenumber:"01242394062", group :"GURGAON"},
{name :"Bhondsi", phonenumber:"01242267100", group :"GURGAON"},
{name :"Sohna", phonenumber:"01242362225", group :"GURGAON"},
{name :"Farukh Nagar", phonenumber:"01242375228", group :"GURGAON"},
{name :"Pataudi", phonenumber:"01242672970", group :"GURGAON"},
{name :"Sector 20", phonenumber:"01202523102", group :"NOIDA"},
{name :"Sector 24", phonenumber:"01202411173", group :"NOIDA"},
{name :"Sector 39", phonenumber:"01202577100", group :"NOIDA"},
{name :"Sector 49", phonenumber:"01202573665", group :"NOIDA"},
{name :"Sector 58", phonenumber:"01202580412", group :"NOIDA"},

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
