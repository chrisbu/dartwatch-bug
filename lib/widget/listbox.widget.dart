class ListBox {
  final Element _wrapper;
  final SelectElement _listbox;
  final LabelElement _label;
  final String _rootId;
  final String _labelText;
  
  ListBox(String this._labelText, String this._rootId) : 
    _listbox = new Element.tag("select"),
    _label = new Element.tag("label"),
    _wrapper = null
  {
    _setupElements();
  }
  
  ListBox.divWrapped(String this._labelText, String this._rootId) :
    _listbox = new Element.tag("select"),
    _label = new Element.tag("label"),
    _wrapper = new Element.tag("div")
  {
     _wrapper.id = "listbox_wrapper" + _rootId;
     _wrapper.classes.add("listboxwrapper");
     _setupElements();
     
  }
  
  _setupElements() {
    _listbox.multiple = true;
    _listbox.size = 5;
    _listbox.style.width = "100px";
    _label.text = _labelText;
    _listbox.id = "lst_" + _rootId;
    _listbox.classes.add("listboxinput");
    _label.htmlFor = "lst_" + _rootId;
    _label.classes.add("listboxlabel");
  }
  
  addToElement(var element) {
    if (_wrapper != null) {
      _wrapper.nodes.add(_label);
      _wrapper.nodes.add(_listbox);
      element.nodes.add(_wrapper);
    }
    else {
      element.nodes.add(_label);
      element.nodes.add(_listbox);
    }
  }

  bind(DataList items) {
    items.onChange.add(() {
      print("listbox.items.onChange handler");
      //anonymous method that will be called when the list changes
      //quick and dirty - just clear the existing list of items, and re-add them all.
      //todo: a better implementation that would react to adding and removing items
      //rather than just changing
      print("clearing listbox of existing items");
      //_listbox.options.clear();
      

        
      for (var item in items.items) {
        print("adding item");
        OptionElement option = new Element.tag("option");
        var getItemTitleFunction = items.itemFunctions["title"];
        option.text = getItemTitleFunction(item);
        option.value = items.itemFunctions["value"](item); //same as the previous but without the temp var.
        _listbox.add(option, null);
      }
      
    });

    
  }
  
  
  
  
}
