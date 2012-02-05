class ConfigurationView extends TwoPaneView {
  
  //listbox
  ListBox listBox;
  
  //form elements
  TextBox email;
  TextBox nickname;
  TextBox fullname;
  ButtonElement applyButton;
  User _selectedUser;
  
  final FORM_EDIT = 1;
  final FORM_ADD = 2;
  int _formMode;
  
  
  ConfigurationView(pageNavigation, pageContent) : super(pageNavigation, pageContent, "createIssue") {}
  
  
  buildNavigation() {
    
  }
  
  buildContent() {
    print("buildContent");
    
    DataList userStore = User.getStore();
    print("creating listbox");
    listBox = new ListBox.divWrapped("Users", "userlist");
    listBox.bind(userStore);
    listBox.addToElement(content);
    listBox._listbox.on.select.add((event) {
      _populateForm();  
    });
    
    _formMode = FORM_ADD;
    email = new TextBox.divWrapped("Email", "eg: bob@bob.com", "email");
    print("email: ${email==null}");
    email.addToElement(content);
    nickname = new TextBox.divWrapped("Nickname", "eg: bob", "nick");
    nickname.addToElement(content);
    fullname = new TextBox.divWrapped("Full Name", "eg: Bob Smith", "full");
    fullname.addToElement(content);
    applyButton = new Element.tag("button");
    applyButton.value = "Add";
    applyButton.on.click.add(_onApply);
    content.nodes.add(applyButton);
    
    
    print("buildContent finished");
  }
  
  _populateForm() {
    //get the item that is selected
    //and display it in the form.
    
    //todo: move the "find" into the data layer
    var option = listBox._listbox.options[listBox._listbox.selectedIndex];
    for (User u in User.getStore()._items) {
      if (u.id == option.value) {
        _selectedUser = u;
      }
    }
    
    email.value = _selectedUser.email;
    nickname.value = _selectedUser.nick;
    fullname.value = _selectedUser.fullName;
    
    applyButton.value = "Update";
    _formMode == FORM_EDIT;
  }
  
  _clearForm() {
    applyButton.value = "Add";
    email.value = "";
    nickname.value = "";
    fullname.value = "";
    _formMode == FORM_ADD;
  }
  
  
  _onApply(event) {
    if (_formMode == FORM_ADD) {
      print("add");
      User user = new User();
      print("email: ${email==null}");
      user.email = email.value;
      user.fullName = fullname.value;
      user.nick = nickname.value;  
      DataList datastore = User.getStore();
      datastore.addItem(user);
    }
    else if (_formMode == FORM_EDIT) {
      _selectedUser.email = email.value;
      _selectedUser.fullName = fullname.value;
      _selectedUser.nick = nickname.value;
      DataList datastore = User.getStore();
      datastore.updateItem(_selectedUser);
     
    }
    
    _clearForm();
    
  }
  
 
 
}
