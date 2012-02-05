#library("lib.widget");

#import("dart:html");

#import("../../data/data.lib.dart");
#import("../../lib/utils/utils.lib.dart");


#source("textbox.widget.dart");
#source("listbox.widget.dart");
//#source("dropdown.widget.dart");
//#source("textarea.widget.dart");
#source("modalDialog.widget.dart");

#resource("widget.lib.css");


/**
* Need to add a class just so that I can namespace the getStyleSheet() function.
*/
class WidgetLib {
  static getStylesheet() {
    LinkElement styleSheet = new Element.tag("link");
    styleSheet.rel = "stylesheet";
    styleSheet.type="text/css";
    styleSheet.href="lib/widget/widget.lib.css";
    return styleSheet;
  }
}