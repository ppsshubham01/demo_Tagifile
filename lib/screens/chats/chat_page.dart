import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tagifiles/model/chatMessageModel.dart';
import 'package:tagifiles/model/chatUsersModel.dart';
import 'package:tagifiles/screens/chats/userProfile/singleUserProfile.dart';
import 'package:tagifiles/screens/home_screen.dart';

class ChatPage extends StatefulWidget {
 String networkImageLink;
  ChatUsers userItem;
   ChatPage({super.key, required this.userItem, required this.networkImageLink});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final TextEditingController _chattypeTextController = TextEditingController();

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello Jaimin", messageType: "receiver"),
    ChatMessage(messageContent: "How are you!", messageType: "receiver"),
    ChatMessage(messageContent: "Hey dude!", messageType: "sender"),
    ChatMessage(messageContent: "Dp ma maal lage che hoo!", messageType: "receiver"),
    ChatMessage(messageContent: "aree re mara bhai!, ....kya che hmna?", messageType: "sender"),
    ChatMessage(messageContent: "tara ghar ni niche chai piva java na!", messageType: "receiver"),
    ChatMessage(messageContent: "areee🤩😲😲 surpice em!", messageType: "sender"),
    ChatMessage(messageContent: "niche avne topa jaldi late thay che.. Bov bdhi vat krvani che", messageType: "receiver"),
    ChatMessage(messageContent: "ayo ayo kapda peri lav😛😂😂", messageType: "sender"),
    ChatMessage(messageContent: "Hello Jaimin", messageType: "receiver"),
    ChatMessage(messageContent: "How are you!", messageType: "receiver"),
    ChatMessage(messageContent: "Hey dude!", messageType: "sender"),
    ChatMessage(messageContent: "Dp ma maal lage che hoo!", messageType: "receiver"),
    ChatMessage(messageContent: "aree re mara bhai!, ....kya che hmna?", messageType: "sender"),
    ChatMessage(messageContent: "tara ghar ni niche chai piva java na!", messageType: "receiver"),
    ChatMessage(messageContent: "areee🤩😲😲 surpice!", messageType: "sender"),
    ChatMessage(messageContent: "niche avne topa jaldi late thay che.. Bov bdhi vat krvani che", messageType: "receiver"),
    ChatMessage(messageContent: "ayo ayo kapda peri lav😛😂😂", messageType: "sender"),
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF1D55A4),
        title: Row(
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                  // Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back,color: Colors.white,)),
            const SizedBox(width: 5,),
            GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>  SingleUserProfile(
                userItem: widget.userItem,
                userNetworkImage: widget.networkImageLink,
              )));
              },
              child: CircleAvatar(radius: 20,backgroundImage:
              NetworkImage(widget.networkImageLink)
                ,),
            ),
             const SizedBox(width: 5,),
      
             Flexible(child: Padding(padding: const EdgeInsets.only(top: 10.0,bottom: 8.0),
               child: GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>  SingleUserProfile(userItem: widget.userItem,userNetworkImage: widget.networkImageLink,)));
                 },
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(widget.userItem.name,style: const TextStyle(color: Colors.white,overflow: TextOverflow.ellipsis,fontSize: 18.5),),
                     // Text("Online",style: TextStyle(color: Colors.grey, fontSize: 13),),
                   ],
                 ),
               ),
             ),
             ),
      
          ],
        ),
          actions: [
            SizedBox(
                width: 35,
                child: IconButton(onPressed: () {  }, icon: const Icon(Icons.call,color: Colors.white,size: 20,),)),
            SizedBox(
                width: 35,
                child: IconButton(onPressed: () {  }, icon: const Icon(Icons.videocam_outlined,color: Colors.white,size: 20,),)),
            SizedBox(
                width: 35,
                child: IconButton(onPressed: () {  }, icon: const Icon(Icons.more_vert,color: Colors.white,size: 20,),)),
          ],
        ),
      
        body:   SingleChildScrollView(
          child: Container(
            color: const Color(0xFDFEDEFF3),
            child: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  ListView.builder(
                    itemCount: messages.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      itemBuilder: (context, index){
                      return Container(
                        padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                        child: GestureDetector(
                          onLongPress: (){
                            showDialog(context: context,
                              builder: (context) {
                            return AlertDialog(title: Text('Hi!'),);
                              },
                            );
                          },
                          child: Align(
                            alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                  color: (messages[index].messageType=="receiver"?Colors.white:Color(0xFFE1E5EE))
                              ),
                              padding: EdgeInsets.all(16),
                              child: Text(messages[index].messageContent,style: TextStyle(fontSize: 15),),
                            ),
                          ),
                        ),
                      );
                
                  })
                ],
              ),
            ),
          ),
        ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          // height: 60,
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: (){
                },
                child: Container(
                  height: 30,
                  width: 30,
                  child:Icon(CupertinoIcons.plus_circle),

                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: TextField(
                    minLines: 1,
                    maxLines: 2,
                    keyboardType: TextInputType.text,
                    controller: _chattypeTextController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                        hintText: "Type a Message",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        // borderSide: BorderSide(color: Colors.red)
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
      
      ),
    );
  }
}
