#library("bugfix");

//dart libraries
#import('dart:html');

//generic library components
#import("lib/view/view.lib.dart");
#import("lib/widget/widget.lib.dart");
#import("data/data.lib.dart");

//service stuff
#import("service/service.dart");

//ui components
#import("ui/layout/layout.ui.dart");
#import("ui/view/view.ui.dart");

//applicaton source files
#source('Application.dart');

void main() {
  BugfixApp app = new BugfixApp(document.body);
  app.run();
}

