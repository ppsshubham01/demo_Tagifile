import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  // List<Note> searchedItems = []; //.. here Note is model class

  // searching element from toDoList2
  void searchingElements(String text) {
    setState(() {});
    // searchedItems.clear();
    // if (text.isEmpty) {
    //   setState(() {});
    //   return;
    // } else {
    //   for (var element in toDoList2) {
    //     if (element.title.toLowerCase().contains(
    //         text.toLowerCase().trim().replaceAll(RegExp(r'\b\s+\b'), ''))) {
    //       // print(element.title);
    //       searchedItems.add(element);
    //     }
    //   }
    //   setState(() {});
    // }
    // setState(() {
    // });
    //print(text.trim());
    // print(searchedItems.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),

      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        title: Container(
          // height: 45,
          margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
          child: Center(
            child: SizedBox(
              width: double.infinity,
              height: 50.0,
              child: TextField(
                // maxLines: 1,
                //maxLength: 100,
                onChanged: (value) => searchingElements(value),
                style: const TextStyle(overflow: TextOverflow.fade),
                decoration: InputDecoration(
                    hintText: 'Search..',
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0))),
                expands: false,
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xFF1D55A4),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      // body: ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _uploadFolderBottomSheet(context);
        },
        elevation: 8,
        foregroundColor: Colors.blueAccent,
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),

      body: Container(


      ),
    );
  }

}

// GridView.count(
//   crossAxisCount: 2,
// mainAxisSpacing: 20.0,
// crossAxisSpacing: 20.0,
// primary: false,
//      children: <Widget>[
//        Container(
//          padding: const EdgeInsets.all(8.0),
//          child: const Text("He'd have you all unravel at the"),
//        ),
//        Container(
//          padding: const EdgeInsets.all(8.0),
//          child: const Text("He'd have you all unravel at the111"),
//        ),
//        Container(
//          padding: const EdgeInsets.all(8.0),
//          child: const Text("He'd have you all unravel at the222"),
//        ),
//        Container(
//          padding: const EdgeInsets.all(8.0),
//          child: const Text("He'd have you all unravel at the333"),
//        ),
//        Container(
//          padding: const EdgeInsets.all(8.0),
//          child: const Text("He'd have you all unravel at the444"),
//        ),
// ]
//  )
