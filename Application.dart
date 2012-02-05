class BugfixApp {
  final MainLayout _layout;
  
  BugfixApp(var attachTo) :
    _layout = new MainLayout(attachTo)
  {
    
  }
  
  
  run() {
    //add the stylesheets
    document.head.nodes.add(MainLayout.getStylesheet());
    document.head.nodes.add(WidgetLib.getStylesheet());
    document.head.nodes.add(ViewLib.getStylesheet());
    
    //create actions to bind to the menu
    MenuLayout menu = new MenuLayout();
    menu.add("About", doAboutBox);
    menu.add("Administration", doConfiguration);
    menu.add("New Issue", doNewIssue);
    menu.show(_layout.header);
    
    
    //add the nav bar to the left
   // NavigationLayout nav = new NavigationLayout(layout.left);
     
    
    //add copyright to the footer
   // FooterLayout footer = new FooterLayout(layout.footer);
    
    //add the content grid to the right
   // ContentLayout content = new ContentLayout(layout.right);
      
  }
  
  
  doAboutBox() {
    var dialog = new ModalDialog("About Box");
    dialog.show();
    
  }
  
  doConfiguration() {
   ConfigurationView view = new ConfigurationView(_layout.left, _layout.right);
   view.show();
  }
  
  doNewIssue() {
    CreateIssueView view = new CreateIssueView(_layout.left, _layout.right);
    view.show();
  }

}
