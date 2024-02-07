import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tagifiles/model/chatUsersModel.dart';
import 'package:tagifiles/model/collaborateModel.dart';
import 'package:tagifiles/screens/chats/chat_page.dart';

import '../../../provider/auth_provider.dart';
import '../../../util/dialog_box.dart';

class CollaboratePage extends StatefulWidget {
  const CollaboratePage({super.key
  });

  @override
  State<CollaboratePage> createState() => _CollaboratePageState();
}

class _CollaboratePageState extends State<CollaboratePage> {


  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", image: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "Glady's Murphy", messageText: "That's Great", image: "images/userImage2.jpeg", time: "Yesterday"),
    ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", image: "images/userImage3.jpeg", time: "31 Mar"),
    ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", image: "images/userImage4.jpeg", time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", image: "images/userImage5.jpeg", time: "23 Mar"),
    ChatUsers(name: "Jacob Pena", messageText: "will update you in evening", image: "images/userImage6.jpeg", time: "17 Mar"),
    ChatUsers(name: "Andrey Jones", messageText: "Can you please share the file?", image: "images/userImage7.jpeg", time: "24 Feb"),
    ChatUsers(name: "John Wick", messageText: "How are you?", image: "images/userImage8.jpeg", time: "18 Feb"),
    ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", image: "images/userImage3.jpeg", time: "31 Mar"),
    ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", image: "images/userImage4.jpeg", time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", image: "images/userImage5.jpeg", time: "23 Mar"),
    ChatUsers(name: "Jacob Pena", messageText: "will update you in evening", image: "images/userImage6.jpeg", time: "17 Mar"),
    ChatUsers(name: "Andrey Jones", messageText: "Can you please share the file?", image: "images/userImage7.jpeg", time: "24 Feb"),
  ];

  List<ChatUsers> searchChatUserList = [];

  void searchingElements(String text) {

    setState(() {
      searchChatUserList.clear();
    });

    if (text.isNotEmpty || text != '') {
      for (var element in chatUsers) {
        if (element.name.toLowerCase().contains(
            text.toLowerCase().trim().replaceAll(RegExp(r'\b\s+\b'), ''))) {
          // print(element.title);
          searchChatUserList.add(element);
        }
      }
      setState(() {});

    }
    //print(text.trim());
    // print(searchedItems.length);
  }

  final TextEditingController searchTextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AuthProvider>(context,listen: false).collaborateModelProvider();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final finalCollaborateData = Provider.of<AuthProvider>(context);
    // print(finalCollaborateData);

    return Scaffold(
      appBar:  AppBar(
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
                controller: searchTextController,
                onChanged: (value) => searchingElements(value),
                style: const TextStyle(overflow: TextOverflow.fade),
                decoration: InputDecoration(
                    hintText: 'Search..',
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide:
                        const BorderSide(color: Colors.white, width: 2.0)
                    ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
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

      body: SafeArea(
          child: Scaffold(
            body: chatList(finalCollaborateData),
              // The argument type 'Map<String, dynamic>' can't be assigned to the parameter type 'CollaborateModel'.// goted this type of errot how to handle this Learn
          )),
    );
  }

//   CollaborateModel createCollaborateModel(Map<String, dynamic> data) {
//     return CollaborateModel.fromJson(data);
//
// // Your chatList function
//   Widget chatList(CollaborateModel collaborateModel) {
//   body: chatList(createCollaborateModel(fetchedCollaborateData)),


  // ChatList
  Widget chatList(AuthProvider finalData) {
    return searchChatUserList.isEmpty ? finalData.fetchedCollaborateData['individuals'] == null ? const Center(
      child: CircularProgressIndicator(),
    ) :  ListView.builder(
      // itemCount: finalData.fetchedCollaborateData.data?.individuals.length,
      itemCount: (finalData.fetchedCollaborateData['individuals'] as List<Map<String, dynamic>>).length,
      itemBuilder: (BuildContext context,int index) {
        return Dismissible(
          key: ValueKey(finalData.fetchedCollaborateData['individuals'][index]),
          background: Container(
            color: Colors.red,
            child: const Icon(CupertinoIcons.delete),
          ),
          secondaryBackground: Container(
            color: Colors.green,
            child: const Icon(Icons.archive),
          ),
          onDismissed:(DismissDirection direction){
            setState(() {
              Container();
              chatUsers.removeAt(index);
            });
          },
          confirmDismiss: (DismissDirection direction) async {
            return showDialog(context: context,
                useRootNavigator: true,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return AlertDialog(
                    alignment: Alignment.center,
                    backgroundColor: Colors.white,
                    title: const Center(child: Text("Delete this chat?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
                    content: const Text("Are you sure you want to permanently delete this message?",style: TextStyle(color: Color(0xFF7A7A7A),fontSize: 12,fontWeight: FontWeight.normal),),

                    actions:<Widget> [
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(onPressed: (){ Navigator.pop(context,true);},style: const ButtonStyle(), child: const Text('Yes, Delete',style: TextStyle(color: Colors.red),),),
                          const SizedBox(
                            height: 50,
                            child: VerticalDivider(endIndent: 0,),),
                          TextButton(onPressed: (){Navigator.pop(context,false);}, child: const Text('No',style: TextStyle(color: Color(0xFF566476)),)),
                        ],
                      )
                    ],
                  );
                }

            );
          },
          child: ListTile(
            leading: GestureDetector(
              onTap: (){
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
                onTap: (){
                  setState(() {
                    // searchChatUserList.clear();
                    searchTextController.clear();
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
                    userItem: chatUsers[index],
                    networkImageLink: 'https://source.unsplash.com/random?sig=$index',
                  ),),);
                },
                child: Text(finalData.fetchedCollaborateData['individuals'][index]['firstName'] ?? 'nullData')),
                // child: Text(finalData.collaborateData.data?.individuals[index] .firstName ?? 'nullData')),
            subtitle: Text("subtitle ${finalData.fetchedCollaborateData['individuals'][index]['username']}"),
            // subtitle: Text("subtitle ${finalData.collaborateData.data?.individuals[index].username}"),
            trailing: Column(
              children: [
                Text("12.00${finalData.collaborateData.data?.individuals[index].lastMessageActivity}"),
                const Icon(Icons.timelapse_rounded),
              ],
            ),
            // onTap: () => _selectedItem(item),
          ),
        );
      },
    ) :// for serachView
    ListView.builder(
      itemCount: searchChatUserList.length,
      itemBuilder: (BuildContext context,int index) {
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
          onDismissed:(DismissDirection direction){
            setState(() {
              Container();
              searchChatUserList.removeAt(index);
            });
          },
          confirmDismiss: (DismissDirection direction) async {
            return showDialog(context: context,
                useRootNavigator: true,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return AlertDialog(
                    alignment: Alignment.center,
                    backgroundColor: Colors.white,
                    title: const Center(child: Text("Delete this chat?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
                    content: const Text("Are you sure you want to permanently delete this message?",style: TextStyle(color: Color(0xFF7A7A7A),fontSize: 12,fontWeight: FontWeight.normal),),

                    actions:<Widget> [
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(onPressed: (){ Navigator.pop(context,true);},style: const ButtonStyle(), child: const Text('Yes, Delete',style: TextStyle(color: Colors.red),),),
                          const SizedBox(
                            height: 50,
                            child: VerticalDivider(endIndent: 0,),),
                          TextButton(onPressed: (){Navigator.pop(context,false);}, child: const Text('No',style: TextStyle(color: Color(0xFF566476)),)),
                        ],
                      )
                    ],
                  );
                }

            );
          },
          child: ListTile(
            leading: GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
                //   userItem: searchChatUserList[index],
                //   networkImageLink: 'https://source.unsplash.com/random?sig=$index',
                // ),),);
              },
              child: GestureDetector(
                onTap: (){
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
                onTap: (){
                  setState(() {
                    // searchChatUserList.clear();
                    searchTextController.clear();
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
                    userItem: searchChatUserList[index],
                    networkImageLink: 'https://source.unsplash.com/random?sig=$index',
                  ),),);
                },
                child: Text(searchChatUserList[index].name)),
            subtitle: Text("subtitle ${searchChatUserList[index].messageText}"),
            trailing: Column(
              children: [
                Text("12.00${searchChatUserList[index].time}",style: const TextStyle(color: Color(0xFFA8A7A7)),),
                const Icon(Icons.timelapse_rounded,color: Colors.lightGreenAccent,),
              ],
            ),
            // onTap: () => _selectedItem(item),
          ),
        );
      },
    );
  }

  void doNothing(BuildContext context) {}
}
