class TextBox {
  final Element _wrapper;
  final InputElement _textbox;
  final LabelElement _label;
  final String _rootId;
  final String _labelText;
  final String _placeholderText;
  
  get value() => _textbox.value;
  set value(value) => _textbox.value = value;
  
  TextBox(String this._labelText, String this._placeholderText, String this._rootId) : 
    _textbox = new Element.tag("input"),
    _label = new Element.tag("label"),
    _wrapper = null
  {
    _setupElements();
  }
  
  TextBox.divWrapped(String this._labelText, String this._placeholderText, String this._rootId) :
    _textbox = new Element.tag("input"),
    _label = new Element.tag("label"),
    _wrapper = new Element.tag("div")
  {
     _wrapper.id = "textbox_wrapper" + _rootId;
     _wrapper.classes.add("txtboxwrapper");
     _setupElements();
     
  }
  
  _setupElements() {
    _label.text = _labelText;
    _textbox.placeholder = _placeholderText;
    _textbox.id = "txt_" + _rootId;
    _textbox.classes.add("txtboxinput");
    _label.htmlFor = "txt_" + _rootId;
    _label.classes.add("txtboxlabel");
  }
  
  addToElement(var element) {
    if (_wrapper != null) {
      _wrapper.nodes.add(_label);
      _wrapper.nodes.add(_textbox);
      element.nodes.add(_wrapper);
    }
    else {
      element.nodes.add(_label);
      element.nodes.add(_textbox);
    }
  }
  
  
  
  
}
