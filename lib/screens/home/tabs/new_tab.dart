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
          _uploadFolderBottomSheet(context);
        },
        elevation: 8,
        foregroundColor: Colors.blueAccent,
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  //Method for
  void _uploadFolderBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * .60,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      const Text(
                        "Create New ",
                        style: TextStyle(
                            color: Color(0xFF414141),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.cancel_outlined)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0))),
                                child: const Icon(
                                  Icons.folder_open_rounded,
                                  size: 60.0,
                                  color: Color(0xFF1672F3),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              "Folders",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0))),
                                child: const Icon(
                                  Icons.group,
                                  size: 60.0,
                                  color: Color(0xFF1672F3),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              "Groups",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0))),
                                child: const Icon(
                                  Icons.cloud_outlined,
                                  size: 60.0,
                                  color: Color(0xFF1672F3),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              "Add Cloud",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0))),
                                child: const Icon(
                                  Icons.upload_outlined,
                                  color: Color(0xFF1672F3),
                                  size: 60.0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Upload",
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
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
