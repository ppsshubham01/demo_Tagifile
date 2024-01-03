import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tagifiles/model/user_data.dart';
import 'package:tagifiles/util/service.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> with SingleTickerProviderStateMixin{

  // List<Note> searchedItems = []; //.. here Note is model class

  List<Model> userdata=[
    Model()
  ];
  List<String> items = [
    'Pratik',
    'Dharti',
    'Shubham',
    'Jaimin',
    'Bhargav',
    'Khushal',
    'Harsh',
    'Hetvi',
    'Yash',
    'Pratik',
    'Dharti',
    'Shubham',
    'Jaimin',
    'Bhargav',
    'Khushal',
    'Harsh',
    'Hetvi',
    'Yash',
    'Jaivik',
  ];

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
  void initState() {
    // TODO: implement initState
    ApiService().fetchDataAfterLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      // APP-BAR Start
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
                            const BorderSide(color: Colors.white, width: 2.0))
                ),
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
      // APP-BAR End

      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 250,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 2,color: const Color(0xFFCBCBCB))
              ),
              child: TabBar(
                // controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  // color: const Color(0xFF1D55A4),
                  color: const Color(0xFF1D55A4),
                  borderRadius: BorderRadius.circular(5.0)
                ),
                tabs: const [
                  Tab(
                    child: Text("My Files",)),
                  Tab(child: Text("Shared Files",),),
                ],
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: const TextStyle(color: Colors.black, backgroundColor: Colors.white),
                onTap: (index){
                  // _tabController.animateTo(index);
                },
              ),
            ),
             Expanded(
              child: TabBarView(
                // controller: _tabController,
                children: [
                  Container(
                    height: double.infinity,
                      width: double.infinity,
                      child: Scaffold(body: Column(
                        children: [
                          SafeArea(child:
                          // Icon(Icons.directions_car)
                          buildGrid(),
                          ),

                        ],
                      ))),
                  Icon(Icons.directions_transit),
                ],
              ),
            ),
          ],
        ),
      ),
      // body: DefaultTabController(
      //   length: 2,
      //   child: Scaffold(
      //     appBar: AppBar(
      //       bottom: const TabBar(
      //         tabs: [
      //           Tab(text: "My Files",),
      //           Tab(text: "Shared Files",),
      //         ],
      //       ),
      //     ),
      //     body: TabBarView(
      //       children: [
      //         Icon(Icons.directions_car),
      //         Icon(Icons.directions_transit),
      //       ],
      //
      //     ) ,
      //   ),
      //
      // ),
    );
  }


  Widget buildGrid() => GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];

      return GridTile(
        footer: Text(
          item,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: InkWell(
          child: Ink.image(
            image: NetworkImage(
              'https://source.unsplash.com/random?sig=$index',
            ),
            fit: BoxFit.cover,
          ),
          onTap: () { _selectedItem(item);},
        ),
      );
    },
  );

  void _selectedItem(String item) {
    final snackBar = SnackBar(
      content: Text(
        "Selected chat number $item..",
        style: const TextStyle(fontSize: 15.0),
      ),
      backgroundColor: Colors.purple,
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
