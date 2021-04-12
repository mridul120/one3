

import 'package:blood1/ui/homesreen/GirdggropeBlood.dart';
import 'package:flutter/cupertino.dart';


class ProviderItem extends ChangeNotifier{
    String _bloodnumber;
    updateSelectItem(List<Bloodlist> mylist,int index){
    mylist.forEach((element) => element.isSelected=false);
    mylist[index].isSelected=true;
    _bloodnumber=mylist[index].bloodname;
    notifyListeners();
    return index;
  }
    get()  =>_bloodnumber;

}