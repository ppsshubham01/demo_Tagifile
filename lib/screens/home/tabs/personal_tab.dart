import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tagifiles/model/user_data.dart';
import 'package:tagifiles/util/service.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage>
    with SingleTickerProviderStateMixin {
  // List<Note> searchedItems = []; //.. here Note is model class

  List<Model> userdata = [Model()];

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
                  border: Border.all(width: 2, color: const Color(0xFFCBCBCB))),
              child: TabBar(
                // controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    // color: const Color(0xFF1D55A4),
                    color: const Color(0xFF1D55A4),
                    borderRadius: BorderRadius.circular(5.0)),
                tabs: const [
                  Tab(
                      child: Text(
                    "My Files",
                  )),
                  Tab(
                    child: Text(
                      "Shared Files",
                    ),
                  ),
                ],
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: const TextStyle(
                    color: Colors.black, backgroundColor: Colors.white),
                onTap: (index) {
                  // _tabController.animateTo(index);
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                // controller: _tabController,
                children: [
                  MyFilesTab(),
                  const Icon(Icons.directions_transit),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyFilesTab extends StatelessWidget {
  MyFilesTab({super.key});

  final List<String> items = [
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

  Widget buildGrid() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: const EdgeInsets.only(top: 0.5),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            padding: const EdgeInsets.only(right: 5,left: 5,top: 5,bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFBEBEBE), width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Checkbox(
                     value: false,
                     onChanged: (value) {},
                   ),
                   const Icon(Icons.more_vert,color: Color(0xFF7A7A7A),),
                 ],
               ),
               Container(
                 height: 100,
                 width: double.infinity,
                 margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
                 color: Colors.red,

                 // NetworkImage('https://source.unsplash.com/random?sig=$index'),
               ),

               Container(
                 padding: const EdgeInsets.only(left: 10),
                 child: const Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('xyz.jpg',style: TextStyle(color: Color(0xFF7A7A7A),fontWeight: FontWeight.bold),),
                     Text('JPEG',style: TextStyle(color: Color(0xFF7A7A7A)),),
                     Text('155 KB . 27/06/2002',style: TextStyle(color: Color(0xFFBEBEBE)),),
                     Row(
                       children: [
                         Icon(Icons.pattern_sharp,color: Color(0xFF1672F3),),
                         SizedBox(width: 5,),
                         Text('5 version',style: TextStyle(color: Color(0xFF7A7A7A),fontWeight: FontWeight.bold),),
                         Spacer(),
                         Icon(Icons.mobile_screen_share,color: Color(0xFF566476),)
                       ],
                     ),
                     SizedBox(height: 2,),
                     Row(
                       children: [
                         CircleAvatar(radius: 10,backgroundImage: NetworkImage("https://source.unsplash.com/random"),),
                         SizedBox(width: 5),
                         Text('userName',style: TextStyle(color: Color(0xFF7A7A7A)),),
                       ],
                     ),
                   ],
                 ),
               )
             ],
                            ),
          );
        },
      );

  Widget buildFolderGrid() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.95,
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFBEBEBE), width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.more_vert,color: Color(0xFF7A7A7A),)),
                Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.folder,
                      size: 50,
                      color: Color(0xFF1672F3),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text('Document',style: TextStyle(color: Color(0xFF7A7A7A)),),
                      Spacer(flex: 1,),
                      Icon(Icons.mobile_screen_share,color: Color(0xFF566476),)
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('27/06/2002',style: TextStyle(color: Color(0xFFBEBEBE)),)),
              ],
            ),
          );
        },
      );

  void _selectedItem(String item, BuildContext context) {
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

  String dropDownList ='Date';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFBEBEBE), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 30, // Set your desired height
                width: 100, // Set your desired width
                child: DropdownButton<String>(
                  value: dropDownList,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: const SizedBox(), // Hide the default underline
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      // Update the selected value on user interaction
                      dropDownList = newValue;
                      // You can add additional functionality here based on the selection
                    }
                  },
                  items: <String>['Date', 'Name'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          const Icon(Icons.sort,color: Color(0xFF566476),), // Leading icon
                          const SizedBox(width: 8), // Adjust the spacing
                          Text(value),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              )

              // DropdownMenu<String>(
              //   // width: 30,
              //   enabled: true,
              //   leadingIcon: const Icon(Icons.sort),
              //   trailingIcon: Icon(Icons.keyboard_arrow_down_rounded),
              //   initialSelection: dropDownList.first,
              //   onSelected: (String? value) {
              //     // This is called when the user selects an item.
              //     // setState(() {
              //     //   dropdownValue = value!;
              //     // });
              //   },
              //   dropdownMenuEntries:
              //       dropDownList.map<DropdownMenuEntry<String>>((String value) {
              //     return DropdownMenuEntry<String>(value: value, label: value);
              //   }).toList(),
              // ),
              ,
              IconButton(onPressed: () {}, icon: const Icon(Icons.grid_view_rounded,color: Color(0xFF1672F3),))
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: buildGrid(),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 13),
          child: Text('Folders',style: TextStyle(color: Color(0xFF414141),fontWeight: FontWeight.bold,fontSize: 14),),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10, top: 8.0, bottom: 8.0),
            child: buildFolderGrid(),
          ),
        ),
      ],
    );
  }
}
