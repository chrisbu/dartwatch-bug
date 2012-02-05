class CreateIssueView extends TwoPaneView {

  CreateIssueView(pageNavigation, pageContent) : super(pageNavigation, pageContent, "createIssue") {}
  
  
  buildNavigation() {
    
  }
  
  buildContent() {
    print("buildContent");
    TextBox title = new TextBox.divWrapped("Enter a title", "Title", "title");
    title.addToElement(_content);
    TextBox raisedBy = new TextBox.divWrapped("Enter your name", "Name", "name");
    raisedBy.addToElement(_content);
    TextBox assignTo = new TextBox.divWrapped("Who should it be assigned to","Assign To","assignTo");
    assignTo.addToElement(_content);
    print("buildContent finished");
  }
  
 
}
