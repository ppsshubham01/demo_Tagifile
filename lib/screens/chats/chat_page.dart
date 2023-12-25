import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tagifiles/model/chatUsersModel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF1D55A4),
      title: Row(
        children: [
          GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back,color: Colors.white,)),
          const CircleAvatar(radius: 18,backgroundImage: NetworkImage('https://source.unsplash.com/random'),),
           const SizedBox(height: 5,),
           const Flexible(child: Text("Shubham Prajapati shubham prajapati",style: TextStyle(color: Colors.white,overflow: TextOverflow.ellipsis),)),
        ],
      ),
        actions:const [
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Icon(Icons.call, color: Colors.white,),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Icon(Icons.videocam_outlined,color: Colors.white,),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Icon(Icons.menu,color: Colors.white,),
          ),
        ],
      ),

      body:   Container(
        color: Color(0xFF3B5DA0),
        child: Column(
          children: [
            Text("Chats"),
            Row(
              children: [
                Icon(Icons.circle_outlined,color: Colors.grey,),
                TextField(
                  onTap: (){},
                  decoration: InputDecoration(hintText: "Type a message"),
                  keyboardType: TextInputType.text,
                )

              ],
            )
          ],
        ),
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 9.0, ),
        height: 50,
        color: const Color(0xFFDE8A8A),
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5.0),
        child: Row(
          children: [
            const Icon(CupertinoIcons.plus_circle),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Type a Message",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.red)
                    )
                  ),
                ),
              ),
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_voice_outlined)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.send_outlined)),
          ],
        ),

      ),
      
    );
  }
}
