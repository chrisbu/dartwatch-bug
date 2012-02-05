


class ActionList {
  List<_Action> actionList; 
  
  ActionList() {
    actionList = new List<_Action>();   
  }
  
  add(String name, var callback) {
    actionList.add(new _Action(name, callback));
  }
  
}

class _Action {
  var name;
  var func;
  
  _Action(name, func) {
    this.name = name;
    this.func = func;
  }
}