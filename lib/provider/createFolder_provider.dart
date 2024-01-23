

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tagifiles/services/service.dart';

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
          // await Fluttertoast.showToast(msg: 'Try Again..create folder Again!', toastLength: Toast.LENGTH_SHORT );
        },
    );
  }
}