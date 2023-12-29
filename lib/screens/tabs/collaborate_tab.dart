import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tagifiles/model/chatUsersModel.dart';
import '../chats/chat_page.dart';

class CollaboratePage extends StatefulWidget {
  const CollaboratePage({super.key
  });

  @override
  State<CollaboratePage> createState() => _CollaboratePageState();
}

class _CollaboratePageState extends State<CollaboratePage> {

  // List<Note> searchedItems = []; //.. here Note is model class

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

  // searching element from List2
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
                Icons.filter_list_outlined,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Scaffold(
            body: chatList(),
          )),
    );
  }

  // ChatList
  Widget chatList()=>
      ListView.builder(
        itemCount: chatUsers.length,
        itemBuilder: (BuildContext context,int index) {
          return Dismissible(
            key: ValueKey(chatUsers[index]),
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
                   useRootNavigator: false,
                   barrierDismissible: true,
                   builder: (BuildContext context) {
                 return AlertDialog(
                   backgroundColor: Colors.white,
                   title: Center(child: Text("Delete this chat?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
                   content: Text("Are you sure you want to permanently delete this message?",style: TextStyle(color: Color(0xFF7A7A7A),fontSize: 12,fontWeight: FontWeight.normal),),
                   actions:<Widget> [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         ElevatedButton(onPressed: (){ Navigator.pop(context,true);}, child: Text('Yes, Delete',style: TextStyle(color: Colors.red),),style: ButtonStyle(),),
                         ElevatedButton(onPressed: (){Navigator.pop(context,false);}, child: Text('No',style: TextStyle(color: Color(0xFF566476)),)),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
                    userItem: chatUsers[index],
                    networkImageLink: 'https://source.unsplash.com/random?sig=$index',
                  ),),);
                },
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(
                      'https://source.unsplash.com/random?sig=$index'),
                ),
              ),
              title: Text(chatUsers[index].name),
              subtitle: Text("subtitle ${chatUsers[index].messageText}"),
              trailing: Column(
                children: [
                  Text("12.00${chatUsers[index].time}"),
                  Icon(Icons.timelapse_rounded),
                ],
              ),
              // onTap: () => _selectedItem(item),
            ),
          );
        },
      );

  void doNothing(BuildContext context) {}
}
