import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tagifiles/provider/auth_provider.dart';
import 'package:tagifiles/screens/chats/newGroup_page.dart';
import 'package:tagifiles/screens/home/tabs/collaborate_tab.dart';
import 'package:tagifiles/screens/home/tabs/new_tab.dart';
import 'package:tagifiles/screens/home/tabs/personal_tab.dart';
import 'package:tagifiles/screens/home/tabs/search_tab.dart';
import 'package:tagifiles/screens/home/tabs/shared_tab.dart';
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

  final List _pages = [
    const PersonalPage(),
    const SharedPage(),
    const NewPage(),
    const SearchPage(),
    const UserPage()
  ];

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AuthProvider>(context, listen: false).fetchDataaafterLogin();
    Provider.of<AuthProvider>(context, listen: false).checkUserIdprovider();
    Provider.of<AuthProvider>(context, listen: false).fetchUserDetails();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final createFolderProviderInstance = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: _pages[_selectedIndex],
      bottomNavigationBar:
        ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          onTap: (value) {
            _navigateBottomBar(value);
            if (value == 2) {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .60,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, right: 8.0, left: 20.0),
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
                                          onPressed: () {
                                            showCreateFolderBottomSheet(
                                                context,
                                                createFolderProviderInstance);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
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
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const NewGroupPage()));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
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
                                          onPressed: () {
                                            cloudBottomSheet(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
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
                                                      BorderRadius.circular(
                                                          8.0))),
                                          child: const Icon(
                                            Icons.file_upload_outlined,
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
          },
          selectedItemColor: const Color(0xFF1459FA),
          unselectedItemColor: const Color(0xFF565656),
          selectedLabelStyle: const TextStyle(color: Colors.red),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          // selectedIconTheme: IconThemeData(col),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.file_copy_sharp),
                label: 'Personal',
              backgroundColor: Color(0xFF262626),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.file_copy_sharp),
                label: 'Shared',
              backgroundColor: Color(0xFF262626),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'New',
              backgroundColor: Color(0xFF262626),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              backgroundColor: Color(0xFF262626),
            ),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 15,
                  backgroundImage:NetworkImage('https://source.unsplash.com/random'),
                ),
                label: 'User',
              backgroundColor: Color(0xFF262626),
            ),
          ],
        ),
                ),
    );
  }

  /// createNew Folder Method
  void showCreateFolderBottomSheet(
      BuildContext context, AuthProvider createFolderProviderInstance) {
    // final createfolderProvider= Provider.of<CreateFolderProvider>(context);
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_new)),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Create New Folder',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const Divider(
                endIndent: 15,
                indent: 15,
                thickness: 2,
              ),
              const SizedBox(height: 10),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 11.0, bottom: 5),
                          child: Text("Folder Name"),
                        ),
                        TextFormField(
                          controller:
                              createFolderProviderInstance.createfoldertext,
                          // controller: createfolderProvider.createfoldertext,
                          //   scrollPadding: EdgeInsets.symmetric(
                          //       vertical:
                          //           MediaQuery.of(context).viewInsets.bottom),
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Enter Folder Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFF1D55A4),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: Color(0xFF1D55A4)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (createFolderProviderInstance
                                  .createfoldertext.text.isNotEmpty) {
                                print("no Name is there..............................");
                                createFolderProviderInstance.createnewFolder(context);
                              }
                              // createfolderProvider.createfoldertext;
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color((0xFF1D55A4)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              fixedSize: const Size(358, 35),
                            ),
                            child: const Text(
                              'Create',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            // Close bottom sheet
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Color(0xFF7A7A7A)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  /// Cloud Bottom Sheet
  void cloudBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * .60,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      const Text(
                        "Add Cloud ",
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
                  const Divider(thickness: 1, indent: 6, endIndent: 8),
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
                                onPressed: () {
                                  // showCreateFolderBottomSheet(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0))),
                                child: Image.asset(
                                  "images/googledrive.png",
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              "Google Drive",
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
                                child: Image.asset(
                                  "images/boxdrive.png",
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              "Box Drive",
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
                                child: Image.asset(
                                  "images/dropdrive.png",
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              "Drop Drive",
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
                                child: Image.asset(
                                  "images/onedrive.png",
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              "One Drive",
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
                                  Icons.file_upload_outlined,
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
