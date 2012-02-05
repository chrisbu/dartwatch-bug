class User {
	
	var nick;
	var email;
	var fullName;
	var id;
	
	User() {
	  id = _dataList._items.length + 1;
	}

  static DataList _dataList;

  static DataList getStore() {
    print("in getstore");
  	if (_dataList == null) {
  		_dataList = new DataList();
  	}

  	print("adding to map");
  	_dataList.itemFunctions["text"] = _getText;
  	_dataList.itemFunctions["value"] =_getValue;
  	print("adding to map - done");

  	return _dataList;
  	
  }
}



/**
* helper function for binding to a listbox
*/
_getText(User user) {
  return user.nick;
}

/**
* helper function for binding to a listbox
*/
_getValue(User user) {
  return user.id;
}