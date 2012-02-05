
/**
*   A class to define the main layout which looks like this:
     | HEADER            |
     |-------------------|
     | LEFT  |    RIGHT  |
     |       |           |
     |-------------------|
     | FOOTER            |
  
*/
class MainLayout {
  final DivElement _page;
  final DivElement _header;
  final DivElement _center;
  final DivElement _left;
  final DivElement _right;
  final DivElement _footer;
  
  /** Constructor which creates all the various divs and hooks them together
  * Adds the page to the {addToElement} parameter 
  */
  MainLayout(Element addToElement) :
    _page = new Element.tag("div"),
    _header = new Element.tag("header"),
    _center = new Element.tag("div"),
    _left = new Element.tag("div"),
    _right = new Element.tag("div"),    
    _footer = new Element.tag("footer") 
  {
    _page.id = "page";
    _center.id = "center";
    _left.id = "left";
    _right.id = "right";
    
    _page.nodes.add(_header);
    _page.nodes.add(_center);
    _page.nodes.add(_footer);
    _center.nodes.add(_left);
    _center.nodes.add(_right);
    
    
    
    addToElement.nodes.add(_page);
    
    
  }
  
  DivElement get header() => _header;
  DivElement get left() => _left;
  DivElement get right() => _right;
  DivElement get footer() => _footer;
  
  static getStylesheet() {
    LinkElement styleSheet = new Element.tag("link");
    styleSheet.rel = "stylesheet";
    styleSheet.type="text/css";
    styleSheet.href="ui/layout/main.layout.css";
    return styleSheet;
    
  }
  
  
}





