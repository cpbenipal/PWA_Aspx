var curDate = new Date();
function GetClientoffset() {                                                        
    document.getElementById("hdnlocaltimezone").value = curDate.getTimezoneOffset();
}
function GetClientDateTime() {             
    document.getElementById("hdnclientdatetime").value = curDate.toISOString();
}

