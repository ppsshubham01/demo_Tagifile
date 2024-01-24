

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tagifiles/provider/auth_provider.dart';
import 'package:tagifiles/services/service.dart';

class CreateFolderProvider with ChangeNotifier {

  final TextEditingController createfoldertext = TextEditingController();
  bool loginLoading = false;


  void createFolder(BuildContext context){
    final AuthProvider currentParentiss = Provider.of<AuthProvider>(context,listen: false);

    loginLoading =true;
    notifyListeners();
    ApiService().newFolder(
        foldername: createfoldertext.text,
        destinationFolderId: currentParentiss.ffetchDataafterLogin.currentParent?? -1,
        onSuccess: (value) {
          loginLoading = false;
          notifyListeners();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onError: (value) async{
          loginLoading =false;
          notifyListeners();
          // await Fluttertoast.showToast(msg: 'Try Again..create folder Again!', toastLength: Toast.LENGTH_SHORT );
        },
    );
  }
}