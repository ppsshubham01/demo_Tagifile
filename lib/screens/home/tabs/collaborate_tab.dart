import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tagifiles/model/chatUsersModel.dart';
import 'package:tagifiles/model/collaborateModel.dart';
import 'package:tagifiles/screens/chats/chat_page.dart';

import '../../../provider/auth_provider.dart';
import '../../../util/dialog_box.dart';

class CollaboratePage extends StatefulWidget {
  const CollaboratePage({super.key});

  @override
  State<CollaboratePage> createState() => _CollaboratePageState();
}

class _CollaboratePageState extends State<CollaboratePage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Jane Russel",
        messageText: "Awesome Setup",
        image: "images/userImage1.jpeg",
        time: "Now"),
    ChatUsers(
        name: "Glady's Murphy",
        messageText: "That's Great",
        image: "images/userImage2.jpeg",
        time: "Yesterday"),
    ChatUsers(
        name: "Jorge Henry",
        messageText: "Hey where are you?",
        image: "images/userImage3.jpeg",
        time: "31 Mar"),
    ChatUsers(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        image: "images/userImage4.jpeg",
        time: "28 Mar"),
    ChatUsers(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        image: "images/userImage5.jpeg",
        time: "23 Mar"),
    ChatUsers(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        image: "images/userImage6.jpeg",
        time: "17 Mar"),
    ChatUsers(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        image: "images/userImage7.jpeg",
        time: "24 Feb"),
    ChatUsers(
        name: "John Wick",
        messageText: "How are you?",
        image: "images/userImage8.jpeg",
        time: "18 Feb"),
    ChatUsers(
        name: "Jorge Henry",
        messageText: "Hey where are you?",
        image: "images/userImage3.jpeg",
        time: "31 Mar"),
    ChatUsers(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        image: "images/userImage4.jpeg",
        time: "28 Mar"),
    ChatUsers(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        image: "images/userImage5.jpeg",
        time: "23 Mar"),
    ChatUsers(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        image: "images/userImage6.jpeg",
        time: "17 Mar"),
    ChatUsers(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        image: "images/userImage7.jpeg",
        time: "24 Feb"),
  ];
  List<CollaborateModel> collaborateLiat = [];

  List<dynamic> searchChatUserList = [];

  void searchingElements(String text, List<dynamic> combinedListData) {
    setState(() {
      searchChatUserList.clear();
    });

    if (text.isNotEmpty || text != '') {
      // for (var element in combinedListData) {
      //   if (element[''].toLowerCase().contains(
      //       text.toLowerCase().trim().replaceAll(RegExp(r'\b\s+\b'), ''))) {
      //     // print(element.title);
      //     searchChatUserList.add(element);
      //   }
      // }
      searchChatUserList = combinedListData.where((item) {
        String username = item['username'] ?? '';
        String groupName = item['group_name'] ?? '';
        return username.toLowerCase().contains(text.toLowerCase()) ||
            groupName.toLowerCase().contains(text.toLowerCase());
      }).toList();
      setState(() {});
    }
    //print(text.trim());
    // print(searchedItems.length);
  }

  final TextEditingController searchTextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AuthProvider>(context, listen: false)
        .collaborateModelProvider();
    super.initState();
  }

  String formattedTime(String dateString) {
    DateTime date = DateTime.parse(dateString);
    String formattedTime = DateFormat('hh:mm a').format(date);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    final finalCollaborateData = Provider.of<AuthProvider>(context);
    // print(finalCollaborateData);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context, true);
            }),
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
                controller: searchTextController,
                onChanged: (value) {
                  List<dynamic> combinedList = [];
                  // Add individual chat items to the combined list
                  if (finalCollaborateData.fetchedCollaborateData['individuals'] != null) {
                    combinedList.addAll(finalCollaborateData.fetchedCollaborateData['individuals']);
                  }

                  // Add group chat items to the combined list
                  if (finalCollaborateData.fetchedCollaborateData['groups'] != null) {
                    combinedList.addAll(finalCollaborateData.fetchedCollaborateData['groups']);
                  }
                  searchingElements(value,combinedList); },
                style: const TextStyle(overflow: TextOverflow.fade),
                decoration: InputDecoration(
                  hintText: 'Search..',
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                Icons.filter_list_outlined,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            mergedChatList(finalCollaborateData),
            // chatList2(finalCollaborateData),
            // groupChatList2(finalCollaborateData),
            // chatList(finalCollaborateData),
            // groupChatList(finalCollaborateData),
          ],
        ),
      ),
    );
  }


  // Widget mergedChatList(AuthProvider finalData) {
  //   List<dynamic> allChats = [];
  //
  //   allChats.addAll(finalData.fetchedCollaborateData['individuals'] ?? []);
  //   allChats.addAll(finalData.fetchedCollaborateData['groups'] ?? []);
  //
  //   allChats.sort((a, b) {
  //     DateTime aTime = a['last_message_time'] ?? DateTime(0);
  //     DateTime bTime = b['last_message_time'] ?? DateTime(0);
  //     return bTime.compareTo(aTime);
  //   });
  //
  //   return ListView.builder(
  //     itemCount: allChats.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       return ListTile(
  //
  //       );
  //     },
  //   );
  // }

  Widget mergedChatList(AuthProvider finalData) {
    List<dynamic> combinedList = [];

    // Add individual chat items to the combined list
    if (finalData.fetchedCollaborateData['individuals'] != null) {
      combinedList.addAll(finalData.fetchedCollaborateData['individuals']);
    }

    // Add group chat items to the combined list
    if (finalData.fetchedCollaborateData['groups'] != null) {
      combinedList.addAll(finalData.fetchedCollaborateData['groups']);
    }

    // Sort the combined list based on the time string
    combinedList.sort((a, b) {
      String timeA = a['last_message_activity'];
      String timeB = b['last_message_activity'];
      return DateTime.parse(timeB).compareTo(DateTime.parse(timeA));
    });

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: combinedList.length,
      itemBuilder: (BuildContext context, int index) {
        Map<String, dynamic> item = combinedList[index];

        return Dismissible(
          key: ValueKey(combinedList[index]),
          background: Container(
            color: Colors.red,
            child: const Icon(CupertinoIcons.delete),
          ),
          secondaryBackground: Container(
            color: Colors.green,
            child: const Icon(Icons.archive),
          ),
          onDismissed: (DismissDirection direction) {
            setState(() {
              Container();
              combinedList.removeAt(index);
            });
          },
          confirmDismiss: (DismissDirection direction) async {
            return showDialog(
                context: context,
                useRootNavigator: true,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return AlertDialog(
                    alignment: Alignment.center,
                    backgroundColor: Colors.white,
                    title: const Center(
                        child: Text(
                          "Delete this chat?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    content: const Text(
                      "Are you sure you want to permanently delete this message?",
                      style: TextStyle(
                          color: Color(0xFF7A7A7A),
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                    actions: <Widget>[
                      const Divider(),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            style: const ButtonStyle(),
                            child: const Text(
                              'Yes, Delete',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                            child: VerticalDivider(
                              endIndent: 0,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(
                                    color: Color(0xFF566476)),
                              )),
                        ],
                      )
                    ],
                  );
                });
          },
          child: ListTile(
            leading: GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
                //   userItem: chatUsers[index],
                //   networkImageLink: 'https://source.unsplash.com/random?sig=$index',
                // ),),);
              },
              child: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(
                    'https://source.unsplash.com/random?sig=$index'),
              ),
            ),
            title: GestureDetector(
                onTap: () {
                  setState(() {
                    // searchChatUserList.clear();
                    searchTextController.clear();
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                        userItem: item,
                        networkImageLink:
                        'https://source.unsplash.com/random?sig=$index',
                      ),
                    ),
                  );
                },
                child: Text( item['group_name'] ?? "${item['first_name']} ${item['last_name']}")),
            // child: Text(finalData.collaborateData.data?.individuals[index] .f\rstName ?? 'nullData')),
            subtitle: Text(item['username'],
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
            // subtitle: Text("subtitle ${finalData.collaborateData.data?.individuals[index].username}"),
            trailing: Column(
              children: [
                // Text("${finalData.fetchedCollaborateData['individuals'][index]['last_message_activity']}"),
                Text(item['last_message_activity']),
                // "last_message_activity": "2023-11-04T04:39:45.404317Z",
                Text(item['unread'],
                  style: const TextStyle(
                      color: CupertinoColors.systemGreen),
                ),
                // const Icon(
                //   Icons.timelapse_rounded,
                //   color: Colors.green,
                // ),
              ],
            ),
            // onTap: () => _selectedItem(item),
          ),
        );;
      },
    );
  }


  // ChatList
  Widget chatList(AuthProvider finalData) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.8,
      child: searchChatUserList.isEmpty
          ? finalData.fetchedCollaborateData['individuals'] == null
              ? const SizedBox.shrink()
              : ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
                  // itemCount: finalData.fetchedCollaborateData.data?.individuals.length,
                  itemCount:
                      (finalData.fetchedCollaborateData['individuals']).length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: ValueKey(
                          finalData.fetchedCollaborateData['individuals'][index]),
                      background: Container(
                        color: Colors.red,
                        child: const Icon(CupertinoIcons.delete),
                      ),
                      secondaryBackground: Container(
                        color: Colors.green,
                        child: const Icon(Icons.archive),
                      ),
                      onDismissed: (DismissDirection direction) {
                        setState(() {
                          Container();
                          chatUsers.removeAt(index);
                        });
                      },
                      confirmDismiss: (DismissDirection direction) async {
                        return showDialog(
                            context: context,
                            useRootNavigator: true,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                alignment: Alignment.center,
                                backgroundColor: Colors.white,
                                title: const Center(
                                    child: Text(
                                  "Delete this chat?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                )),
                                content: const Text(
                                  "Are you sure you want to permanently delete this message?",
                                  style: TextStyle(
                                      color: Color(0xFF7A7A7A),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                                actions: <Widget>[
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, true);
                                        },
                                        style: const ButtonStyle(),
                                        child: const Text(
                                          'Yes, Delete',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 50,
                                        child: VerticalDivider(
                                          endIndent: 0,
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, false);
                                          },
                                          child: const Text(
                                            'No',
                                            style: TextStyle(
                                                color: Color(0xFF566476)),
                                          )),
                                    ],
                                  )
                                ],
                              );
                            });
                      },
                      child: ListTile(
                        leading: GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
                            //   userItem: chatUsers[index],
                            //   networkImageLink: 'https://source.unsplash.com/random?sig=$index',
                            // ),),);
                          },
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(
                                'https://source.unsplash.com/random?sig=$index'),
                          ),
                        ),
                        title: GestureDetector(
                            onTap: () {
                              setState(() {
                                // searchChatUserList.clear();
                                searchTextController.clear();
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatPage(
                                    userItem: finalData.fetchedCollaborateData['individuals'][index],
                                    networkImageLink:
                                        'https://source.unsplash.com/random?sig=$index',
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                    "${finalData.fetchedCollaborateData['individuals'][index]['first_name']}"),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "${finalData.fetchedCollaborateData['individuals'][index]['last_name']}",
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            )),
                        // child: Text(finalData.collaborateData.data?.individuals[index] .f\rstName ?? 'nullData')),
                        subtitle: Text(
                          "${finalData.fetchedCollaborateData['individuals'][index]['username']}",
                          style: const TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                        // subtitle: Text("subtitle ${finalData.collaborateData.data?.individuals[index].username}"),
                        trailing: Column(
                          children: [
                            // Text("${finalData.fetchedCollaborateData['individuals'][index]['last_message_activity']}"),
                            Text(formattedTime(finalData.fetchedCollaborateData['individuals']
                                    [index]['last_message_activity'])),
                            // "last_message_activity": "2023-11-04T04:39:45.404317Z",
                            Text(
                              "${finalData.fetchedCollaborateData['individuals'][index]['unread']}",
                              style: const TextStyle(
                                  color: CupertinoColors.systemGreen),
                            ),
                            // const Icon(
                            //   Icons.timelapse_rounded,
                            //   color: Colors.green,
                            // ),
                          ],
                        ),
                        // onTap: () => _selectedItem(item),
                      ),
                    );
                  },
                )
          : // for serachView
          ListView.builder(
              itemCount: searchChatUserList.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: ValueKey(searchChatUserList[index]),
                  background: Container(
                    color: Colors.red,
                    child: const Icon(CupertinoIcons.delete),
                  ),
                  secondaryBackground: Container(
                    color: Colors.green,
                    child: const Icon(Icons.archive),
                  ),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      Container();
                      searchChatUserList.removeAt(index);
                    });
                  },
                  confirmDismiss: (DismissDirection direction) async {
                    return showDialog(
                        context: context,
                        useRootNavigator: true,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            alignment: Alignment.center,
                            backgroundColor: Colors.white,
                            title: const Center(
                                child: Text(
                              "Delete this chat?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            content: const Text(
                              "Are you sure you want to permanently delete this message?",
                              style: TextStyle(
                                  color: Color(0xFF7A7A7A),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                            actions: <Widget>[
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                    },
                                    style: const ButtonStyle(),
                                    child: const Text(
                                      'Yes, Delete',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                    child: VerticalDivider(
                                      endIndent: 0,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, false);
                                      },
                                      child: const Text(
                                        'No',
                                        style:
                                            TextStyle(color: Color(0xFF566476)),
                                      )),
                                ],
                              )
                            ],
                          );
                        });
                  },
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
                        //   userItem: searchChatUserList[index],
                        //   networkImageLink: 'https://source.unsplash.com/random?sig=$index',
                        // ),),);
                      },
                      child: GestureDetector(
                        onTap: () {
                          PopDialog().showProfilePictureDialog(context);
                        },
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(
                              'https://source.unsplash.com/random?sig=$index'),
                        ),
                      ),
                    ),
                    title: GestureDetector(
                        onTap: () {
                          setState(() {
                            // searchChatUserList.clear();
                            searchTextController.clear();
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPage(
                                userItem: {},
                                networkImageLink:
                                    'https://source.unsplash.com/random?sig=$index',
                              ),
                            ),
                          );
                        },
                        child: Text(searchChatUserList[index].name)),
                    subtitle:
                        Text("subtitle ${searchChatUserList[index].messageText}"),
                    trailing: Column(
                      children: [
                        Text(
                          "12.00${searchChatUserList[index].time}",
                          style: const TextStyle(color: Color(0xFFA8A7A7)),
                        ),
                        const Icon(
                          Icons.timelapse_rounded,
                          color: Colors.lightGreenAccent,
                        ),
                      ],
                    ),
                    // onTap: () => _selectedItem(item),
                  ),
                );
              },
            ),
    );
  }

  Widget groupChatList(AuthProvider finalData) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.8,
      child: searchChatUserList.isEmpty
          ? finalData.fetchedCollaborateData['groups'] == null
          ? const SizedBox.shrink()
          : ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // itemCount: finalData.fetchedCollaborateData.data?.individuals.length,
        itemCount: (finalData.fetchedCollaborateData['groups']).length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey(
                finalData.fetchedCollaborateData['groups'][index]),
            background: Container(
              color: Colors.red,
              child: const Icon(CupertinoIcons.delete),
            ),
            secondaryBackground: Container(
              color: Colors.green,
              child: const Icon(Icons.archive),
            ),
            onDismissed: (DismissDirection direction) {
              setState(() {
                Container();
                chatUsers.removeAt(index);
              });
            },
            confirmDismiss: (DismissDirection direction) async {
              return showDialog(
                  context: context,
                  useRootNavigator: true,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      alignment: Alignment.center,
                      backgroundColor: Colors.white,
                      title: const Center(
                          child: Text(
                            "Delete this chat?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                      content: const Text(
                        "Are you sure you want to permanently delete this message?",
                        style: TextStyle(
                            color: Color(0xFF7A7A7A),
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                      actions: <Widget>[
                        const Divider(),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              style: const ButtonStyle(),
                              child: const Text(
                                'Yes, Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                              child: VerticalDivider(
                                endIndent: 0,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: const Text(
                                  'No',
                                  style: TextStyle(
                                      color: Color(0xFF566476)),
                                )),
                          ],
                        )
                      ],
                    );
                  });
            },
            child: ListTile(
              leading: GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
                  //   userItem: chatUsers[index],
                  //   networkImageLink: 'https://source.unsplash.com/random?sig=$index',
                  // ),),);
                },
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(
                      'https://source.unsplash.com/random?sig=$index'),
                ),
              ),
              title: GestureDetector(
                onTap: () {
                  setState(() {
                    // searchChatUserList.clear();
                    searchTextController.clear();
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                        userItem: finalData.fetchedCollaborateData['groups'][index],
                        networkImageLink:
                        'https://source.unsplash.com/random?sig=$index',
                      ),
                    ),
                  );
                },
                child: Text("${finalData.fetchedCollaborateData['groups'][index]['group_name']}"),
              ),
              // child: Text(finalData.collaborateData.data?.individuals[index] .f\rstName ?? 'nullData')),
              subtitle: Text(
                "${finalData.fetchedCollaborateData['groups'][index]['username']}",
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
              // subtitle: Text("subtitle ${finalData.collaborateData.data?.individuals[index].username}"),
              trailing: Column(
                children: [
                  // Text(
                  //     "${finalData.fetchedCollaborateData['groups'][index]['last_message_activity']}"),
                  Text(formattedTime(finalData.fetchedCollaborateData['groups'][index]['last_message_activity'])),
                  Text("${finalData.fetchedCollaborateData['groups'][index]['unread']}",
                    style: const TextStyle(
                        color: CupertinoColors.systemGreen),
                  ),
                  // const Icon(
                  //   Icons.timelapse_rounded,
                  //   color: Colors.green,
                  // ),
                ],
              ),
              // onTap: () => _selectedItem(item),
            ),
          );
        },
      )
          : // for serachView
      ListView.builder(
        itemCount: searchChatUserList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey(searchChatUserList[index]),
            background: Container(
              color: Colors.red,
              child: const Icon(CupertinoIcons.delete),
            ),
            secondaryBackground: Container(
              color: Colors.green,
              child: const Icon(Icons.archive),
            ),
            onDismissed: (DismissDirection direction) {
              setState(() {
                Container();
                searchChatUserList.removeAt(index);
              });
            },
            confirmDismiss: (DismissDirection direction) async {
              return showDialog(
                  context: context,
                  useRootNavigator: true,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      alignment: Alignment.center,
                      backgroundColor: Colors.white,
                      title: const Center(
                          child: Text(
                            "Delete this chat?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                      content: const Text(
                        "Are you sure you want to permanently delete this message?",
                        style: TextStyle(
                            color: Color(0xFF7A7A7A),
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                      actions: <Widget>[
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              style: const ButtonStyle(),
                              child: const Text(
                                'Yes, Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                              child: VerticalDivider(
                                endIndent: 0,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: const Text(
                                  'No',
                                  style:
                                  TextStyle(color: Color(0xFF566476)),
                                )),
                          ],
                        )
                      ],
                    );
                  });
            },
            child: ListTile(
              leading: GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
                  //   userItem: searchChatUserList[index],
                  //   networkImageLink: 'https://source.unsplash.com/random?sig=$index',
                  // ),),);
                },
                child: GestureDetector(
                  onTap: () {
                    PopDialog().showProfilePictureDialog(context);
                  },
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                        'https://source.unsplash.com/random?sig=$index'),
                  ),
                ),
              ),
              title: GestureDetector(
                  onTap: () {
                    setState(() {
                      // searchChatUserList.clear();
                      searchTextController.clear();
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                          userItem: {},
                          networkImageLink:
                          'https://source.unsplash.com/random?sig=$index',
                        ),
                      ),
                    );
                  },
                  child: Text(searchChatUserList[index].name)),
              subtitle:
              Text("subtitle ${searchChatUserList[index].messageText}"),
              trailing: Column(
                children: [
                  Text(
                    "12.00${searchChatUserList[index].time}",
                    style: const TextStyle(color: Color(0xFFA8A7A7)),
                  ),
                  const Icon(
                    Icons.timelapse_rounded,
                    color: Colors.lightGreenAccent,
                  ),
                ],
              ),
              // onTap: () => _selectedItem(item),
            ),
          );
        },
      ),
    );
  }



  Widget chatList2(AuthProvider finalData) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.8,
      child: searchChatUserList.isEmpty
          ? ListView.builder(
        shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  // itemCount: finalData.fetchedCollaborateData.data?.individuals.length,
                  itemCount:  4,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
                            userItem: {},
                            networkImageLink: 'https://source.unsplash.com/random?sig=$index',
                          ),),);
                        },
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(
                              'https://source.unsplash.com/random?sig=$index'),
                        ),
                      ),
                      title: GestureDetector(
                          onTap: () {
                            setState(() {
                              // searchChatUserList.clear();
                              searchTextController.clear();
                            });
                          },
                          child: Row(
                            children: [
                              Text('fname'),
                              const SizedBox(
                                width: 2,
                              ),
                              Text( 'subtitle',
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          )),
                      // child: Text(finalData.collaborateData.data?.individuals[index] .f\rstName ?? 'nullData')),
                      subtitle: Text( 'fname',
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                      // subtitle: Text("subtitle ${finalData.collaborateData.data?.individuals[index].username}"),
                      trailing: Column(
                        children: [
                          // Text("${finalData.fetchedCollaborateData['individuals'][index]['last_message_activity']}"),
                          Text('time'),
                          // "last_message_activity": "2023-11-04T04:39:45.404317Z",
                          Text('reminder',
                            style: const TextStyle(
                                color: CupertinoColors.systemGreen),
                          ),
                          // const Icon(
                          //   Icons.timelapse_rounded,
                          //   color: Colors.green,
                          // ),
                        ],
                      ),
                      // onTap: () => _selectedItem(item),
                    );
                  },
                )
          : // for serachView
          ListView.builder(
              itemCount: searchChatUserList.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: ValueKey(searchChatUserList[index]),
                  background: Container(
                    color: Colors.red,
                    child: const Icon(CupertinoIcons.delete),
                  ),
                  secondaryBackground: Container(
                    color: Colors.green,
                    child: const Icon(Icons.archive),
                  ),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      Container();
                      searchChatUserList.removeAt(index);
                    });
                  },
                  confirmDismiss: (DismissDirection direction) async {
                    return showDialog(
                        context: context,
                        useRootNavigator: true,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            alignment: Alignment.center,
                            backgroundColor: Colors.white,
                            title: const Center(
                                child: Text(
                              "Delete this chat?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            content: const Text(
                              "Are you sure you want to permanently delete this message?",
                              style: TextStyle(
                                  color: Color(0xFF7A7A7A),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                            actions: <Widget>[
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                    },
                                    style: const ButtonStyle(),
                                    child: const Text(
                                      'Yes, Delete',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                    child: VerticalDivider(
                                      endIndent: 0,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, false);
                                      },
                                      child: const Text(
                                        'No',
                                        style:
                                            TextStyle(color: Color(0xFF566476)),
                                      )),
                                ],
                              )
                            ],
                          );
                        });
                  },
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
                        //   userItem: searchChatUserList[index],
                        //   networkImageLink: 'https://source.unsplash.com/random?sig=$index',
                        // ),),);
                      },
                      child: GestureDetector(
                        onTap: () {
                          PopDialog().showProfilePictureDialog(context);
                        },
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(
                              'https://source.unsplash.com/random?sig=$index'),
                        ),
                      ),
                    ),
                    title: GestureDetector(
                        onTap: () {
                          setState(() {
                            // searchChatUserList.clear();
                            searchTextController.clear();
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPage(
                                userItem: {},
                                networkImageLink:
                                    'https://source.unsplash.com/random?sig=$index',
                              ),
                            ),
                          );
                        },
                        child: Text(searchChatUserList[index].name)),
                    subtitle:
                        Text("subtitle ${searchChatUserList[index].messageText}"),
                    trailing: Column(
                      children: [
                        Text(
                          "12.00${searchChatUserList[index].time}",
                          style: const TextStyle(color: Color(0xFFA8A7A7)),
                        ),
                        const Icon(
                          Icons.timelapse_rounded,
                          color: Colors.lightGreenAccent,
                        ),
                      ],
                    ),
                    // onTap: () => _selectedItem(item),
                  ),
                );
              },
            ),
    );
  }

  Widget groupChatList2(AuthProvider finalData) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.8,
      child: searchChatUserList.isEmpty
          ? ListView.builder(
        shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  // itemCount: finalData.fetchedCollaborateData.data?.individuals.length,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: GestureDetector(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
                          //   userItem: chatUsers[index],
                          //   networkImageLink: 'https://source.unsplash.com/random?sig=$index',
                          // ),),);
                        },
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(
                              'https://source.unsplash.com/random?sig=$index'),
                        ),
                      ),
                      title: GestureDetector(
                          onTap: () {
                            setState(() {
                              // searchChatUserList.clear();
                              searchTextController.clear();
                            });
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ChatPage(
                            //       userItem: finalData.fetchedCollaborateData['groups'][index],
                            //       networkImageLink:
                            //           'https://source.unsplash.com/random?sig=$index',
                            //     ),
                            //   ),
                            // );
                          },
                          child: Text('gname'),
                      ),
                      // child: Text(finalData.collaborateData.data?.individuals[index] .f\rstName ?? 'nullData')),
                      subtitle: Text('subtitle',
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                      // subtitle: Text("subtitle ${finalData.collaborateData.data?.individuals[index].username}"),
                      trailing: Column(
                        children: [
                          // Text("${finalData.fetchedCollaborateData['groups'][index]['last_message_activity']}"),
                          Text('time'),
                          Text('time2',
                            style: const TextStyle(
                                color: CupertinoColors.systemGreen),
                          ),
                          // const Icon(
                          //   Icons.timelapse_rounded,
                          //   color: Colors.green,
                          // ),
                        ],
                      ),
                      // onTap: () => _selectedItem(item),
                    );
                  },
                )
          : // for serachView
          ListView.builder(
              itemCount: searchChatUserList.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: ValueKey(searchChatUserList[index]),
                  background: Container(
                    color: Colors.red,
                    child: const Icon(CupertinoIcons.delete),
                  ),
                  secondaryBackground: Container(
                    color: Colors.green,
                    child: const Icon(Icons.archive),
                  ),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      Container();
                      searchChatUserList.removeAt(index);
                    });
                  },
                  confirmDismiss: (DismissDirection direction) async {
                    return showDialog(
                        context: context,
                        useRootNavigator: true,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            alignment: Alignment.center,
                            backgroundColor: Colors.white,
                            title: const Center(
                                child: Text(
                              "Delete this chat?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            content: const Text(
                              "Are you sure you want to permanently delete this message?",
                              style: TextStyle(
                                  color: Color(0xFF7A7A7A),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                            actions: <Widget>[
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                    },
                                    style: const ButtonStyle(),
                                    child: const Text(
                                      'Yes, Delete',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                    child: VerticalDivider(
                                      endIndent: 0,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, false);
                                      },
                                      child: const Text(
                                        'No',
                                        style:
                                            TextStyle(color: Color(0xFF566476)),
                                      )),
                                ],
                              )
                            ],
                          );
                        });
                  },
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
                        //   userItem: searchChatUserList[index],
                        //   networkImageLink: 'https://source.unsplash.com/random?sig=$index',
                        // ),),);
                      },
                      child: GestureDetector(
                        onTap: () {
                          PopDialog().showProfilePictureDialog(context);
                        },
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(
                              'https://source.unsplash.com/random?sig=$index'),
                        ),
                      ),
                    ),
                    title: GestureDetector(
                        onTap: () {
                          setState(() {
                            // searchChatUserList.clear();
                            searchTextController.clear();
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPage(
                                userItem: {},
                                networkImageLink:
                                    'https://source.unsplash.com/random?sig=$index',
                              ),
                            ),
                          );
                        },
                        child: Text(searchChatUserList[index].name)),
                    subtitle:
                        Text("subtitle ${searchChatUserList[index].messageText}"),
                    trailing: Column(
                      children: [
                        Text(
                          "12.00${searchChatUserList[index].time}",
                          style: const TextStyle(color: Color(0xFFA8A7A7)),
                        ),
                        const Icon(
                          Icons.timelapse_rounded,
                          color: Colors.lightGreenAccent,
                        ),
                      ],
                    ),
                    // onTap: () => _selectedItem(item),
                  ),
                );
              },
            ),
    );
  }

  void doNothing(BuildContext context) {}
}
