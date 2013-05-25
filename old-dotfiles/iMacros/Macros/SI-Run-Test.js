//imacros-js:showsteps no

// With the imacros-js:showsteps command you can tell iMacros to show or
// not show the Javascript commands during the execution. 
// Showing steps is useful for debugging, but adds an artificial delay to each step.

// This command overrides the global settings in the Option Dialog.

// Note that the command is *inside* a comment "//", since it is no
// official Javascript command and is used in the iMacros JS interpreter only.

// There can be only one such command per JS file and it affects the complete file.

var i, s;

iimDisplay ("Test script running");
iimSet ("NAME", "T. Test");
iimSet ("MENU", "Pizza");
iimSet ("DRINK", "water");
iimSet ("DESSERT", "Fruits");
iimSet ("IS_CUSTOMER", "Yes");
iimSet ("PASSWORD", "abcabc");
iimSet ("REMARKS", "Form filled");
iimSet ("WAIT", "3");

i = iimPlay("SI-Test-Macro1",60);

/* Check for error */
if (i < 0) {
    s = iimGetLastError();
    alert (s);
};

/* Submission completed, now check if the result page is ok */
/* We do this by checking if the ordered menu is indeed "Pizza"  */

iimDisplay ("Verify form output");
i = iimPlay("SI-Test-Macro2",60);

if (i < 0) {
    s = iimGetLastError();
    alert (s);
};

s = iimGetLastExtract();

if (s.indexOf ("Pizza") != -1)
    iimDisplay ("Test OK");
else
    iimDisplay ("Problem detected :"+s);
