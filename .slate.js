var focusTerminal = slate.operation("focus", { "app" : "iTerm" });
var focusBrowser = slate.operation("focus", {"app" : "Google Chrome"});

var lastFocusedApp = "";

// Toggle between iTerm and the last used app
slate.bind("1:ctrl;cmd", function(windowObject) {
  var currentAppName = windowObject.app().name();
  if (currentAppName !== "iTerm") {
    lastFocusedApp = currentAppName; // store the app name in lastFocusedApp if it is not MacVim
    focusTerminal.run(); // focus iTerm
  } else {
    // If the current app is iTerm, focus the lastFocusedApp
    slate.operation("focus", { "app" : lastFocusedApp }).run();
  }
});

// Toggle between iTerm and Chrome
slate.bind("2:ctrl;cmd", function(windowObject) {
  var currentAppName = windowObject.app().name();
  if (currentAppName !== "iTerm") {
    focusTerminal.run(); // focus iTerm
  } else {
    focusBrowser.run(); // focus Chrome
  }
});
