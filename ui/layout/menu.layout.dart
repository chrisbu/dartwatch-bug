/**
* The menuLayout itself.
* Requires a list of actions.
*/
class MenuLayout {
  final DivElement _menu;
  final List<_MenuAction> _actions;
  MenuLayout() :
     _menu = new Element.tag("div"),
     _actions = new List<_MenuAction>()
  {
    _menu.id = "menu";
   
  }
  
  add(String title, var callback) {
    _MenuAction action = new _MenuAction(title, callback); 
    _actions.add(action);
    _menu.nodes.add(action.menuItem);
  }
  
  show(Element addToElement) {
    addToElement.nodes.add(_menu);
  }
  
     
}

class _MenuAction {
  final _name;
  final _func;
  var _menuItem;
  get menuItem() => _menuItem;
  
  _MenuAction(this._name, this._func) {
    _menuItem = new Element.tag("button");
    _menuItem.text = this._name;
    _menuItem.on.click.add((event) {
      this._func();
    });
  }
}