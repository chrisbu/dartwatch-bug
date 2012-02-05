#library("ui.view");

#import("dart:html");
#import("../../lib/view/view.lib.dart");
#import("../../lib/widget/widget.lib.dart");
#import("../../data/data.lib.dart");

#source("createIssue.view.dart");
#source("configuration.view.dart");

#resource("view.ui.css");

/**
* Need to add a class just so that I can namespace the getStyleSheet() function.
*/
class ViewLib {
  static getStylesheet() {
    LinkElement styleSheet = new Element.tag("link");
    styleSheet.rel = "stylesheet";
    styleSheet.type="text/css";
    styleSheet.href="ui/view/view.ui.css";
    return styleSheet;
  }
}