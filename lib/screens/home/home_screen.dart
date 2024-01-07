import 'package:flutter/material.dart';
import 'package:tagifiles/screens/home/tabs/collaborate_tab.dart';
import 'package:tagifiles/screens/home/tabs/new_tab.dart';
import 'package:tagifiles/screens/home/tabs/personal_tab.dart';
import 'package:tagifiles/screens/home/tabs/user_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
   print(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages =[
    const PersonalPage(),
    const CollaboratePage(),
    const NewPage(),
    const UserPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: _pages[_selectedIndex],

      bottomNavigationBar: SizedBox(
        height: 62,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            _navigateBottomBar(value);
            if(value == 2){
              showModalBottomSheet(context: context, builder: (BuildContext bc){

                return Container(
                  height: MediaQuery.of(context).size.height *.60,
                  child: Padding(padding: const EdgeInsets.only(top: 8.0,right: 8.0,left: 20.0),
                    child: Column(
                      children:<Widget> [
                        Row(
                          children: [
                            const Text("Create New ",
                              style: TextStyle(color: Color(0xFF414141),fontSize: 16.0,fontWeight: FontWeight.bold),),
                            const Spacer(),
                            IconButton(
                                onPressed: (){
                                  Navigator.of(context).pop();},
                                icon: const Icon(Icons.cancel_outlined)),
                          ],
                        ),
                        Row(
                          children:<Widget>  [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: () {  },
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))
                                      ),
                                      child:  const Icon(Icons.folder_open_rounded,size: 60.0,color: Color(0xFF1672F3),),
                                    ),
                                  ),const SizedBox(height:10.0),
                                  const Text("Folders",style: TextStyle(fontSize: 16),)

                                ],
                              ),
                            ),Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: () {  },
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))
                                      ),
                                      child:  const Icon(Icons.group,size: 60.0,color: Color(0xFF1672F3),),
                                    ),
                                  ),const SizedBox(height:10.0),
                                  const Text("Groups",style: TextStyle(fontSize: 16),)

                                ],
                              ),
                            ),Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: () {  },
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))
                                      ),
                                      child:  const Icon(Icons.cloud_outlined,size: 60.0,color:Color(0xFF1672F3),),
                                    ),
                                  ),const SizedBox(height:10.0),
                                  const Text("Add Cloud",style: TextStyle(fontSize: 16),)

                                ],
                              ),
                            ),
                          ],),
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
                                      onPressed: () {  },
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))
                                      ),
                                      child: const Icon(Icons.upload_outlined,color: Color(0xFF1672F3),size: 60.0,),
                                    ),
                                  ),const SizedBox(height: 10.0,),
                                  const Text("Upload",style: TextStyle(fontSize: 16.0),)
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
          } ,
          selectedItemColor:  const Color(0xFF1672F3) ,
          unselectedItemColor:  const Color(0xFF707070),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          // selectedIconTheme: IconThemeData(col),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.file_copy_sharp),
                label: 'Personal',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble),
                label: 'Collaborate',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_card),
                label: 'New',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'User',
                backgroundColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
