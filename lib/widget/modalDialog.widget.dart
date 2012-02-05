class ModalDialog {
  final DivElement _content;
  final DivElement _blackOverlay;
  final ButtonElement _button;
  
  
  ModalDialog(String message) :
    _content = new Element.tag("div"),
    _blackOverlay = new Element.tag("div"),
    _button = new Element.tag("button")
  {
    _content.id = "modalContent";
    _content.classes.add("white_content");
    _blackOverlay.id = "modalOverlay";
    _blackOverlay.classes.add("black_overlay");
    
    
    SpanElement span = new Element.tag("span");
    span.innerHTML = message;
    _content.nodes.add(span);
    _button.text = "Ok";
    _button.on.click.add((event) {
      hide();
    });
      
    _content.nodes.add(_button);
  }
  
  hide() {
    
    //find the element and remove it.
    //there is no list.remove(x) statement at present, so we have to
    //do it manually.
    removeFromList(_content, document.body.nodes);
    removeFromList(_blackOverlay, document.body.nodes);
  }
  
  show() {
    document.body.nodes.add(_content);
    document.body.nodes.add(_blackOverlay);
  }
  
  
  
  

}
 


