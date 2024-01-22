import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tagifiles/provider/auth_provider.dart';
import 'package:tagifiles/util/my_list_tile.dart';
import 'package:tagifiles/services/service.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context,listen: false).details;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final userDetailProvider = Provider.of<AuthProvider>(context).details;
    final ApiServiceProvider = Provider.of<ApiService>(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF1D55A4),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Container(
        width: 280,
        color: const Color(0xFF1D55A4),
        child: Column(
          children: [
            /// Header
            const DrawerHeader(
                child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage("https://source.unsplash.com/random"),
                ),
                SizedBox(
                  width: 10,
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Lia Nass ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "xyz@gmail.com",
                        style: TextStyle(color: Color(0xFFA8A7A7)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 30,
                )
              ],
            )),
            // ListTile(),

            /// Home List
            Expanded(
              child: Column(
                children: [
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: const ExpansionTile(
                      title: Text(
                        'S E T T I N G ',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      leading: Icon(CupertinoIcons.settings),
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      childrenPadding: EdgeInsets.all(0),
                      // textColor: Colors.greenAccent,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                  CupertinoIcons.lock,
                                  color: Color(0xFF6395D9),
                                ),
                                title: Text(
                                  'S E C U R I T Y',
                                  style: TextStyle(color: Color(0xFF6395D9)),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.format_list_bulleted_outlined,
                                  color: Color(0xFF6395D9),
                                ),
                                title: Text(
                                  'Audience List',
                                  style: TextStyle(color: Color(0xFF6395D9)),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  CupertinoIcons.person,
                                  color: Color(0xFF6395D9),
                                ),
                                title: Text(
                                  'P R O F I L E',
                                  style: TextStyle(color: Color(0xFF6395D9)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // Divider(thickness: 0.5,height: 2,indent: 20,endIndent: 20,),
                ],
              ),
            ),

            /// Log-out
            MyListTile(
              icon: Icons.logout_outlined,
              text: 'S I G N O U T',
              onTap: () async {
                ApiServiceProvider.logout();
              },
            ),
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
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        NetworkImage('https://source.unsplash.com/random'),
                    // child: InkWell(
                    //   child: Ink.image(
                    //     image:
                    //         NetworkImage('https://source.unsplash.com/random'),
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    userDetailProvider?.data?.primary?.firstName ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFF566476)),
                  ),
                  Text(
                    userDetailProvider?.data?.primary?.email ?? '',
                    style: const TextStyle(color: Color(0xFFA8A7A7)),
                  ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      child: const Text('Personal Info'),
                      onTap: () {},
                    ),
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
