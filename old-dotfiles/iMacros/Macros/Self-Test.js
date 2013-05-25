/* This script runs all demo macros and displays the success or failure of each run */
/* Created by: iMacros Team, March 18th, 2008 */

var i, retcode;
var report;
var macrolist = new Array();

/* Standard Demo Macros  */
macrolist.push("Demo-FillForm");
macrolist.push("Demo-Frame");
macrolist.push("Demo-Filter");
macrolist.push("Demo-Tabs");
macrolist.push("Demo-Javascript-Dialogs");
macrolist.push("Demo-SlideShow");
macrolist.push("Demo-TagPosition");
/* Macros that save something and/or create logs  */
macrolist.push("Demo-Download");
macrolist.push("Demo-SaveAs");
macrolist.push("Demo-SavePDF");
/* Macros that create reports */
macrolist.push("Demo-Stopwatch");
/* Macros that extract information */
macrolist.push("Demo-ExtractAndFill");
macrolist.push("Demo-Extract");
macrolist.push("Demo-ExtractURL");
macrolist.push("Demo-ExtractRelative");



iimDisplay("Start Self Test");

report  =  "Self-Test Report\n\n";

for (i = 0; i < macrolist.length; i++) {
    iimDisplay("Step "+(i+1)+" of "+macrolist.length + "\nMacro: "+macrolist[i]);
    retcode = iimPlay(macrolist[i]);
    report += macrolist[i];
    if (retcode < 0) {
        report += ": "+iimGetLastError();
    } else {
        report += ": OK";
        /* display the FIRST extracted item in report*/
        s = iimGetLastExtract(1);
        if ( s != "" )  report += ", Extract: "+s;
    }
    report += "\n";
}
iimDisplay("Test complete");

alert ( report );


