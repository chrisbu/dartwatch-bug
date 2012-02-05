#library("lib.data");

#import("../lib/utils/utils.lib.dart");

#source("models/user.dart");

//todo: make this use generics.
class DataList {
	final List _items;
	List get items() => _items;

	final List _onChangeEvents;
	List get onChange() => _onChangeEvents;

    //Map of item functions, that can be called dynamically and can be used against whatever
    //item is in the list.
	final Map _itemFunctions;
	Map get itemFunctions() => _itemFunctions;

	DataList() :  
		_items = new List(),
		_onChangeEvents = new List(),
		_itemFunctions = new Map() 
	{
		
	}


	add(var item) {
		_items.add(item);
		_fireOnChangeEvents();
	}

	remove(var item) {
		removeFromList(item, _items);
    _fireOnChangeEvents();
	}
	
	update(var item) {
	  //todo: actually update the item.
	  //for the moment, this just works because we already have a direct
	  //reference to the item in the list.
	  _fireOnChangeEvents();
	}

    /**
    *  iterate through the list of event handlers, and fire each one in turn
    */
	_fireOnChangeEvents() {
		for(var eventHandler in _onChangeEvents) {
		    //todo: add try/catch - this is risky!
			eventHandler();
		}
	}




}



