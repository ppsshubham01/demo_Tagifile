import 'package:flutter/material.dart';
import 'package:tagifiles/util/my_list_tile.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D55A4),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Container(
        width: 280,
        color: const Color(0xFF1D55A4),
        child: const Column(
          children: [
            /// Header
            DrawerHeader(
                child: Row(
                 children: [
                   CircleAvatar(
                     radius: 30,
                     child: InkWell(
                     ),
                   ),
                   SizedBox(width: 10,),
                   SingleChildScrollView(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("Lia Nass",style: TextStyle(color: Colors.white),),
                         Text("xyz@gmail.com",style: TextStyle(color: Color(0xFFA8A7A7)),),
                       ],
                     ),
                   ),
                   SizedBox(width: 25,),
                   Icon(Icons.arrow_drop_down,color: Colors.white,size: 30,)
              ],
            )),
            // ListTile(),

            /// Home List
            Expanded(
              child: Column(
                children: [
                  MyListTile(icon: Icons.settings, text: 'S E T T I N G ',
                    iconn: Icon(Icons.arrow_drop_down,color: Colors.white,size: 30,),),
                  Divider(thickness: 0.5,height: 2,indent: 20,endIndent: 20,),
                  MyListTile(icon: Icons.settings, text: 'S E T T I N G ',
                    iconn: Icon(Icons.arrow_drop_down,color: Colors.white,size: 30,),),
                  Divider(thickness: 0.5,height: 2,indent: 20,endIndent: 20,),
                ],
              ),
            ),
            /// Log-out
            MyListTile(icon: Icons.logout_outlined, text: 'S I G N O U T',),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // alignment: Alignment.center,
              color: Colors.white,
              height: 250,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: InkWell(
                      child: Ink.image(
                        image:
                            NetworkImage('https://source.unsplash.com/random'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Lia Nass',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFF566476)),
                  ),
                  const Text('xyz@gmail.com',style: TextStyle(color: Color(0xFFA8A7A7)),),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              height: 500,
              width: double.infinity,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(child: const Text('Personal Info'),
                      onTap: (){},),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Work'),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Education'),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Basic Info'),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Buissness'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
