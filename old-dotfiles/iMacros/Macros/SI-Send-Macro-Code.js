var macro;
var jsLF = "\n";
var i, retcode, errtext;
var MyDelay;
var MyPosts;

/* Send code example */
macro = "CODE:";
macro += "URL GOTO=http://www.iopus.com" + jsLF;
macro += "URL GOTO=http://forum.iopus.com";
iimDisplay("Send Macro via iimPlay");
retcode = iimPlay(macro);

if (retcode < 0) {              // an error has occured
    errtext = iimGetLastError();
    alert(errtext);
}



/* How to do looping */
iimDisplay("Loops");

for ( i = 1; i <= 2; i++) {
    iimDisplay("loop "+i);
    retcode = iimPlay("CODE:URL GOTO=http://forum.iopus.com/viewtopic.php?t="+i*10);
    if (retcode < 0) {          // an error has occured
        errtext = iimGetLastError();
        alert(errtext);
        break;
    }

}


/* Generate a random wait time */

/* Generate a number between 1 and 10 */
MyDelay = Math.round(10*Math.random());
iimDisplay("Random wait t="+MyDelay);

macro = "CODE:";
macro += "URL GOTO=http://wiki.imacros.net" + jsLF;
macro += "WAIT SECONDS=" + MyDelay + jsLF;
macro += "URL GOTO=http://wiki.imacros.net/iMacros_for_Firefox";

retcode = iimPlay(macro);
if (retcode < 0) {              // an error has occured
    errtext = iimGetLastError();
    alert(errtext);
}


/*How to use array and iimSet*/

MyPosts = new Array();
MyPosts.push("307");
MyPosts.push("2615");
MyPosts.push("1147");
MyPosts.push("3201");
MyPosts.push("3360");

iimDisplay("Array/iimSet Demo");

for (i = 0; i < MyPosts.length; i++) {
    iimSet("POSTID", MyPosts[i]);
    retcode = iimPlay("CODE:URL GOTO=http://forum.iopus.com/viewtopic.php?f=11&t={{postid}}\n");
    if (retcode < 0) {              // an error has occured
        errtext = iimGetLastError();
        alert(errtext);
        break;
    }
}

iimDisplay("Script completed.");
