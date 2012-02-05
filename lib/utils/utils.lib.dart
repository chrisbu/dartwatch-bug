#library("lib.utils");

/**
*  Remove the item from the list
*/
removeFromList(var item, var list) {
  int indexToRemove = 0;
  for (int i = 0; i < list.length; i++) {
    var element = list[i];
    if (element == item) {
      print("found div at index ${i}");
      indexToRemove = i;
      break;
    }
  }
  
  print("removing at index ${indexToRemove}");
  list.removeRange(indexToRemove,1);
  
}