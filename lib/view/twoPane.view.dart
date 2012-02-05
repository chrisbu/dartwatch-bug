/**
*  Base class to allow for adding a two panel view to the UI.
*  It makes the assumption that the UI has a left hand nav panel, 
* and a main content panel
*/
class TwoPaneView {
  final DivElement _navigation;
  final DivElement _content;
  final String _className;
  
  final pageNavigationArea;
  final pageContentArea;
  
  DivElement get content() => _content;
  
  /**
  *  For styling, use the className + Nav or className + Content
  *  eg: 
       "myViewNav"
       "myViewContent"
  */
  TwoPaneView(this.pageNavigationArea, this.pageContentArea, String this._className) :
    _navigation = new Element.tag("div"),
    _content = new Element.tag("div")
  {
    _addClassNames();
    buildNavigation(); //call to abstract method
    buildContent();  //call to abstract method
    
  }
  
  _addClassNames() {
    _navigation.classes.add(this._className + "Nav");
    _content.classes.add(this._className + "Content");
  }
  
  /**
   *  Clears the content and navigation area from other nodes, and adds the
   *  content from this pane to the area.
   */
   show() {
     pageNavigationArea.nodes.clear();
     pageNavigationArea.nodes.add(_navigation);
     
     pageContentArea.nodes.clear();
     pageContentArea.nodes.add(_content);
   }
   
   
   hide() {
     pageNavigationArea.nodes.clear();
     pageContentArea.nodes.clear();
   }
  
   abstract buildNavigation();
   
   abstract buildContent();
  
}
