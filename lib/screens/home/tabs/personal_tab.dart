import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tagifiles/model/user_data.dart';
import 'package:tagifiles/provider/auth_provider.dart';
import 'package:tagifiles/screens/home/tabs/collaborate_tab.dart';
import 'package:tagifiles/services/service.dart';
import 'package:tagifiles/util/local_notification.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage>
    with SingleTickerProviderStateMixin {
  // List<Note> searchedItems = [];

  List<Model> userdata = [Model()];

  @override
  void initState() {
    // TODO: implement initState
    // AuthProvider().fetchDataaafterLogin();
    //AuthProvider().ffetchDataafterLogin();
    // Provider.of<AuthProvider>(context, listen: false).fetchDataaafterLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fetchedDafterlogin = Provider.of<AuthProvider>(context);
    var temp = fetchedDafterlogin.ffetchDataafterLogin;
    print(temp.result);

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),

      /// APPBAR Start
      appBar: AppBar(
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Container(
          // height: 45,
          margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
          child: const Text(
            "Personal",
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
        ),
        backgroundColor: const Color(0xFF262626),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // LocalNotificationService.display('titleText', 'bodyText');
                  },
                  child: const Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CollaboratePage()));
                  },
                  child: const Icon(
                    Icons.forum_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),

      /// tabBar Controller
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
                  MyFilesTab(fetchedfterlogin: fetchedDafterlogin),
                  const Icon(Icons.directions_transit),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          // _uploadFolderBottomSheet(context);
        },
        elevation: 8,
        foregroundColor: Colors.blueAccent,
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyFilesTab extends StatefulWidget {
  AuthProvider fetchedfterlogin;

  MyFilesTab({super.key, required this.fetchedfterlogin});

  @override
  State<MyFilesTab> createState() => _MyFilesTabState();
}

class _MyFilesTabState extends State<MyFilesTab> {
  bool isList = false;
  bool isSelectable = false;
  List<int>? selectedFolderItems = [];
  List<int>? selectedFileItems = [];
  String? tokenData;
  bool _islodingDataPersonal = false;
  bool _isLoadMorePersonal = false;

  void _loadMoreDataPersonal() {
    setState(() {
      _isLoadMorePersonal = !_isLoadMorePersonal;
    });
  }

  // Widget buildScroll() => const SingleChildScrollView();

  ///Store the Token
  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokenData = prefs.getString('token');
  }

  /// Upper Image List
  Widget buildGrid() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: const EdgeInsets.only(top: 0.5),
        itemCount: widget.fetchedfterlogin.ffetchDataafterLogin.result != null
            ? widget.fetchedfterlogin.fileList.length
            : 0,
        itemBuilder: (context, index) {
          bool isSelected = selectedFileItems?.contains(
                  widget.fetchedfterlogin.fileList[index].contentId) ??
              false;
          // if(fetchedfterlogin.ffetchDataafterLogin.result![index].isFile){
          return GestureDetector(
            onTap: () {
              if (isSelectable) {
                if (isSelected) {
                  setState(() {
                    selectedFileItems?.remove(widget
                        .fetchedfterlogin.fileList[index].contentId!
                        .toInt());
                  });
                } else {
                  setState(() {
                    selectedFileItems?.add(widget
                        .fetchedfterlogin.fileList[index].contentId!
                        .toInt());
                  });
                }
              }
            },
            child: Container(
              // height: 40,
              // width: 50,
              padding:
                  const EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blueAccent : const Color(0xFF707070),
                // border: Border.all(color: const Color(0xFFBEBEBE), width: 1),
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: PopupMenuButton<String>(iconColor: Colors.white,
                          onSelected: (value) {
                            if (value == 'details') {
                              print('Detailes selected');
                            } else if (value == 'delete') {
                              print('Delete selected');
                            } else if (value == 'rename') {
                              print('rename selected');
                            }
                          },
                          offset: Offset(-20, 20),
                          itemBuilder: (BuildContext context) {
                            return [
                              const PopupMenuItem<String>(
                                value: 'details',
                                child: Row(
                                  children: [
                                    Icon(Icons.info_outline_rounded),
                                    SizedBox(width: 8),
                                    Text('Details'),
                                  ],
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'delete',
                                child: GestureDetector(
                                  onTap: () {
                                    widget.fetchedfterlogin.deleteFolder(
                                      context: context,
                                      folderId: [
                                        widget.fetchedfterlogin
                                            .folderList[index].contentId!
                                            .toInt()
                                      ],
                                      fileId: [],
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(Icons.delete),
                                      SizedBox(width: 8),
                                      Text('Delete'),
                                    ],
                                  ),
                                ),
                              ),
                              const PopupMenuItem<String>(
                                value: 'rename',
                                child: Row(
                                  children: [
                                    Icon(Icons.edit),
                                    SizedBox(width: 8),
                                    Text('Rename'),
                                  ],
                                ),
                              ),
                            ];
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 100,
                    color: Colors.black,
                    width: double.infinity,
                    margin:
                        const EdgeInsets.only(bottom: 5, left: 10, right: 10),
                    child: Image.network(
                      "http://192.168.1.142:8001/tf/core/api/service/dev/v1/personal/content/thumbnail/v1/get/256px/${widget.fetchedfterlogin.fileList[index].contentId}/",
                      headers: {
                        'Authorization': 'Token $tokenData',
                        // 'Content-Type' : 'image/jpeg'
                        'Content-Type': 'application/json',
                        'X-Group-Id': '',
                        'X-In-Group': 'false',
                        'X-Is-Shared': 'false',
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 80,
                          child: Text(
                            widget.fetchedfterlogin.fileList[index].contentName
                                .toString(),
                            // fetchedfterlogin.ffetchDataafterLogin.result!.,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Color(0xFF7A7A7A),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Text(
                          'JPEG',
                          style: TextStyle(color: Color(0xFF7A7A7A)),
                        ),
                        const Text(
                          '155 KB . 27/06/2002',
                          style: TextStyle(color: Color(0xFFBEBEBE)),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.pattern_sharp,
                              color: Color(0xFF1672F3),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              '5 version',
                              style: TextStyle(
                                  color: Color(0xFF7A7A7A),
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            widget
                                        .fetchedfterlogin
                                        .ffetchDataafterLogin
                                        .sharingData?[widget.fetchedfterlogin
                                            .fileList[index].contentId
                                            .toString()]
                                        ?.users ??
                                    false
                                ? const Icon(
                                    Icons.mobile_screen_share,
                                    color: Color(0xFF566476),
                                  )
                                : SizedBox.shrink()
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Row(
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundImage: NetworkImage(
                                  "https://source.unsplash.com/random"),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'userName',
                              style: TextStyle(color: Color(0xFF7A7A7A)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
          // }
        },
      );

  /// FolderList
  Widget buildFolderGrid() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio:(1 / .75),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: widget.fetchedfterlogin.ffetchDataafterLogin.result != null
            ? widget.fetchedfterlogin.folderList.length
            : 0,
        itemBuilder: (context, index) {
          bool isSelected = selectedFolderItems?.contains(
                  widget.fetchedfterlogin.folderList[index].contentId) ??
              false;
          // print('************************************');
          // print(widget.fetchedfterlogin.folderList[index].contentId);

          return GestureDetector(
            onTap: () {
              if (isSelectable) {
                if (isSelected) {
                  setState(() {
                    selectedFolderItems?.remove(widget
                        .fetchedfterlogin.folderList[index].contentId!
                        .toInt());
                  });
                } else {
                  // selectedFolderItems?.add(widget.fetchedfterlogin.folderList[index].contentId!.toInt());
                  setState(() {
                    selectedFolderItems?.add(widget
                        .fetchedfterlogin.folderList[index].contentId!
                        .toInt());
                  });
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blueAccent : const Color(0xFF262626),
                // border: Border.all(color: const Color(0xFFBEBEBE), width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Icon(
                            Icons.folder,
                            size: 50,
                            color: Color(0xFF1672F3),
                          )),
                      Align(
                        alignment: Alignment.centerRight,
                        child: PopupMenuButton<String>(
                          iconColor: const Color(0xFFA5A5A5),
                          onSelected: (value) {
                            if (value == 'details') {
                              print('Details selected');
                            } else if (value == 'delete') {
                              print('Delete selected');
                            } else if (value == 'rename') {
                              print('rename selected');
                            }
                          },
                          offset: const Offset(-25, 30),
                          itemBuilder: (BuildContext context) {
                            return [
                              const PopupMenuItem<String>(
                                value: 'details',
                                child: Row(
                                  children: [
                                    Icon(Icons.info_outline_rounded),
                                    SizedBox(width: 8),
                                    Text('Details'),
                                  ],
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'delete',
                                child: GestureDetector(
                                  onTap: () {
                                    widget.fetchedfterlogin.deleteFolder(
                                      context: context,
                                      folderId: [
                                        widget.fetchedfterlogin
                                            .folderList[index].contentId!
                                            .toInt()
                                      ],
                                      fileId: [],
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(Icons.delete),
                                      SizedBox(width: 8),
                                      Text('Delete'),
                                    ],
                                  ),
                                ),
                              ),
                              const PopupMenuItem<String>(
                                value: 'rename',
                                child: Row(
                                  children: [
                                    Icon(Icons.edit),
                                    SizedBox(width: 8),
                                    Text('Rename'),
                                  ],
                                ),
                              ),
                            ];
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            widget
                                .fetchedfterlogin.folderList[index].contentName
                                .toString(),
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Color(0xFFFFFFFF)),
                          ),
                        ),
                        const Spacer(),
                        widget
                                    .fetchedfterlogin
                                    .ffetchDataafterLogin
                                    .sharingData?["D${widget.fetchedfterlogin.folderList[index].contentId.toString()}"]
                                    ?.users ??
                                false
                            ? const Icon(
                                Icons.mobile_screen_share,
                                color: Color(0xFF566476),
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '27/06/2002',
                        style: TextStyle(color: Color(0xFFA5A5A5)),
                      )),
                ],
              ),
            ),
          );
        },
      );

  // int get selectedItemCount {
  //   int fileCount =
  //       selectedFileItems!.isNotEmpty ? selectedFileItems!.length : 0;
  //   int folderCount =
  //       selectedFolderItems!.isNotEmpty ? selectedFolderItems!.length : 0;
  //   int itemCount = fileCount + folderCount;
  //   return itemCount;
  // }
  int get selectedItemCount {
    int fileCount =
        selectedFileItems?.isNotEmpty ?? false ? selectedFileItems!.length : 0;
    int folderCount = selectedFolderItems?.isNotEmpty ?? false
        ? selectedFolderItems!.length
        : 0;
    int itemCount = fileCount + folderCount;
    return itemCount;
  }

  String dropDownList = 'Date';

  @override
  void initState() {
    // TODO: implement initState
    getToken();
    super.initState();
  }

//fetched file and folders------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    /// final fetchedDataafterlogin = Provider.of<AuthProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //delete totalItems Line
              Row(
                children: [
                  Row(
                    children: [
                      selectedItemCount > 0
                          ? GestureDetector(
                              onTap: () {
                                widget.fetchedfterlogin.deleteFolder(
                                  context: context,
                                  fileId: selectedFileItems ?? [],
                                  folderId: selectedFolderItems ?? [],
                                );
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            )
                          : const SizedBox.shrink(),
                      selectedItemCount > 0
                          ? Text(
                              '$selectedItemCount selected',
                              style: const TextStyle(
                                  fontSize: 16, color: Color(0xFFA5A5A5)),
                            )
                          : const SizedBox.shrink(),
                      Checkbox(
                        checkColor: Colors.black,
                        activeColor: const Color(0xFF1672F3),
                        value: isSelectable,
                        onChanged: (value) {
                          setState(() {
                            isSelectable = !isSelectable;
                            if (!isSelectable) {
                              selectedFileItems?.clear();
                              selectedFolderItems?.clear();
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isList = !isList;
                        });
                      },
                      icon: const Icon(
                        Icons.grid_view,
                        color: Color(0xFF565656),
                      )),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF262626),
                      border:
                          Border.all(color: const Color(0xFF565656), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 30,
                    width: 100,
                    child: DropdownButton<String>(
                      dropdownColor: const Color(0xFF262626),
                      value: dropDownList,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFFA5A5A5),
                      ),
                      iconSize: 24,
                      // elevation: 5,
                      style: const TextStyle(color: Colors.white),
                      underline: const SizedBox(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          dropDownList = newValue;
                        }
                      },
                      items: <String>['Date', 'Name'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.sort,
                                color: Color(0xFFA5A5A5),
                              ),
                              const SizedBox(width: 8),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        widget.fetchedfterlogin.deleteLoading
            ? const Center(
                child: Center(child: CircularProgressIndicator()),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 13.0),
                          child: Text(
                            "Folders",
                            style: TextStyle(
                                color: Color(0xFFA5A5A5),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 356,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 8.0, bottom: 8.0),
                            child: buildFolderGrid(),
                            // child: isList ? buildFolderList() : buildFolderGrid(),
                          ),
                        ),
                        !_islodingDataPersonal
                            ? Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    _loadMoreDataPersonal();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color((0xFF1D55A4)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    fixedSize: const Size(200, 25),
                                  ),
                                  child: Text(_isLoadMorePersonal ? 'Load less' : 'Load More',style: const TextStyle(color: Colors.white),),
                                ),
                            )
                            : const SizedBox.shrink(),

                        const Padding(
                          padding: EdgeInsets.only(left: 13),
                          child: Text(
                            'Files',
                            style: TextStyle(
                                color: Color(0xFFA5A5A5),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        // widget.fetchedfterlogin.deleteLoading
                        //     ? const Center(
                        //         child: CircularProgressIndicator(),
                        //       )
                        //     :
                        SizedBox(
                          width: double.infinity,
                          height: 380,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: buildGrid(),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
      ],
    );
  }
}
