

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tagifiles/screens/home/tabs/new_tab.dart';
import 'package:tagifiles/screens/home/tabs/user_tab.dart';
import 'package:tagifiles/util/service.dart';

class CreateFolderProvider with ChangeNotifier {

  final TextEditingController createfoldertext = TextEditingController();


  void createFolder(BuildContext context){

    ApiService().newFolder(
        foldername: createfoldertext.text,
        destinationFolderId: DateTime.now().millisecondsSinceEpoch,
        onSuccess: (value) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          // Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> const NewPage()) );
        },
        onError: (value) async{
          await Fluttertoast.showToast(msg: 'Try Again..create folder Again!', toastLength: Toast.LENGTH_SHORT );
        },
    );
  }
}