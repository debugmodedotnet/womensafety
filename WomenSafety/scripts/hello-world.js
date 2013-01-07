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
         
            
            
       //  window.location.href = "sms:" + numberstosend + "?body=" + messagetosend + "    I am at   "  + currentlocation;
            alert("hi");
            window.plugins.sms.send("09899115375",messagetosend,function
            () { 
       alert('Message sent successfully');  
    },
    function (e) {
        alert('Message Failed:' + e);
    });
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
