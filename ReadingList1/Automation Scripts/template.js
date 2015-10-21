// Common variables and functions
var target = UIATarget.localTarget();
var window = target.frontMostApp().mainWindow();
var app = UIATarget.localTarget().frontMostApp();

function logMessage(message){UIALogger.logMessage(message);}
function logDebug(message)  {UIALogger.logDebug(message);}
function logStart(testName) {UIALogger.logStart(testName);}
function logPass(testName)  {UIALogger.logPass(testName);}
function logFail(testName)  {UIALogger.logFail(testName);}
function delay(seconds)	   {target.delay(seconds);}

// Put custom variables and functions here

// Test
function myTestName() {
    var testName = "My Test Name";
    logStart(testName);
    try {
        target.captureScreenWithName("screen name");
        logMessage("1. First Step.");
        
        // add steps here
        
        target.captureScreenWithName("Reading List");
        logPass(testName);
    }
    catch(exception) {
        logMessage("TEST FAILED - " + exception);
        logMessage("Logging Element Tree");
        app.logElementTree();
        logFail(testName);
    }
}

// Test Control: loops, data sets, etc.
myTestName();
