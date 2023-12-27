
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tagifiles/model/chatUsersModel.dart';

class SingleUserProfile extends StatefulWidget {
  String userNetworkImage;
  // String userName;
  ChatUsers userItem;
  SingleUserProfile({super.key, required this.userItem,required this.userNetworkImage});

  @override
  State<SingleUserProfile> createState() => _SingleUserProfileState();
}

class _SingleUserProfileState extends State<SingleUserProfile> {
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
                  onTap: (){ Navigator.pop(context);},
                  child: const Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                ),
                SizedBox(width: 15,),
                Text("data",style: TextStyle(color: Colors.white,overflow: TextOverflow.ellipsis,fontSize: 18.5),),
              ],
            ),
            actions: [
               IconButton( onPressed: (){  }, icon: Icon(Icons.menu,color: Colors.white,),)
            ],
          ),
      
        body: Container(
          color: Color(0xFFEDEFF3),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                height: 300,
                width: double.maxFinite,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Stack(
                      children: [

                    CircleAvatar(radius: 75,backgroundImage: NetworkImage('https://source.unsplash.com/random'),),
                      Positioned(
                          bottom: 20,
                          right: 2,
                          child: Icon(Icons.edit))
                      ],
                    ),
                    Text("Shubham Prajapati",style: TextStyle(color: Color(0xFF566476),fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text("number/subName",style: TextStyle(color: Color(0xFFA8A7A7),fontSize: 14),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.call,size: 32,color: Color(0xFF707070),)),
                        SizedBox(width: 20,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.videocam_outlined,size: 32,color: Color(0xFF707070),)),
                      ],
                    )

                  ],
                ),
              ),
              SizedBox(height: 5,),
              Container(
                color: Colors.white,
                height: 80,
                width: double.infinity,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 18.0,left: 20,bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("About",style: TextStyle(color: Color(0xFFA8A7A7),fontSize: 14),),
                          SizedBox(height: 7,),
                          Text("Hey! there I am using Tagifiles",style: TextStyle(color: Color(0xFF414141),fontSize: 16),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5,),

              Container(
                color: Colors.white,
                height: 200,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 18.0,left: 20,bottom: 5,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Media",style: TextStyle(color: Color(0xFFFFA8A7A7),fontSize: 14),),
                          Icon(CupertinoIcons.chevron_right,size: 18,)
                        ],
                      ),
                      // Logic for Media
                  Container(
                      height: 150,
                      width: double.infinity,
                      child: media()),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Flexible(
                child: Container(
                  color: Colors.white,
                  height: 600,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(top: 18.0,left: 20,bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:<Widget> [
                        Row(children: [Icon(CupertinoIcons.star,color: Color(0xFF566476),),SizedBox(width: 10,),Text("Starred Message",style: TextStyle(color: Color(0xFF566476)),)],),
                        SizedBox(height: 10,),
                        Row(children: [Icon(CupertinoIcons.delete,color: Color(0xFFEE3E3E),),SizedBox(width: 10,),Text("Delete Chat",style: TextStyle(color: Color(0xFF566476)),)],),
                        SizedBox(height: 10,),
                        Row(children: [Icon(CupertinoIcons.nosign,color: Color(0xFFEE3E3E),),SizedBox(width: 10,),Text("Block Shubham Prajapati",style: TextStyle(color: Color(0xFF566476)),)],),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
              ),

            ],

          ),
        ),
      ),
    );
  }

  Widget media() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,crossAxisSpacing: 10,mainAxisSpacing: 10),
        itemCount: 3,
        itemBuilder: (context,index){

          return  Container(
              alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Image.network(widget.userNetworkImage,),);
        });

}

