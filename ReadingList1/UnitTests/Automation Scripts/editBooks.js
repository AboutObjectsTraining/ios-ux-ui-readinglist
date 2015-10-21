
var target = UIATarget.localTarget();

target.frontMostApp().mainWindow().tableViews()[0].cells()[0].tap();

target.captureScreenWithName("Initial Reading List");

target.delay(.5)

UIALogger.logMessage("In Edit Book");
target.captureScreenWithName("Edit Book");

target.frontMostApp().navigationBar().buttons()["Edit"].tap();

target.delay(.5)

UIALogger.logMessage("Editing Book info");
target.captureScreenWithName("Edit Book in Edit mode");

target.frontMostApp().keyboard().keys()["Delete"].tapWithOptions({tapCount:6});
target.frontMostApp().keyboard().typeString("Doings");
target.frontMostApp().mainWindow().tableViews()["Empty list"].cells()["Year"].textFields()[0].tap();
target.frontMostApp().keyboard().keys()["Delete"].tap();
target.frontMostApp().keyboard().keys()["Delete"].doubleTap();
target.frontMostApp().keyboard().keys()["Delete"].tap();
target.frontMostApp().keyboard().typeString("2000");

// Hit the Done button
target.frontMostApp().navigationBar().buttons()["Done"].tap();
